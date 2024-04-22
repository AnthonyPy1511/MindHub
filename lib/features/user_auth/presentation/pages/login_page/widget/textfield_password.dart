import 'package:flutter/material.dart';

Widget textFieldPassword(TextEditingController passwordController,
    bool showPassword, Function setStateShowPassword) {
  return TextField(
    controller: passwordController,
    obscureText: !showPassword, // Para ocultar la contraseña
    decoration: InputDecoration(
      labelText: 'Contraseña',
      hintText: 'Ingrese su contraseña',
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      suffixIcon: IconButton(
        onPressed: () {
          setStateShowPassword();
        },
        icon: Icon(
          showPassword ? Icons.visibility : Icons.visibility_off,
        ),
      ),
    ),
  );
}
