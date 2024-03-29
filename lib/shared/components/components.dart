import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../theme/mytheme.dart';

Widget defaultButton({
  double width = double.infinity,
  double? height,
  required Color background,
  bool isUpperCase = true,
  double radius = 0.0,
  required Function? function(),
  required String text,
  Color? colorText,
}) =>
    Container(
      height: height,
      width: width,
      child: MaterialButton(
        elevation: 0,
        color: background,
        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(color: colorText),
        ),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: background),
    );

Widget defaultFormField(
        {required TextEditingController controller,
        required TextInputType type,
        void Function(String)? onSubmit,
        required Function onChange,
        required String? Function(String?)? validator,
        required String label,
        required IconData prefix,
        IconData? suffix,
        bool isPassword = false,
        Color? cursorColor}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      onFieldSubmitted: onSubmit,
      onChanged: onChange(),
      validator: validator,
      cursorColor: cursorColor,
      decoration: InputDecoration(
        suffixIconColor: MyTheme.primaryColor,
        labelText: label,
        prefixIcon: Icon(
          prefix,
          color: MyTheme.primaryColor,
        ),
        suffixIcon: suffix != null ? Icon(suffix) : null,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: MyTheme.primaryColor, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: MyTheme.primaryColor, width: 1)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: MyTheme.primaryColor, width: 1)),
        labelStyle: TextStyle(color: MyTheme.primaryColor),
      ),
    );

PreferredSizeWidget defaultAppBar({
  required BuildContext context,
  String? title,
  List<Widget>? actions,
  IconButton? leading,
}) =>
    AppBar(
      leading: leading,
      actions: actions,
      titleSpacing: 5,
      title: Text(
        title!,
        style: TextStyle(color: Theme.of(context).primaryColor),
      ),
      elevation: 0,
    );

void showToast({
  required String text,
  required ToastState state,
}) =>
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: chooseToastColor(state),
        textColor: Colors.white,
        fontSize: 16.0);

enum ToastState { SUCCESS, ERROR, WARNING }

Color chooseToastColor(ToastState state) {
  Color color;
  switch (state) {
    case ToastState.SUCCESS:
      color = Colors.green;
      break;

    case ToastState.ERROR:
      color = Colors.red;
      break;

    case ToastState.WARNING:
      color = Colors.amber;
      break;
  }
  return color;
}
