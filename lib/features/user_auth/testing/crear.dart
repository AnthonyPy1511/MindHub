import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RegistrarUsuario extends StatefulWidget {
  const RegistrarUsuario({super.key});

  @override
  State<RegistrarUsuario> createState() => _RegistrarUsuarioState();
}

class _RegistrarUsuarioState extends State<RegistrarUsuario> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nombreController = TextEditingController();

  bool _cargando = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrar usuario'),
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
                  TextFormField(
                    controller: _nombreController,
                    decoration: const InputDecoration(labelText: 'Nombre'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'El nombre no puede estar vacío';
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
                          // Registrar usuario en Firebase Authentication
                          final userCredential = await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                                  email: _emailController.text,
                                  password: _passwordController.text);

                          // Obtener uid del usuario
                          final uid = userCredential.user!.uid;

                          // Crear un nuevo documento en Firestore con el uid del usuario
                          await FirebaseFirestore.instance
                              .collection('Users')
                              .doc(uid)
                              .set({
                            'nombre': _nombreController.text,
                            'email': _emailController.text,
                          });

                          // Mostrar mensaje de éxito
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      'Usuario registrado correctamente')));

                          // Redirigir al usuario a la pantalla de inicio
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
                    child: const Text('Registrarse'),
                  ),
                ],
              ),
            ),
    );
  }
}
