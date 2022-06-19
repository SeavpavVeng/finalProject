import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sports_shopping_app/screens/login_screen.dart';
import 'package:sports_shopping_app/screens/main_screens.dart';

import '../data/api/api.dart';
import '../widgets/big_text.dart';
import '../widgets/signup_to_login.dart';

enum MobileVerificationState {
  SHOW_MOBILE_FORM_STATE,
  SHOW_OTP_FORM_STATE,
}

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  MobileVerificationState currentState =
      MobileVerificationState.SHOW_MOBILE_FORM_STATE;

  final usernameController = TextEditingController();
  //var locationController = TextEditingController();
  final phonenumberController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();
  final otpController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();

  late String verificationId;
  bool showLoading = false;

  var phonemask = MaskTextInputFormatter(
      mask: '+855##-###-####',
      filter: {"#": RegExp(r'[+,0-9]')},
      type: MaskAutoCompletionType.lazy);

  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    setState(() {
      showLoading = true;
    });
    try {
      final authCredential =
          await auth.signInWithCredential(phoneAuthCredential);
      setState(() {
        showLoading = false;
      });

      if (authCredential.user != null) {
        var data = {
          'username': usernameController.text,
          // 'location': locationController.text,
          'phone_number': phonenumberController.text,
          'password': passwordController.text,
          'password_confirmation': passwordConfirmController.text,
        };

        var res = await CallApi().postData(data, 'register');
        var body = json.decode(res.body);
        if (_formKey.currentState!.validate() && body['statusCode'] == 200) {
          SharedPreferences localStorage =
              await SharedPreferences.getInstance();
          print("success");
          // localStorage.setString('token', body['token'].toString());
          // localStorage.setString('users', json.encode(body['users']));
          print(body['user']);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MainScreen()));
        } else {
          print(" not success");
        }

        setState(() {
          showLoading = false;
        });
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        showLoading = false;
      });

      // _scaffoldKey.currentState
      // .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  getMobileFromWidget(context) {
    var userNameField = TextFormField(
      autofocus: false,
      controller: usernameController,
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Username cannot empty!");
        } else {
          return null;
        }
      },
      onSaved: (value) {
        usernameController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.account_circle),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Username",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );

    var phonenumberField = TextFormField(
        inputFormatters: [phonemask],
        autofocus: false,
        controller: phonenumberController,
        validator: (value) {
          RegExp regex = RegExp(r'^.[+]*[(]{0}[0-9]{1,4}[)]{0,1}[-\s\./0-9]+$');
          if (value!.isEmpty) {
            return ("Phone Number cannot empty!");
          } else if (!regex.hasMatch(value)) {
            return ("Please correct phone number!");
          } else if (value.length < 9 && value.length > 10) {
            return ("Phone number must be between 9 and 10 number");
          } else {
            return null;
          }
        },
        onSaved: (value) {
          phonenumberController.text = value!;
        },
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.phone),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Phone Number",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ));

    var passwordField = TextFormField(
        autofocus: false,
        controller: passwordController,
        obscureText: true,
        validator: (value) {
          RegExp regex = RegExp(r'^.{6,}$');
          if (value!.isEmpty) {
            return ("Password cannot empty!");
          }
          if (!regex.hasMatch(value)) {
            return ("Please Enter Valid Password(Min. 6 Character)");
          }
        },
        onSaved: (value) {
          passwordController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.vpn_key),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ));
    var confirmpasswordField = TextFormField(
        autofocus: false,
        controller: passwordConfirmController,
        obscureText: true,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Password cannot empty!");
          } else if (value != passwordController.text) {
            return ("Password is not match!");
          } else {
            return null;
          }
        },
        onSaved: (value) {
          passwordController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.vpn_key),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Confirm Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ));
    _registration() async {
      setState(() {
        showLoading = true;
      });
      var data = {
          'username': usernameController.text,
          // 'location': locationController.text,
          'phone_number': phonenumberController.text,
          'password': passwordController.text,
          'password_confirmation': passwordConfirmController.text,
        };

        var res = await CallApi().postData(data, 'register');
        var body = json.decode(res.body);
        if (_formKey.currentState!.validate() && body['statusCode'] == 200) {
          SharedPreferences localStorage =
              await SharedPreferences.getInstance();
          localStorage.setString('access_token', body['access_token'].toString());
          localStorage.setString('user', json.encode(body['user']));
          print(body['user']);
         
        } else {
          print(" not success");
        }

        setState(() {
          showLoading = false;
        });
      

      await auth.verifyPhoneNumber(
        phoneNumber: phonenumberController.text,
        verificationCompleted: (phoneAuthCredential) async {
          setState(() {
            showLoading = false;
          });
        },
        verificationFailed: (verificationFailed) async {
          setState(() {
            showLoading = false;
          });
          // _scaffoldKey.currentState.showSnackBar(
          //     SnackBar(content: Text(verificationFailed.message)));
        },
        codeSent: (verificationId, resendingToken) async {
          setState(() {
            showLoading = false;
            currentState = MobileVerificationState.SHOW_OTP_FORM_STATE;
            this.verificationId = verificationId;
          });
        },
        codeAutoRetrievalTimeout: (verificationId) async {},
      );

      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) => OTPScreen(
      //               number: phonenumberController,
      //             )));
    }

    return Stack(children: <Widget>[
      Positioned(
        child: ClipPath(
          clipper: HeaderClipper(),
          child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              colors: [Color(0xff03a9f4), Color(0xff004ba0)],
              begin: Alignment.centerRight,
              end: Alignment(-1.0, -1.0),
            )),
          ),
        ),
      ),
      Center(
        heightFactor: 4,
        child: Container(
          height: 60,
          width: 300,
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage("asset/images/logo.png"),
            fit: BoxFit.cover,
          )),
        ),
      ),
      Positioned(
        child: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 250.0,
                    ),
                    userNameField,
                    const SizedBox(
                      height: 20.0,
                    ),
                    // locationField,
                    // const SizedBox(
                    //   height: 20.0,
                    // ),

                    phonenumberField,

                    const SizedBox(
                      height: 20.0,
                    ),
                    passwordField,
                    const SizedBox(
                      height: 20.0,
                    ),
                    confirmpasswordField,
                    const SizedBox(
                      height: 20.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        
                          _registration();
                       
                      },
                      child: Container(
                        width: 350,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.blueAccent,
                        ),
                        child: Center(
                          child: BigText(
                            text: "Register",
                            size: 24,
                            color: Colors.white,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    SignUpToLogin(
                      account: "I have an account!",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (ctx) => const LoginScreen()),
                        );
                      },
                      name: "Login",
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      )
    ]);
  }

  getOtpFromWidget(context) {
    final Size size = MediaQuery.of(context).size;
    final submitButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.blueAccent,
      child: MaterialButton(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: size.width / 3,
          onPressed: () {
            PhoneAuthCredential phoneAuthCredential =
                PhoneAuthProvider.credential(
                    verificationId: verificationId,
                    smsCode: otpController.text);
            signInWithPhoneAuthCredential(phoneAuthCredential);
            //   Navigator.push(
            //       context, MaterialPageRoute(builder: (ctx) => MainScreen()));
          },
          child: const Text(
            "Verify",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );
    return Container(
      color: Colors.blueAccent,
      child: SafeArea(
          child: Scaffold(
        body: SizedBox(
          height: size.height,
          width: size.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    height: size.height / 7,
                    width: size.width / 3,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xff03a9f4), Color(0xff004ba0)],
                        begin: Alignment.centerRight,
                        end: Alignment(-1.0, -1.0),
                      ),
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(1000),
                      ),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        size: size.width / 12,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height / 22,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: "Verify your\n Phone Number\n",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: size.width / 12,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text:
                            "Enter the OTP that you have\n recieved through SMS",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: size.width / 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: size.height / 15),
                SizedBox(
                  // height: size.height / 18,
                  height: size.height / 5,
                  width: size.width / 1.2,
                  // child: getOtpFormWidget(context),
                  child: PinCodeTextField(
                    appContext: context,
                    controller: otpController,
                    length: 6,
                    onChanged: (val) {
                      print(val);
                    },
                    onCompleted: (val) {
                      print("Completed");
                    },
                    pinTheme: PinTheme(
                        activeColor: Colors.blueAccent,
                        inactiveColor: Colors.blueAccent,
                        selectedColor: Colors.red,
                        shape: PinCodeFieldShape.circle,
                        fieldHeight: size.height / 18,
                        fieldWidth: size.width / 8),
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(
                  height: size.height / 10,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                      text: "Didn't receive the code? ",
                      style: TextStyle(color: Colors.black54, fontSize: 15),
                      children: [
                        TextSpan(
                            text: " RESEND",
                            //recognizer: ,
                            style: TextStyle(
                                color: Color(0xFF91D3B3),
                                fontWeight: FontWeight.bold,
                                fontSize: 16))
                      ]),
                ),
                SizedBox(height: size.height / 15),
                submitButton,
              ],
            ),
          ),
        ),
      )),
    );
  }

 // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       // key: _scaffoldKey,
        body: passwordConfirmController == showLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : currentState == MobileVerificationState.SHOW_MOBILE_FORM_STATE
                  ? getMobileFromWidget(context)
                  : getOtpFromWidget(context),
          
        );
  }
}

class HeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.lineTo(0.0, size.height - 400);

    var firstEndPoint = Offset(size.width * 0.5, size.height - 450.0);
    var firstControlpoint = Offset(size.width * 0.25, size.height - 470.0);
    path.quadraticBezierTo(firstControlpoint.dx, firstControlpoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 520.0);
    var secondControlPoint = Offset(size.width * 0.75, size.height - 430);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
