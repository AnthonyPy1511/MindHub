// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class FastDiagnosticPage extends StatefulWidget {
  const FastDiagnosticPage({super.key});

  @override
  _FastDiagnosticPageState createState() => _FastDiagnosticPageState();
}

class _FastDiagnosticPageState extends State<FastDiagnosticPage> {
  String? selectedOption;
  String? diagnosticResult;

  List<Question> diagnosticQuestions = [
    Question(
      question:
          'Pregunta 1: ¿Tienes dificultad para prestar atención en tareas o actividades?',
      options: ['Sí', 'No'],
    ),
    Question(
      question:
          'Pregunta 2: ¿Sueles cometer errores por descuido en tus tareas?',
      options: ['Sí', 'No'],
    ),
    Question(
      question:
          'Pregunta 3: ¿Te cuesta mantener la atención en actividades que no te resultan interesantes?',
      options: ['Sí', 'No'],
    ),
  ];

  int currentQuestionIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diagnóstico Rápido de TDAH'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              diagnosticQuestions[currentQuestionIndex].question,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            DropdownButton<String>(
              value: selectedOption,
              onChanged: (value) {
                setState(() {
                  selectedOption = value;
                });
              },
              items: diagnosticQuestions[currentQuestionIndex]
                  .options
                  .map((option) {
                return DropdownMenuItem<String>(
                  value: option,
                  child: Text(option),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (selectedOption != null) {
                  // Almacenar la respuesta seleccionada
                  diagnosticQuestions[currentQuestionIndex].selectedAnswer =
                      selectedOption!;

                  // Pasar a la siguiente pregunta o realizar el diagnóstico si es la última pregunta
                  if (currentQuestionIndex < diagnosticQuestions.length - 1) {
                    setState(() {
                      currentQuestionIndex++;
                      selectedOption = null;
                    });
                  } else {
                    performDiagnostic();
                  }
                }
              },
              child: Text(currentQuestionIndex < diagnosticQuestions.length - 1
                  ? 'Siguiente'
                  : 'Iniciar Diagnóstico'),
            ),
            const SizedBox(height: 20),
            if (diagnosticResult != null)
              Text(
                'Resultado del diagnóstico: $diagnosticResult',
                style: const TextStyle(fontSize: 20),
              ),
          ],
        ),
      ),
    );
  }

  void performDiagnostic() {
    // Realizar la lógica del diagnóstico basada en las respuestas seleccionadas
    // Puedes personalizar esta lógica según tus requisitos
    String result = '';

    if (diagnosticQuestions[0].selectedAnswer == 'Sí') {
      result =
          'Tienes dificultad para prestar atención en tareas o actividades.';
    } else {
      result =
          'No tienes dificultad para prestar atención en tareas o actividades.';
    }

    if (diagnosticQuestions[1].selectedAnswer == 'Sí') {
      result += ' Sueles cometer errores por descuido en tus tareas.';
    } else {
      result += ' No sueles cometer errores por descuido en tus tareas.';
    }

    if (diagnosticQuestions[2].selectedAnswer == 'Sí') {
      result +=
          ' Te cuesta mantener la atención en actividades que no te resultan interesantes.';
    } else {
      result +=
          ' No te cuesta mantener la atención en actividades que no te resultan interesantes.';
    }

    setState(() {
      diagnosticResult = result;
    });
  }
}

class Question {
  final String question;
  final List<String> options;
  String? selectedAnswer;

  Question({required this.question, required this.options});
}
