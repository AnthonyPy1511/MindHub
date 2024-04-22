import 'package:flutter/material.dart';

class PsychologistsPage extends StatelessWidget {
  const PsychologistsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Psicólogos Disponibles"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: psychologistsList.length,
        itemBuilder: (context, index) {
          return _buildPsychologistProfile(context, psychologistsList[index]);
        },
      ),
    );
  }

  Widget _buildPsychologistProfile(BuildContext context, Psychologist1 psychologist) {
    return InkWell(
      onTap: () {
        // Acción al seleccionar un psicólogo
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 30,
              backgroundColor: Color.fromRGBO(7, 185, 159, 1),
              // Aquí puedes establecer la imagen del psicólogo si tienes la URL de la imagen
              // backgroundImage: NetworkImage(psychologist.imageUrl),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    psychologist.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    psychologist.specialization,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  psychologist.available ? "Disponible" : "No Disponible",
                  style: TextStyle(
                    color: psychologist.available ? Colors.green : Colors.red,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    "Agendar",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Psychologist1 {
  final String name;
  final String specialization;
  final bool available;

  Psychologist1({
    required this.name,
    required this.specialization,
    required this.available,
  });
}

// Ejemplo de lista de psicólogos
final List<Psychologist1> psychologistsList = [
  Psychologist1(name: "Dr. Juan Pérez", specialization: "Psicología Clínica", available: true),
  Psychologist1(name: "Dra. María García", specialization: "Psicología Infantil", available: false),
  Psychologist1(name: "Dr. Carlos López", specialization: "Psicología de Pareja", available: true),
  Psychologist1(name: "Dra. Ana Martínez", specialization: "Psicología Organizacional", available: true),
];

void main() {
  runApp(const MaterialApp(
    home: PsychologistsPage(),
  ));
}
