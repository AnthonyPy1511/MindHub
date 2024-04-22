// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:mindhub/features/user_auth/presentation/pages/login_page/widget/button_register.dart';
import 'package:mindhub/features/user_auth/presentation/pages/login_page/widget/textfield_email.dart';
import 'package:mindhub/features/user_auth/presentation/pages/login_page/widget/textfield_password.dart';

import 'widget/button_sign_in.dart';
import 'widget/image_widget.dart';
import 'widget/text_iniciar_sesion_and_ingresar_datos.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isSigning = false;
  void setStateIsSigningTrue() {
    setState(() {
      _isSigning = true;
    });
  }

  void setStateIsSigningFalse() {
    setState(() {
      _isSigning = false;
    });
  }

  bool _showPassword = false;
  void setStateShowPassword() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  // final FirebaseAuthService _auth = FirebaseAuthService();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 80),
              imageWidget(),
              const SizedBox(height: 20),
              textIniciarSesionAndIngresarDatos(),
              const SizedBox(height: 100),
              textFIeldEmail(_emailController),
              const SizedBox(height: 30),
              textFieldPassword(
                  _passwordController, _showPassword, setStateShowPassword),
              const SizedBox(height: 30),
              buttonSignIn(
                  _isSigning,
                  context,
                  _emailController,
                  _passwordController,
                  setStateIsSigningTrue,
                  setStateIsSigningFalse),
              const SizedBox(height: 20),
              const Text(
                "¿Aún no tienes cuenta?",
                style: TextStyle(fontSize: 19, color: Colors.black45),
              ),
              buttonRegister(context),
            ],
          ),
        ),
      ),
    );
  }
}
