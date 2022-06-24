import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sports_shopping_app/screens/main_screens.dart';
import 'package:sports_shopping_app/widgets/signup_to_login.dart';
import '../data/api/api.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phonenumberController = TextEditingController();

  var phonemask = MaskTextInputFormatter(
      mask: '(+855)##-###-####',
      filter: {"#": RegExp(r'[+,(),0-9]')},
      type: MaskAutoCompletionType.lazy);

  @override
  Widget build(BuildContext context) {
    final phonenumberField = TextFormField(
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
      )
    );

    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordController,
      obscureText: true,
      validator: (value) {
        RegExp regex = RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Password cannot empty!");
        } else if (!regex.hasMatch(value)) {
          return ("Please Enter Valid Password(Min. 6 Character)");
        } else if (value != passwordController.text) {
          return ("Password is not match");
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

    bool _isLoading = false;
    void _login() async {
      setState(() {
        _isLoading = true;
      });

      var data = {
        'phone_number': phonenumberController.text,
        'password': passwordController.text
      };

      var res = await CallApi().postData(data, 'login');
      final body = json.decode(res.body);
      print(body);
      if (_formKey.currentState!.validate() && body['statusCode'] == 200) {
        print("successful login");
        SharedPreferences localStorage = await SharedPreferences.getInstance();
        localStorage.setString('access_token', body['access_token'].toString());
        localStorage.setString('user', json.encode(body['user']));
        print(body['user']);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const MainScreen()));
      } else {
        //  showCustomSnackBar("Fail sucees",  "login again");
        //SnackBarPage;
        // _showMsg('not');
        print("not success");
      }

      setState(() {
        _isLoading = false;
      });
    }

    return Scaffold(
      body: Stack(children: <Widget>[
    ClipPath(
      clipper: DrawClip1(),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
          colors: [Color(0xff03a9f4), Color(0xff004ba0)],
          begin: Alignment.centerRight,
          end: Alignment(-1.0, -1.0),
        )),
      ),
    ),
    ClipPath(
      clipper: DrawClip(),
      child: Container(
        decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff03a9f4), Color(0xff004ba0)],
                begin: Alignment.topLeft,
                end: Alignment.bottomLeft
              )),
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
      SingleChildScrollView(
        child: Container(
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
                        height: 250,
                      ),
                      phonenumberField,
                      // emailField,
                      const SizedBox(
                        height: 20.0,
                      ),
                      passwordField,
                      const SizedBox(
                        height: 20.0,
                      ),
                      Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.blueAccent,
                        child: MaterialButton(
                          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                          minWidth: MediaQuery.of(context).size.width,
                          onPressed: () {
                            _login();
                          },
                          child: const Text(
                            "Login",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                            )),
                      ),

                      const SizedBox(
                        height: 15.0,
                      ),
                      SignUpToLogin(
                        account: "I don't have an account!",
                        onTap: () {
                          Navigator.pop(context);
                        },
                        name: "sign up",
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ]));
  }
}

class DrawClip1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // implement getClip
    Path path = Path();
    path.addOval(
        Rect.fromCircle(center: Offset(size.width, 50.0), radius: 150));
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // implement shouldReclip
    return true;
  }
}

class DrawClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // implement getClip
    Path path = Path();
    path.addOval(
        Rect.fromCircle(center: Offset(size.width * 0.3, 50.0), radius: 200));
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // implement shouldReclip
    return true;
  }
}
