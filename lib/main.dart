import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:provider/provider.dart';
import 'package:sports_shopping_app/controllers/cart_controller.dart';
import 'package:sports_shopping_app/controllers/product_controller.dart';
import 'package:sports_shopping_app/controllers/category_controller.dart';
import 'package:sports_shopping_app/controllers/slider_controller.dart';
import 'package:sports_shopping_app/models/product_model.dart';
import 'package:sports_shopping_app/screens/checkout_screen.dart';
import 'package:sports_shopping_app/screens/detail_screen.dart';
import 'package:sports_shopping_app/screens/favorite_fake.dart';
import 'package:sports_shopping_app/screens/favorite_screen.dart';
import 'package:sports_shopping_app/screens/history_product_screen.dart';
import 'package:sports_shopping_app/screens/invoice_screen.dart';
import 'package:sports_shopping_app/screens/login_screen.dart';
import 'package:sports_shopping_app/screens/main_screens.dart';
import 'package:sports_shopping_app/screens/shopping_cart_screen.dart';
import 'package:sports_shopping_app/screens/welcome_screen.dart';

// void main() {
//   runApp(const MyApp());
//}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocalStorage storage = LocalStorage("token");
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => CategoryController()),
        ChangeNotifierProvider(create: (ctx) => ProductController()),
        ChangeNotifierProvider(create: (ctx) => CartController()),
        ChangeNotifierProvider(create: (ctx)=> SliderController())
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          //home:SignUpScreen(),
          home: FutureBuilder(
            future: storage.ready,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                  return const Scaffold(
                    body: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                if (storage.getItem('token') == null) {
                  return WelcomeScreen();
                }
              return LoginScreen();
            },
          )
          //  home: OTPScreen(),
          ),
    );

    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   title: 'Flutter Demo',
    //   theme: ThemeData(
    //     primarySwatch: Colors.blue,
    //   ),
    //   //home:SignUpScreen(),
    //   home: MainScreen(),
    //   //  home: OTPScreen(),
    // );
  }
}
