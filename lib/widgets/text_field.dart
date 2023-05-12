import 'dart:ui';

import 'package:flutter/material.dart';

class EditTextField extends StatelessWidget {
  final BuildContext context;
  final IconData icon;
  final String hintText;
  final bool isPassword;
  final bool isEmail;
  final TextEditingController controller;
  final Function ontab;

  const EditTextField(
      {Key? key,
      required this.context,
      required this.icon,
      required this.hintText,
      required this.isPassword,
      required this.isEmail,
      required this.controller,
      required this.ontab})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaY: 20,
          sigmaX: 20,
        ),
        child: Container(
          height: size.width / 7,
          width: size.width / 1.2,
          alignment: Alignment.center,
          padding: EdgeInsets.only(right: size.width / 30),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            borderRadius: BorderRadius.circular(15),
          ),
          child: TextField(
            // textAlign: TextAlign.end,
            onTap: ontab(),
            controller: controller,
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 16,
              color: Colors.black87.withOpacity(.5),
            ),
            cursorColor: Colors.white,
            obscureText: isPassword,
            keyboardType:
                isEmail ? TextInputType.emailAddress : TextInputType.text,
            decoration: InputDecoration(
              prefixIcon: Icon(
                icon,
                color: Colors.black87.withOpacity(0.5),
              ),
              border: InputBorder.none,
              hintMaxLines: 1,
              hintText: hintText,
              hintStyle: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 16,
                  color: Colors.black87.withOpacity(0.5)),
            ),
          ),
        ),
      ),
    );
  }
}
