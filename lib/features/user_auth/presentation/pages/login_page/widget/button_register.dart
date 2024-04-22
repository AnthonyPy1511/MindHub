import 'package:flutter/material.dart';
import 'package:mindhub/features/user_auth/presentation/pages/sign_up_page.dart';

Widget buttonRegister(BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const SignUpPage()));
    },
    child: const Text(
      "Regístrate",
      style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          color: Color.fromRGBO(7, 185, 159, 10)),
    ),
  );
}
