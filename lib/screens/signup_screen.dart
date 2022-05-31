import 'package:flutter/material.dart';
import 'package:sports_shopping_app/screens/login_screen.dart';
import 'package:sports_shopping_app/widgets/signup_to_login.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

final _formkey = GlobalKey<FormState>();
String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
RegExp regExp = RegExp(p);

final userNameEditingController = TextEditingController();
final TextEditingController locationController = TextEditingController();
final TextEditingController phonenumberController = TextEditingController();
final passwordEditingController = TextEditingController();

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    final userNameField = TextFormField(
      autofocus: false,
      controller: userNameEditingController,
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Username cannot be Empty");
        }
        return null;
      },
      onSaved: (value) {
        userNameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.account_circle),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Username",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    final locationField = TextFormField(
      autofocus: false,
      controller: locationController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        // if (value!.isEmpty) {
        //   return ("Please Fill Your Email");
        // }
        // // reg expression for email validation
        // if (!regExp.hasMatch(value)) {
        //   return ("Please Fill a valid email");
        // }
        // return null;
      },
      onSaved: (value) {
        locationController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.location_on),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Location",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
    final phonenumberField = TextFormField(
        autofocus: false,
        controller: phonenumberController,
        validator: (value) {
          RegExp regex = RegExp(r'^.{6,}$');
          if (value!.isEmpty) {
            return ("Password is required for login");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid Password(Min. 6 Character)");
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
            borderRadius: BorderRadius.circular(10),
          ),
        ));
    final passwordField = TextFormField(
        autofocus: false,
        controller: passwordEditingController,
        obscureText: true,
        validator: (value) {
          RegExp regex = RegExp(r'^.{6,}$');
          if (value!.isEmpty) {
            return ("Password is required for login");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid Password(Min. 6 Character)");
          }
        },
        onSaved: (value) {
          userNameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.vpn_key),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    final signUpButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.blueAccent,
      child: MaterialButton(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            //signUp(emailEditingController.text, passwordEditingController.text);
          },
          child: const Text(
            "SignUp",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );
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
                      //shape: BoxShape.circle,
                      // color: Colors.white,
                      image: DecorationImage(
                    image: AssetImage("asset/images/logo.png"),
                    fit: BoxFit.cover,
                  )),
            ),
            //child: Text("Phteas Keila", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
          
          ),
        Positioned(
            child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formkey,
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
                    locationField,
                    const SizedBox(
                      height: 20.0,
                    ),
                    phonenumberField,
                    const SizedBox(
                      height: 20.0,
                    ),
                    passwordField,
                    const SizedBox(
                      height: 20.0,
                    ),
                    signUpButton,
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
        ))
      ]),
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
