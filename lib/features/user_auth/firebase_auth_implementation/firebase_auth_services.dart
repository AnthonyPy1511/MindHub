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
      bool isPsychologist,
      {String? specialization,
      String? description,
      String? location,
      String? price}) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final uid = credential.user!.uid;
      String collectionName = isPsychologist ? 'psychologists' : 'Users';

      Map<String, dynamic> userData = {
        'nombre': nameController.text,
        'apellido': lastnameController.text,
        'email': emailController.text,
        'userType': 'user',
      };

      if (specialization != null) {
        userData['especializacion'] = specialization;
      }

      if (description != null) {
        userData['descripcion'] = description;
      }

      if (location != null) {
        userData['ubicacion'] = location;
      }

      if (price != null) {
        userData['precio'] = price;
      }

      await FirebaseFirestore.instance
          .collection(collectionName)
          .doc(uid)
          .set(userData);

      return credential.user;
    } on FirebaseAuthException catch (e) {
      print("Some error occurred");

      if (e.code == "email-already-in-use") {
        showSnackBar(context, 'Este correo ya existe.');
      } else {
        showSnackBar(context, 'Un error ha ocurrido: ${e.code}');
      }
    }

    return null;
  }

  Future<User?> signInWithEmailAndPassword(
      BuildContext context, String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      return credential.user;
    } on FirebaseAuthException catch (e) {
      print("Some error ocurred");

      if (e.code == 'invalid-credential') {
        showSnackBar(context, 'Correo o contraseña incorrectos.');
      } else {
        showSnackBar(context, 'Ha ocurrido un error: ${e.code}');
      }
    }

    return null;
  }

  Future<User?> updatePhoneNumber(
      BuildContext context, String phoneNumber) async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        String uid = user.uid;
        bool isPsychologist = await _checkIfPsychologist(uid);

        if (isPsychologist) {
          await FirebaseFirestore.instance
              .collection('psychologists')
              .doc(uid)
              .update({
            'numero': phoneNumber,
          });
        } else {
          await FirebaseFirestore.instance.collection('Users').doc(uid).update({
            'numero': phoneNumber,
          });
        }

        return user;
      }
    } catch (e) {
      print("Error updating phone number: $e");
      showSnackBar(context, 'Error al actualizar el número de teléfono.');
    }
    return null;
  }

  Future<User?> updateEmergencyNumber(
      BuildContext context, String emergencyNumber) async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        String uid = user.uid;
        bool isPsychologist = await _checkIfPsychologist(uid);

        if (isPsychologist) {
          await FirebaseFirestore.instance
              .collection('psychologists')
              .doc(uid)
              .update({
            'numero_emergencia': emergencyNumber,
          });
        } else {
          await FirebaseFirestore.instance.collection('Users').doc(uid).update({
            'numero_emergencia': emergencyNumber,
          });
        }

        return user;
      }
    } catch (e) {
      print("Error updating emergency number: $e");
      showSnackBar(
          context, 'Error al actualizar el número de teléfono de emergencia.');
    }
    return null;
  }

  Future<bool> _checkIfPsychologist(String uid) async {
    DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
        .collection('psychologists')
        .doc(uid)
        .get();
    return documentSnapshot.exists;
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
