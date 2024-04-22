import 'package:flutter/material.dart';

class WhatToDoInCaseOfPage extends StatelessWidget {
  const WhatToDoInCaseOfPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('¿Qué hacer en caso de un trastorno?'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '¡Oh no! Ha ocurrido un trastorno.',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 16),
            Text(
              'Aquí tienes algunas recomendaciones:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              '1. Mantén la calma y respira profundamente.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              '2. Busca ayuda de un profesional si es necesario.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              '3. No te juzgues a ti mismo/a, es normal pasar por momentos difíciles.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              '4. Habla con alguien de confianza sobre lo que estás experimentando.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
