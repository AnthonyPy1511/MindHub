import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mindhub/features/user_auth/presentation/pages/home_page/home_page.dart';
import 'package:mindhub/features/user_auth/presentation/pages/account_details_page.dart';

class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.only(left: 25, right: 25, top: 5, bottom: 5),
        children: [
          const SizedBox(
            height: 50,
          ),
          const Center(
              child: Text("Opciones",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold))),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AccountDetailsPage()),
              );
            },
            child: Container(
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.withOpacity(0.08),
              ),
              child: const Padding(
                padding: EdgeInsets.only(left: 10, top: 10, bottom: 5),
                child: Text(
                  "Cuenta",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          InkWell(
            onTap: () {
              Future.delayed(const Duration(milliseconds: 100), () {
                // Logica de botón
              });
            },
            child: Container(
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.withOpacity(0.08),
              ),
              child: const Padding(
                padding: EdgeInsets.only(left: 10, top: 10, bottom: 5),
                child: Text(
                  "Ajustes",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 30),
            child: Container(
              height: 3,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.withOpacity(0.10)),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              Future.delayed(const Duration(milliseconds: 100), () {
                // Logica de botón
              });
            },
            child: Container(
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.withOpacity(0.08),
              ),
              child: const Padding(
                padding: EdgeInsets.only(left: 10, top: 10, bottom: 5),
                child: Text(
                  "Soporte",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          InkWell(
            onTap: () {
              Future.delayed(const Duration(milliseconds: 100), () {
                // Logica de botón
              });
            },
            child: Container(
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.withOpacity(0.08),
              ),
              child: const Padding(
                padding: EdgeInsets.only(left: 10, top: 10, bottom: 5),
                child: Text(
                  "Acerca de...",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Container(
              height: 3,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.withOpacity(0.10)),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () async {
              await _deleteAccount(context);
            },
            child: Container(
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.red.withOpacity(0.08),
              ),
              child: const Padding(
                padding: EdgeInsets.only(left: 10, top: 10, bottom: 5),
                child: Text(
                  "Eliminar Cuenta",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              Future.delayed(const Duration(milliseconds: 100), () async {
                // FirebaseAuth.instance.signOut();
                await FirebaseAuth.instance.signOut();
                showSnackBar(context, 'Sesión cerrada correctamente');
                // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomePage()), (Route<dynamic> route) => false);
                Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const HomePage();
                    },
                  ),
                  (_) => false,
                );
              });
            },
            child: Container(
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.red.withOpacity(0.08),
              ),
              child: const Padding(
                padding: EdgeInsets.only(left: 10, top: 10, bottom: 5),
                child: Text(
                  "Cerrar Sesion",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}

Future<void> _deleteAccount(BuildContext context) async {
  final user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    final userDoc =
        FirebaseFirestore.instance.collection('Users').doc(user.uid);
    final psychologistDoc =
        FirebaseFirestore.instance.collection('psycologists').doc(user.uid);

    // Eliminar la cuenta del usuario
    await user.delete();

    // Eliminar los datos del usuario de la colección 'Users'
    await userDoc.delete();

    // Eliminar los datos del usuario de la colección 'psycologists'
    await psychologistDoc.delete();

    showSnackBar(context, 'Cuenta eliminada con éxito');

    // Cerrar sesión y navegar a la página de inicio
    await FirebaseAuth.instance.signOut();
    Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return const HomePage();
        },
      ),
      (_) => false,
    );
  }
}

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
    ),
  );
}
