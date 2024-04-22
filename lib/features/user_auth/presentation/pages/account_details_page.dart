import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AccountDetailsPage extends StatelessWidget {
  final User? user = FirebaseAuth.instance.currentUser;

  AccountDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalles de la Cuenta'),
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future:
            FirebaseFirestore.instance.collection('Users').doc(user!.uid).get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return const Center(
              child: Text('Error al cargar los datos'),
            );
          }

          if (!snapshot.hasData || snapshot.data == null) {
            return const Center(
              child: Text('No se encontraron datos'),
            );
          }

          final userData = snapshot.data!;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nombre: ${userData['nombre']}',
                  style: const TextStyle(fontSize: 18.0),
                ),
                const SizedBox(height: 10),
                Text(
                  'Apellido: ${userData['apellido']}',
                  style: const TextStyle(fontSize: 18.0),
                ),
                const SizedBox(height: 10),
                Text(
                  'Correo: ${user!.email}',
                  style: const TextStyle(fontSize: 18.0),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
