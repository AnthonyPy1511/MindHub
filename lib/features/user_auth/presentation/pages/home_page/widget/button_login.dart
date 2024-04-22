import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mindhub/features/user_auth/function/function_home_page.dart';

Widget buttonLogin(BuildContext context) {
  return InkWell(
    onTap: () {
      Future.delayed(const Duration(milliseconds: 100), () async {
        // DocumentSnapshot doc = await FirebaseFirestore.instance
        //     .collection('Users')
        //     .doc(FirebaseAuth.instance.currentUser!.uid)
        //     .get();
        // String userType = (doc.data() as Map<String, dynamic>)['userType'] ?? 'user';
        // if (FunctionFirebase.user != null) {
        //   FunctionHomePage.navigateToHomePage(context);
        // print(userType);
        // if (userType == 'admin') {
        //   FunctionHomePage.navigateToCrudPage(context);
        // } else if (userType == 'user') {
        //   FunctionHomePage.navigateToHomePage(context);
        // }
        // } else {
        FunctionHomePage.navigateToLoginPage(context);
        // }
      });
    },
    child: Ink(
      decoration: BoxDecoration(
        color: const Color.fromRGBO(7, 185, 159, 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        child: const SizedBox(
          width: double.infinity,
          height: 50,
          child: Center(
            child: Text(
              "Iniciar Sesión",
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
  );
}

class UserType {
  static Future<DocumentSnapshot<Object?>> getUserType() async {
    DocumentSnapshot doc = await FirebaseFirestore.instance
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    return doc;
  }
}
