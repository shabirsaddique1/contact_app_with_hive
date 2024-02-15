import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

customAppToast({
  required String title,
}) {
  FocusManager.instance.primaryFocus?.unfocus();
  return Fluttertoast.showToast(
      msg: title,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.blue,
      textColor: Colors.white,
      fontSize: 16.0);
}
