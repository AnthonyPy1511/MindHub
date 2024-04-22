import 'package:flutter/material.dart';

Widget textFIeldEmail(TextEditingController emailController) {
  return TextField(
    controller: emailController,
    decoration: InputDecoration(
      labelText: 'Correo',
      hintText: 'Ingrese su correo electrónico',
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
  );
}
