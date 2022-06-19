import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sports_shopping_app/widgets/big_text.dart';

void showCustomSnackBar(String message,String title) {
  Get.snackbar(
    title,
    message,
    titleText: Text(title, style: TextStyle(color: Colors.white,),),
       
       
    messageText: Text(
      message,
      style: TextStyle(color: Colors.white),
    ),
    colorText: Colors.white,
    snackPosition: SnackPosition.TOP,
    backgroundColor: Colors.redAccent,
  );
}
