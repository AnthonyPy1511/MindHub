import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mindhub/features/user_auth/function/function_firebase.dart';
import 'package:mindhub/features/user_auth/function/function_snack_bar.dart';
import 'package:mindhub/features/user_auth/presentation/pages/admin/CRUD.dart';
import 'package:mindhub/features/user_auth/presentation/pages/menu_page.dart';

class FunctionLoginPage {
  static Future<void> signIn(
      BuildContext context,
      TextEditingController emailController,
      TextEditingController passwordController,
      Function setStateIsSigningTrue,
      Function setStateIsSigningFalse) async {
    setStateIsSigningTrue();

    try {
      FunctionSnackBar.hideCurrentSnackBar(context);

      String email = emailController.text;
      String password = passwordController.text;

      if (email.isEmpty || password.isEmpty) {
        FunctionSnackBar.showSnackBar(context, 'Rellene todos los campos.');
      } else {
        if ((!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(email))) {
          FunctionSnackBar.showSnackBar(
              context, 'Correo electrónico inválido.');
        } else {
          User? user = await FunctionFirebase.authFirebaseAuthService
              .signInWithEmailAndPassword(context, email, password);

          setStateIsSigningFalse();

          if (user != null) {
            print("Sesión iniciada correctamente");

            // Obtén el tipo de usuario de Firestore
            DocumentSnapshot doc = await FirebaseFirestore.instance
                .collection('Users')
                .doc(user.uid)
                .get();
            String userType = (doc.data() as Map<String, dynamic>)['userType'];

            // Navega a la página correspondiente según el tipo de usuario
            if (userType == 'admin') {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const CRUDPage()),
                  (route) => false);
              print('admin');
            } else if (userType == 'user') {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const MenuPage()),
                  (route) => false);
              print('user');
            } else {
              print("Tipo de usuario desconocido");
            }
          } else {
            print("Ha ocurrido un error");
          }
        }
      }
    } catch (e) {
      print("Excepción: $e");
    } finally {
      setStateIsSigningFalse();
    }
  }
}
