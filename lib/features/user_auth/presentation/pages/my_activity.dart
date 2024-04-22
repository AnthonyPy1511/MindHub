import 'package:flutter/material.dart';

class MyActivityPage extends StatelessWidget {
  const MyActivityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis Actividades'),
      ),
      body: ListView(
        children: const [
          ActivityCard(
            title: 'Sesión de terapia',
            description: 'Terapia individual',
            date: '19 de octubre de 2022',
          ),
          ActivityCard(
            title: 'Sesión de terapia',
            description: 'Terapia individual',
            date: '26 de octubre de 2022',
          ),
          ActivityCard(
            title: 'Diagnóstico',
            description: 'Realizar el diagnóstico inicial',
            date: '12 de octubre de 2022',
          ),
        ],
      ),
    );
  }
}

class ActivityCard extends StatelessWidget {
  final String title;
  final String description;
  final String date;

  const ActivityCard({
    super.key,
    required this.title,
    required this.description,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        subtitle: Text(description),
        trailing: Text(date),
      ),
    );
  }
}
