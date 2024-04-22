import 'package:flutter/material.dart';

class ActivityPage extends StatelessWidget {
  const ActivityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Actividades para manejar la ansiedad'),
      ),
      body: ListView.builder(
        itemCount: 5, // Replace with the actual number of items
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(
              'Actividad $index',
              style: const TextStyle(fontSize: 16),
            ),
            subtitle: Text(
              'Descripción de la actividad $index',
              style: const TextStyle(fontSize: 14),
            ),
          );
        },
      ),
    );
  }
}
