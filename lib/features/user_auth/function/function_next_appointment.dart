import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FunctionNextAppointment {
  static Future<void> deleteData(String docId) async {
    FirebaseFirestore.instance
        .collection('appointments')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({
      docId: FieldValue.delete(),
    });
  }

  static Future<void> deleteDataAdmin(String docId) async {
    FirebaseFirestore.instance
        .collection('appointments_admin')
        .doc('appointments_admin')
        .update({
      docId: FieldValue.delete(),
    });
  }
}
