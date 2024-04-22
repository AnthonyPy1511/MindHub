import 'package:flutter/material.dart';

Widget textMindHubAndSaludMental() {
  return const Column(
    children: [
      Text(
        "MindHub",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 50,
        ),
      ),
      Text(
        "Salud Mental",
        style: TextStyle(
          fontSize: 24,
        ),
      ),
    ],
  );
}
