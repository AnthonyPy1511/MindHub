import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mindhub/features/user_auth/function/function_next_appointment.dart';
import 'package:mindhub/features/user_auth/presentation/pages/home_page/home_page.dart';

class CRUDPage extends StatefulWidget {
  const CRUDPage({super.key});

  @override
  State<CRUDPage> createState() => _CRUDPageState();
}

class _CRUDPageState extends State<CRUDPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Próximas Citas'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () async {
            await FirebaseAuth.instance.signOut();
            Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return const HomePage();
                },
              ),
              (_) => false,
            );
          },
        ),
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('appointments_admin')
            .doc('appointments_admin')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (!snapshot.hasData || !snapshot.data!.exists) {
            return const Center(
              child: Text('No se encontraron datos'),
            );
          }

          final data = snapshot.data!.data() as Map<String, dynamic>;
          final List<dynamic> appointmentDays = data.values.toList();

          return ListView.builder(
            itemCount: appointmentDays.length,
            itemBuilder: (context, index) {
              final name = (appointmentDays[index]['psychologistName']);
              final lastname = appointmentDays[index]['psychologistlastName'];
              final date = appointmentDays[index]['date'];
              final sessionType = appointmentDays[index]['sessionType'];
              final time = appointmentDays[index]['time'];
              final docId = appointmentDays[index]['uuid'];
              final userName = appointmentDays[index]['userName'];
              final userLastName = appointmentDays[index]['userLastName'];

              return Column(
                children: [
                  Card(
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(
                              'Cita de $userName $userLastName con $name $lastname'),
                          subtitle:
                              Text('Fecha: $date - $sessionType - Hora: $time'),
                          trailing: IconButton(
                            icon: const Icon(CupertinoIcons
                                .clear_circled), // Cambia este icono si lo deseas
                            onPressed: () {
                              FunctionNextAppointment.deleteDataAdmin(docId);
                              FunctionNextAppointment.deleteData(docId);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
