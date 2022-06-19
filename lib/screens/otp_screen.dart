import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sports_shopping_app/screens/main_screens.dart';
import 'package:sports_shopping_app/screens/signup.dart';

import '../data/api/api.dart';

enum Status { Waiting, Error }

enum MobileVerificationState {
  SHOW_MOBILE_FORM_STATE,
  SHOW_OTP_FORM_STATE,
}

class OTPScreen extends StatefulWidget {
  final number;
  OTPScreen({required this.number});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  //Status _status = Status.Waiting;
  MobileVerificationState currentState =
      MobileVerificationState.SHOW_MOBILE_FORM_STATE;

  final _OtpController = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    _verifyPhoneNumber();
  }
  late String verificationId;
  bool showLoading = false;

  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    setState(() {
      showLoading = true;
    });

    try {
      final authCredential =
          await _auth.signInWithCredential(phoneAuthCredential);

      setState(() {
        showLoading = false;
      });

      if (authCredential.user != null) {
        print("Hello");
        //   Navigator.push(
        //       context, MaterialPageRoute(builder: (context) => MainScreen()));
        var data = {
          'username': usernameController.text,
          // 'location': locationController.text,
          'phone_number': phonenumberController.text,
          'password': passwordController.text,
          'password_confirmation': passwordConfirmController.text,
        };

        var res = await CallApi().postData(data, 'register');
        var body = json.decode(res.body);
        print(body);
        if (body['statusCode'] == 200) {
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
      //     .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  Future _verifyPhoneNumber() async {
    await _auth.verifyPhoneNumber(
        phoneNumber: widget.number,
        timeout: Duration(seconds: 60),
        verificationCompleted: (phonesAuthCredentials) async {},
        verificationFailed: (verificationFailed) async {},
        codeSent: (verificationId, resendingToken) async {
          setState(() {
            this.verificationId = verificationId;
          });
        },
        codeAutoRetrievalTimeout: (verificationId) async {});
  }

  Future _sendCodeToFirebase({String? code}) async {
    PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: code!);
    print(code);
    await _auth
        .signInWithCredential(phoneAuthCredential)
        .then((val) {
          Navigator.push(
              context, MaterialPageRoute(builder: (ctx) => MainScreen()));
        })
        .whenComplete(() {})
        .onError((error, stackTrace) {
          setState(() {
            _OtpController.text;
            currentState = MobileVerificationState.SHOW_OTP_FORM_STATE;
          });
        });
  }

  getOtpFormWidget(context) {
    return Column(
      children: [
        Spacer(),
        TextField(
          controller: _OtpController,
          decoration: InputDecoration(
            hintText: "Enter OTP",
          ),
        ),
        SizedBox(
          height: 16,
        ),
        FlatButton(
          onPressed: () async {
            PhoneAuthCredential phoneAuthCredential =
                PhoneAuthProvider.credential(
                    verificationId:  verificationId.toString(),
                    smsCode: _OtpController.text);

            signInWithPhoneAuthCredential(phoneAuthCredential);
          },
          child: Text("VERIFY"),
          color: Colors.blue,
          textColor: Colors.white,
        ),
        Spacer(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
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
                    smsCode: _OtpController.text);
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
                    controller: _OtpController,
                    length: 6,
                    onChanged: (val) {
                      print(val);
                      _sendCodeToFirebase();
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
                // RichText(
                //   textAlign: TextAlign.center,
                //   text: TextSpan(
                //       text: "Didn't receive the code? ",
                //       style: TextStyle(color: Colors.black54, fontSize: 15),
                //       children: [
                //         TextSpan(
                //             text: " RESEND",
                //             //recognizer: ,
                //             style: TextStyle(
                //                 color: Color(0xFF91D3B3),
                //                 fontWeight: FontWeight.bold,
                //                 fontSize: 16))
                //       ]),
                // ),
                SizedBox(height: size.height / 15),
                submitButton,
              ],
            ),
          ),
        ),
      )),
    );
  }
}
