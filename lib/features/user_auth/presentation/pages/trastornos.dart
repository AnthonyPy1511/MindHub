import 'package:flutter/material.dart';

class TrastornosPage extends StatefulWidget {
  const TrastornosPage({super.key});

  @override
  State<TrastornosPage> createState() => _TrastornosPageState();
}

class _TrastornosPageState extends State<TrastornosPage> {
  final List<Map<String, String>> trastornos = [
    {
      'nombre': 'Trastorno de ansiedad',
      'descripcion':
          'El trastorno de ansiedad se caracteriza por sentimientos intensos de miedo y preocupación.'
    },
    {
      'nombre': 'Trastorno bipolar',
      'descripcion':
          'El trastorno bipolar es una enfermedad mental que causa cambios extremos en el estado de ánimo.'
    },
    {
      'nombre': 'Trastorno de personalidad',
      'descripcion':
          'El trastorno de personalidad se refiere a patrones de pensamiento, comportamiento y funcionamiento emocional persistentes y inflexibles que causan dificultades en las relaciones y en otros ámbitos de la vida.'
    },
    // Agrega más trastornos aquí
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trastornos'),
      ),
      body: ListView.builder(
        itemCount: trastornos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(trastornos[index]['nombre']!),
            subtitle: Text(trastornos[index]['descripcion']!),
          );
        },
      ),
    );
  }
}
