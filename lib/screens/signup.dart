import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sports_shopping_app/screens/login_screen.dart';
import 'package:sports_shopping_app/screens/otp_screen.dart';

import '../data/api/api.dart';
import '../widgets/big_text.dart';
import '../widgets/signup_to_login.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

final _formKey = GlobalKey<FormState>();
FirebaseAuth _auth = FirebaseAuth.instance;

var usernameController = TextEditingController();
//var locationController = TextEditingController();
var phonenumberController = TextEditingController();
var passwordController = TextEditingController();
var passwordConfirmController = TextEditingController();
bool _isLoading = false;
var phonemask = MaskTextInputFormatter(
    mask: '+855##-###-####',
    filter: {"#": RegExp(r'[+,0-9]')},
    type: MaskAutoCompletionType.lazy);
//var _verificationId;

class _SignupState extends State<Signup> {
  // set _verificationId(String verificationId) {

  // }

  @override
  Widget build(BuildContext context) {
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

    // var locationField = TextField(
    //   autofocus: false,
    //   controller: locationController,
    //   keyboardType: TextInputType.emailAddress,
    // validator: (value) {
    //   // if (value!.isEmpty) {
    //   //   return ("Please Fill Your Email");
    //   // }
    //   // // reg expression for email validation
    //   // if (!regExp.hasMatch(value)) {
    //   //   return ("Please Fill a valid email");
    //   // }
    //   // return null;
    // },
    // onSaved: (value) {
    //   locationController.text = value!;
    // },
    //   textInputAction: TextInputAction.next,
    //   decoration: InputDecoration(
    //     prefixIcon: const Icon(Icons.location_on),
    //     contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
    //     hintText: "Location",
    //     border: OutlineInputBorder(
    //       borderRadius: BorderRadius.circular(10),
    //     ),
    //   ),
    // );

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
    bool showLoading = false;
    String verificationId;
    _registration() async {
      setState(() {
        showLoading = true;
      });

      await _auth.verifyPhoneNumber(
        phoneNumber: phonenumberController.text,
        verificationCompleted: (phoneAuthCredential) async {
          setState(() {
            showLoading = false;
          });
          //signInWithPhoneAuthCredential(phoneAuthCredential);
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
            //currentState = MobileVerificationState.SHOW_OTP_FORM_STATE;
            verificationId = verificationId;
          });
        },
        codeAutoRetrievalTimeout: (verificationId) async {},
      );
      //  var data = {
      //   'username': usernameController.text,
      //   // 'location': locationController.text,
      //   'phone_number': phonenumberController.text,
      //   'password': passwordController.text,
      //   'password_confirmation': passwordConfirmController.text,
      // };

      // var res = await CallApi().postData(data, 'register');
      // var body = json.decode(res.body);
      // print(body);
      // if (_formKey.currentState!.validate() && body['statusCode'] == 200) {
      //   SharedPreferences localStorage = await SharedPreferences.getInstance();
      //   print("success");
      //   // localStorage.setString('token', body['token'].toString());
      //   // localStorage.setString('users', json.encode(body['users']));
      //   print(body['user']);

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => OTPScreen(
                    number: phonenumberController,
                  )));
      // } else {
      //   print(" not success");
      // }

      // setState(() {
      //   showLoading = false;
      // });
    }

    return Scaffold(
        body: Stack(children: <Widget>[
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
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage("asset/images/logo.png"),
            fit: BoxFit.cover,
          )),
        ),
      ),
      Positioned(
        child: Center(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
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
                        //  _verifyPhoneNumber;
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
    ]));
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
