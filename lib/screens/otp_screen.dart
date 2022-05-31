import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sports_shopping_app/screens/main_screens.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
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
            Navigator.push(
                context, MaterialPageRoute(builder: (ctx) => MainScreen()));
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
                  height: size.height / 18,
                  width: size.width / 1.2,
                  child: PinCodeTextField(
                    appContext: context,
                    // controller: controller.otp,
                    length: 6,
                    onChanged: (val) {},
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
                submitButton,
              ],
            ),
          ),
        ),
      )),
    );
  }
}
