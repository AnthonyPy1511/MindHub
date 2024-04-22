import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class FirebaseAuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signUpWithEmailAndPassword(
      BuildContext context,
      String email,
      String password,
      TextEditingController nameController,
      TextEditingController lastnameController,
      TextEditingController emailController,
      ) async {

    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(email: email, password: password);

      final uid = credential.user!.uid;

      await FirebaseFirestore.instance
          .collection('Users')
          .doc(uid)
          .set({
        'nombre': nameController.text,
        'apellido': lastnameController.text,
        'email': emailController.text,

      });
      return credential.user;
    }
    on FirebaseAuthException catch (e) {
      print("Some error ocurred");

      if (e.code == "email-already-in-use") {
        showSnackBar(context, 'Este correo ya existe.');
      }
      else {
        showSnackBar(context, 'Un error ha ocurrido: ${e.code}');
      }

    }

    return null;
  }

  Future<User?> signInWithEmailAndPassword(BuildContext context, String email, String password) async {

    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return credential.user;
    }
    on FirebaseAuthException catch (e) {
      print("Some error ocurred");

      if (e.code == 'invalid-credential') {
        showSnackBar(context, 'Correo o contraseña incorrectos.');
      }
      else {
        showSnackBar(context, 'Ha ocurrido un error: ${e.code}');
      }
    }

    return null;
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
