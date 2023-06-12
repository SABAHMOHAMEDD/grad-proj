import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../models/user_model.dart';

void navigateTo(context, widget) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}

void navigateToReplacement(context, widget) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => widget));
}



String generateRandomString(int lengthOfString){
  final random = Random();
  const allChars='AaBbCcDdlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1EeFfGgHhIiJjKkL234567890';
  // below statement will generate a random string of length using the characters
  // and length provided to it
  final randomString = List.generate(lengthOfString,
          (index) => allChars[random.nextInt(allChars.length)]).join();
  return randomString;    // return the generated string
}

String? uId;
//String? verificationId;
UserModel? userModel;

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