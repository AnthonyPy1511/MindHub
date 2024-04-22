import 'package:flutter/material.dart';
import 'package:mindhub/features/user_auth/function/function_home_page.dart';

Widget buttonEmergency(BuildContext context) {
  return InkWell(
    onTap: () {
      FunctionHomePage.navigateToEmergency(context);
    },
    child: Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white38,
      ),
      child: const Center(
        child: Text(
          "EMERGENCIA",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.red,
            fontSize: 20,
          ),
        ),
      ),
    ),
  );
}
