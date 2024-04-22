import 'package:flutter/material.dart';

Widget textIniciarSesionAndIngresarDatos() {
  return const Column(
    children: [
      Text(
        "Inicio de Sesión",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 28,
        ),
      ),
      Text(
        "Ingresa los datos de tu cuenta",
        style: TextStyle(
          fontSize: 22,
        ),
      ),
    ],
  );
}
