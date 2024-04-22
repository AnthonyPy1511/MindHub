import 'package:flutter/material.dart';
import 'package:mindhub/features/user_auth/function/function_home_page.dart';

Widget buttonRegiester(BuildContext context) {
  return InkWell(
    onTap: () {
      FunctionHomePage.navigateToSignUpPage(context);
    },
    child: Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black12,
      ),
      child: const Center(
        child: Text(
          "Registrarse",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
      ),
    ),
  );
}
