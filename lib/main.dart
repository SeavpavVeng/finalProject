import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:provider/provider.dart';
import 'package:sports_shopping_app/controllers/test_controller.dart';
import 'package:sports_shopping_app/screens/main_screens.dart';
import 'helper/dependencies.dart' as dep;

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
        providers: [ChangeNotifierProvider(create: (ctx) => TestController(),
    )],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home:SignUpScreen(),
      home: FutureBuilder(
        future: storage.ready,
        builder: (BuildContext context,AsyncSnapshot snapshot){
          // if (snapshot.data == null) {
          //     return const Scaffold(
          //       body: Center(
          //         child: CircularProgressIndicator(),
          //       ),
          //     );
          //   }
          //   if (storage.getItem('token') == null) {
          //     return WelcomeScreen();
          //   }
            return MainScreen();
          
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
