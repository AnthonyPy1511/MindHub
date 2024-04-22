import 'package:flutter/material.dart';
import 'package:mindhub/features/user_auth/function/function_firebase.dart';
import 'package:mindhub/features/user_auth/presentation/pages/admin/CRUD.dart';
import 'package:mindhub/features/user_auth/presentation/pages/error_emergency.dart';
import 'package:mindhub/features/user_auth/presentation/pages/home_page/home_page.dart';
import 'package:mindhub/features/user_auth/presentation/pages/login_page/login_page.dart';
import 'package:mindhub/features/user_auth/presentation/pages/sign_up_page.dart';

class FunctionHomePage {
  static Future<Future<Object?>> navigateToCrudPage(
      BuildContext context) async {
    print('Already logged in: ${FunctionFirebase.user?.email}');

    return Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const CRUDPage()),
        (route) => false);
  }

  static Future<Future<Object?>> navigateToHomePage(
      BuildContext context) async {
    print('Already logged in: ${FunctionFirebase.user?.email}');

    return Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
        (route) => false);
  }

  static Future<Future<Object?>> navigateToLoginPage(
      BuildContext context) async {
    print('Not logged in');
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ),
    );
  }

  static Future<Future<Object?>> navigateToSignUpPage(
      BuildContext context) async {
    return Future.delayed(
      const Duration(milliseconds: 100),
      () {
        return Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SignUpPage(),
          ),
        );
      },
    );
  }

  static Future<Future<Object?>> navigateToEmergency(
      BuildContext context) async {
    return Future.delayed(
      const Duration(milliseconds: 500),
      () {
        return Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const ErrorEmergencyPage()),
            (route) => false);
      },
    );
  }
}
