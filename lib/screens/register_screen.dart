import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sports_shopping_app/base/snackbar.dart';
import 'package:sports_shopping_app/models/signup_body_model.dart';
import 'package:sports_shopping_app/screens/main_screens.dart';
import 'package:sports_shopping_app/widgets/app_text_field.dart';

import '../base/show_custom_snackbar.dart';
import '../controllers/auth_controller.dart';
import '../data/api/api.dart';
import '../widgets/big_text.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var usernameController = TextEditingController();
    //var locationController = TextEditingController();
    var phoneController = TextEditingController();
    var passwordController = TextEditingController();
    var confirmpasswordController = TextEditingController();

    void _registration() {
      var authController = Get.find<AuthController>();
      String username = usernameController.text.trim();
      // String location = locationController.text.trim();
      String phonenumber = phoneController.text.trim();
      String password = passwordController.text.trim();
      String confirmpassword = passwordController.text.trim();

      // if (username.isEmpty) {
      //   return showCustomSnackBar("Type your name", "Name");

      // }
      // else if (location.isEmpty) {
      //   showCustomSnackBar("Type your location", title: "Location");
      // } else if (phone.isEmpty) {
      //   showCustomSnackBar("Type your phone number ", title: "Phonenumber");
      // } else if (password.isEmpty) {
      //   showCustomSnackBar("Type in your password", title: "password");
      // } else if (password.length < 6) {
      //   showCustomSnackBar("Password can not be less than six characters",
      //       title: "Password");
      // }
      //else {
      // showCustomSnackBar("All went well",  "Perfect");
      SignUpBody signUpBody = SignUpBody(
          username: username,
          phone: phonenumber,
          password: password,
          confirmpassword: confirmpassword);
      print(signUpBody.toString());
      authController.registration(signUpBody).then((status) {
        if (_formKey.currentState!.validate() && status.success) {
          print("Success registration");
        } else {
          print("Error message");
          // showCustomSnackBar(status.message);
        }
      });
    }
    // }

    // bool _isLoading = false;
    // void _registration() async {
    //   setState(() {
    //     _isLoading = true;
    //   });

    // var data = {
    //   'username': usernameController.text,
    //   // 'location': locationController.text,
    //   'phone_number': phoneController.text,
    //   'password': passwordController.text,
    //   'password_confirmation': passwordConfirmController.text,
    // };

    // var res = await CallApi().postData(data, 'register');
    // var body = json.decode(res.body);
    // print(body);
    // if (body['statusCode'] == 200) {
    //   SharedPreferences localStorage = await SharedPreferences.getInstance();
    //   print("success");
    //   // localStorage.setString('token', body['token'].toString());
    //   // localStorage.setString('users', json.encode(body['users']));
    //   print(body['users']);

    //   Navigator.push(
    //       context, MaterialPageRoute(builder: (context) => MainScreen()));
    // } else {
    //   print(" not success");
    // }

    // setState(() {
    //   _isLoading = false;
    // });
    //}

    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
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
              // TextFormField(
              //     controller: usernameController,
              //     validator: (value) {

              // },
              // ),
              // AppTextField(

              //     hintText: "Username",
              //     icon: Icons.account_circle),
              // SizedBox(
              //   height: 20,
              // ),
              // // AppTextField(
              // //     textController: locationController,
              // //     hintText: "location",
              // //     icon: Icons.location_on),
              // // SizedBox(
              // //   height: 20,
              // // ),
              //  TextFormField(
              //     controller: usernameController,
              //     validator: (value) {

              // },
              //  ),
              // AppTextField(

              //     hintText: "Phone",
              //     icon: Icons.phone,
              // ),
              // SizedBox(
              //   height: 20,
              // ),
              // TextFormField(
              //     controller: usernameController,
              //     validator: (value) {

              // },
              // ),
              // AppTextField(
              //   //  textController: passwordController,
              //     hintText: "Password",
              //     icon: Icons.vpn_key),
              // SizedBox(
              //   height: 20,
              // ),
              // TextFormField(
              //     controller: usernameController,
              //     validator: (value) {

              // },
              // ),
              // AppTextField(
              //  //   textController: passwordConfirmController,
              //     hintText: "Confirm Password",
              //     icon: Icons.vpn_key),
              // SizedBox(
              //   height: 20,
              // ),

              TextFormField(
                controller: usernameController,
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
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    hintText: "Username",
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                          width: 1.0,
                          color: Colors.white,
                        )),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                          width: 1.0,
                          color: Colors.white,
                        )),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    )),
              ),

              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: phoneController,
                validator: (value) {
                   RegExp regex =
                  RegExp(r'^.[+]*[(]{0}[0-9]{1,4}[)]{0,1}[-\s\./0-9]+$');
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
              phoneController.text = value!;
            },
                
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    hintText: "Phone number",
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                          width: 1.0,
                          color: Colors.white,
                        )),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                          width: 1.0,
                          color: Colors.white,
                        )),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    )),
              ),

              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: passwordController,
                validator: (value) {
                   RegExp regex = RegExp(r'^.{6,}$');
                 if (value!.isEmpty) {
                  return ("Password cannot empty!");
                }
               if (!regex.hasMatch(value)) {
                  return ("Please Enter Valid Password(Min. 6 Character)");
                 }
                },
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    hintText: "Password",
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                          width: 1.0,
                          color: Colors.white,
                        )),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                          width: 1.0,
                          color: Colors.white,
                        )),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    )),
              ),

              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: confirmpasswordController,
                validator: (value) {
                   if (value!.isEmpty) {
                  return ("Password cannot empty!");
                 } else if (value != passwordController.text) {
                   return ("Password is not match!");
                  } else {
                      return null;
                   }
                },
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    hintText: "Confirm Password",
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                          width: 1.0,
                          color: Colors.white,
                        )),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                          width: 1.0,
                          color: Colors.white,
                        )),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    )),
              ),
             
              SizedBox(
                height: 20,
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
                      text: "Sign up",
                      size: 24,
                      color: Colors.white,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

get bottom {
  return Container(
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            spreadRadius: 7,
            offset: Offset(1, 10),
            color: Colors.grey.withOpacity(0.2),
          )
        ]),
  );
}
