import 'package:flutter/material.dart';
import 'package:mindhub/features/user_auth/function/function_login_page.dart';

Widget buttonSignIn(
    bool isSigning,
    BuildContext context,
    TextEditingController emailController,
    TextEditingController passwordController,
    Function setStateIsSigningTrue,
    Function setStateIsSigningFalse) {
  return InkWell(
    onTap: () {
      FunctionLoginPage.signIn(context, emailController, passwordController,
          setStateIsSigningTrue, setStateIsSigningFalse);
    },
    child: Container(
      width: double.infinity,
      height: 57,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromRGBO(7, 185, 159, 1),
      ),
      child: Center(
        child: isSigning
            ? const CircularProgressIndicator(color: Colors.white)
            : const Text(
                "Iniciar Sesión",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
      ),
    ),
  );
}
