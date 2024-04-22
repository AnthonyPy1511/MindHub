import 'package:flutter/material.dart';
import 'package:mindhub/features/user_auth/presentation/pages/schedule_appointment_page.dart';
import 'package:mindhub/features/user_auth/presentation/pages/search_associated.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

import 'chats.dart';

class PsychologistProfilePage extends StatefulWidget {
  final Psychologist psychologist;

  const PsychologistProfilePage({super.key, required this.psychologist});

  @override
  _PsychologistProfilePageState createState() =>
      _PsychologistProfilePageState();
}

class _PsychologistProfilePageState extends State<PsychologistProfilePage> {
  List<Appointment> upcomingAppointments = [];

  @override
  void initState() {
    super.initState();
    fetchUpcomingAppointments();
  }

  Future<void> fetchUpcomingAppointments() async {
    final user = FirebaseAuth.instance.currentUser;
    final appointmentsSnapshot = await FirebaseFirestore.instance
        .collection('appointments')
        .where('psychologistName', isEqualTo: widget.psychologist.name)
        .where('psychologistlastName', isEqualTo: widget.psychologist.lastName)
        .where('userId', isEqualTo: user!.uid)
        .get();

    setState(() {
      upcomingAppointments = appointmentsSnapshot.docs
          .map((doc) => Appointment.fromSnapshot(doc))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil del Psicólogo'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage('psychologist_image.jpg'),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              // Centra el nombre en la pantalla
              child: Text(
                'Lic. '
                '${widget.psychologist.name} ${widget.psychologist.lastName}',
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(
                  Icons.psychology,
                  size: 18,
                  color: Color.fromRGBO(7, 185, 159, 1),
                ),
                const SizedBox(width: 5),
                Text(
                  widget.psychologist.specialization,
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(
                  Icons.description,
                  size: 18,
                  color: Color.fromRGBO(7, 185, 159, 1),
                ),
                const SizedBox(width: 5),
                Text(
                  widget.psychologist.description,
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(
                  Icons.location_on,
                  size: 18,
                  color: Color.fromRGBO(7, 185, 159, 1),
                ),
                const SizedBox(width: 5),
                Text(
                  'Ubicación: ${widget.psychologist.location}',
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(
                  Icons.attach_money,
                  size: 18,
                  color: Color.fromRGBO(7, 185, 159, 1),
                ),
                const SizedBox(width: 5),
                Text(
                  'Precio por sesión: MXN ${widget.psychologist.price}',
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Row(
              children: [
                Icon(
                  Icons.circle,
                  size: 10,
                  color: Color.fromRGBO(7, 185, 159, 1),
                ),
                SizedBox(width: 5),
                Text(
                  'Sesión presencial',
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
            const Row(
              children: [
                Icon(
                  Icons.circle,
                  size: 10,
                  color: Color.fromRGBO(7, 185, 159, 1),
                ),
                SizedBox(width: 5),
                Text(
                  'Sesión en línea',
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const ChatScreen(), // Navega a la pantalla de ChatScreen
                      ),
                    );
                  },
                  child: Ink(
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(7, 185, 159, 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      child: const SizedBox(
                        width:
                            200, // Ancho mayor para el botón "Enviar Mensaje"
                        height: 55,
                        child: Center(
                          child: Text(
                            "Enviar Mensaje",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ScheduleAppointmentPage(
                          psychologistName: widget.psychologist.name,
                          psychologistlastName: widget.psychologist.lastName,
                        ),
                      ),
                    );
                  },
                  child: Ink(
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(7, 185, 159, 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      child: const SizedBox(
                        width: 200, // Ancho mayor para el botón "Agendar Cita"
                        height: 55,
                        child: Center(
                          child: Text(
                            "Agendar Cita",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    // Lógica para guardar el perfil del psicólogo
                  },
                  icon: const Icon(Icons.favorite_border),
                  color: const Color.fromRGBO(7, 185, 159, 1),
                ),
                const SizedBox(width: 10),
                const Text(
                  'Guardar',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color.fromRGBO(7, 185, 159, 1),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Próximas Citas',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(7, 185, 159, 1),
                      ),
                    ),
                    const SizedBox(height: 10),
                    if (upcomingAppointments.isNotEmpty)
                      Column(
                        children: upcomingAppointments.map((appointment) {
                          return ListTile(
                            title: Text(
                                'Fecha: ${DateFormat.yMMMMEEEEd().format(appointment.date)}'),
                            subtitle: Text('Hora: ${appointment.time}'),
                          );
                        }).toList(),
                      )
                    else
                      const Text(
                        'No hay citas agendadas por el momento.',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Appointment {
  final DateTime date;
  final String time;

  Appointment({required this.date, required this.time});

  factory Appointment.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return Appointment(
      date: (data['date'] as Timestamp).toDate(),
      time: data['time'] ?? '',
    );
  }
}
