import 'package:flutter/material.dart';
import 'package:sports_shopping_app/screens/main_screens.dart';
import 'package:sports_shopping_app/widgets/build_size_button.dart';
import 'package:sports_shopping_app/widgets/defaultbutton.dart';

import '../widgets/subtitle_widget.dart';

class SuccessOrder extends StatefulWidget {
  const SuccessOrder({Key? key}) : super(key: key);

  @override
  State<SuccessOrder> createState() => _SuccessOrderState();
}

class _SuccessOrderState extends State<SuccessOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage("asset/images/success.gif"),
          ),
          SubTitle(
            subTitleText: 'Your ordering  was done successfully',
          ),
          DefaultButton(
              btnText: "Back",
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (ctx) => MainScreen()));
              }),
        ],
      ),
    );
  }
}
