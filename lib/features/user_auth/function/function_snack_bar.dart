import 'package:flutter/material.dart';

class FunctionSnackBar {
  static Future<void> showSnackBar(BuildContext context, String message) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  static Future<void> hideCurrentSnackBar(BuildContext context) async {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
  }
}
