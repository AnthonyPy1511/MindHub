import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class IniciarSesion extends StatefulWidget {
  const IniciarSesion({super.key});

  @override
  State<IniciarSesion> createState() => _IniciarSesionState();
}

class _IniciarSesionState extends State<IniciarSesion> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _cargando = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Iniciar sesión'),
      ),
      body: _cargando
          ? const Center(child: CircularProgressIndicator())
          : Form(
              key: _formKey,
              child: ListView(
                padding: const EdgeInsets.all(16.0),
                children: [
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(labelText: 'Email'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'El email no puede estar vacío';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(labelText: 'Contraseña'),
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'La contraseña no puede estar vacía';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          _cargando = true;
                        });

                        try {
                          // Iniciar sesión con Firebase Authentication
                          await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: _emailController.text,
                                  password: _passwordController.text);

                          // Mostrar mensaje de éxito
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text('Sesión iniciada correctamente')));

                          // Redirigir al usuario a la pantalla principal
                          Navigator.of(context).pop();
                        } on FirebaseAuthException catch (e) {
                          // Mostrar mensaje de error
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(e.message!)));
                        } finally {
                          setState(() {
                            _cargando = false;
                          });
                        }
                      }
                    },
                    child: const Text('Iniciar sesión'),
                  ),
                ],
              ),
            ),
    );
  }
}
