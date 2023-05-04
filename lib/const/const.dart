import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void navigateTo(context, widget) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}

void navigateToReplacement(context, widget) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => widget));
}

String? uId;
//String? verificationId;

var token;

defToast(
    {required String msg,
      Toast? toastLength,
      ToastGravity? gravity,
      int timeInSecForIosWeb = 5,
      Color backgroundColor = Colors.lightBlueAccent,
      Color textColor = Colors.white,
      double fontSize = 16}) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: toastLength,
      gravity: gravity,
      timeInSecForIosWeb: timeInSecForIosWeb,
      backgroundColor: backgroundColor,
      textColor: textColor,
      fontSize: fontSize);
}