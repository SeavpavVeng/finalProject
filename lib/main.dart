import 'package:flutter/material.dart';
import 'package:sports_shopping_app/colors/colors.dart';
import 'package:sports_shopping_app/data/data.dart';
import 'package:sports_shopping_app/screens/detail_screen.dart';
import 'package:sports_shopping_app/screens/home_screen.dart';
import 'package:sports_shopping_app/screens/list_product.dart';
import 'package:sports_shopping_app/screens/login_screen.dart';
import 'package:sports_shopping_app/screens/main_screens.dart';
import 'package:sports_shopping_app/screens/otp_screen.dart';
import 'package:sports_shopping_app/screens/signup_screen.dart';
import 'package:sports_shopping_app/screens/welcome_screen.dart';
import 'helper/dependencies.dart' as dep;

void main() {
  runApp(const MyApp());
}

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await dep.init();
//   runApp(const MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(),
    );
  }
}
