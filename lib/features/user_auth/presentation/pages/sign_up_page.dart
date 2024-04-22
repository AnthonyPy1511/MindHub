import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mindhub/features/user_auth/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:mindhub/features/user_auth/presentation/pages/reg_number_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _isSigningUp = false;
  bool _isAssociateAccount = false;
  final FirebaseAuthService _auth = FirebaseAuthService();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _specializationController =
      TextEditingController(); // Nuevo TextEditingController
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _lastnameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _specializationController
        .dispose(); // Dispose del TextEditingController de la especialización
    _descriptionController.dispose();
    _locationController.dispose();
    _priceController.dispose();
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
              const SizedBox(
                height: 20,
              ),
              Image.asset(
                'assets/register_icon.png',
                width: 90,
                height: 90,
              ),
              const SizedBox(height: 10),
              const Text(
                "Registro",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 27,
                ),
              ),
              const Text(
                "Llena los campos necesarios",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Nombre',
                  hintText: 'Ingrese su nombre',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: _lastnameController,
                decoration: InputDecoration(
                  labelText: 'Apellido',
                  hintText: 'Ingrese su apellido',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Correo',
                  hintText: 'Ingrese su correo electrónico',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                  hintText: 'Ingrese su contraseña',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              CheckboxListTile(
                title: const Text("Cuenta de Asociado"),
                value: _isAssociateAccount,
                onChanged: (newValue) {
                  setState(() {
                    _isAssociateAccount = newValue!;
                    if (!_isAssociateAccount) {
                      // Limpiar campos si se desmarca la casilla
                      _specializationController.clear();
                      _descriptionController.clear();
                      _locationController.clear();
                      _priceController.clear();
                    }
                  });
                },
              ),
              if (_isAssociateAccount) ...[
                const SizedBox(height: 15),
                TextField(
                  controller: _specializationController,
                  decoration: InputDecoration(
                    labelText: 'Especialización',
                    hintText: 'Ingrese su especialización',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: _descriptionController,
                  decoration: InputDecoration(
                    labelText: 'Descripción',
                    hintText: 'Ingrese la descripción',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: _locationController,
                  decoration: InputDecoration(
                    labelText: 'Ubicación',
                    hintText: 'Ingrese la ubicación',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: _priceController,
                  decoration: InputDecoration(
                    labelText: 'Precio por sesión',
                    hintText: 'Ingrese el precio sesión',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ],
              const SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  Future.delayed(const Duration(milliseconds: 100), () {
                    _signUp();
                  });
                },
                child: Ink(
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(7, 185, 159, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: Center(
                        child: _isSigningUp
                            ? const CircularProgressIndicator(
                                color: Colors.white)
                            : const Text(
                                "Registrarse",
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
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _signUp() async {
    setState(() {
      _isSigningUp = true;
    });

    try {
      hideCurrentSnackBar(context);

      String name = _nameController.text;
      String lastname = _lastnameController.text;
      String email = _emailController.text;
      String password = _passwordController.text;
      String specialization = _specializationController.text;
      String description = _descriptionController.text;
      String location = _locationController.text;
      String price = _priceController.text;

      if (name.isEmpty ||
          lastname.isEmpty ||
          email.isEmpty ||
          password.isEmpty ||
          (_isAssociateAccount &&
              (specialization.isEmpty ||
                  description.isEmpty ||
                  location.isEmpty ||
                  price.isEmpty))) {
        showSnackBar(context, 'Rellene todos los campos.');
      } else {
        if (!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(email)) {
          showSnackBar(context, 'Correo electrónico inválido.');
        } else {
          if (password.length < 6) {
            showSnackBar(
                context, 'La contraseña debe tener al menos 6 carácteres.');
          } else {
            User? user = await _auth.signUpWithEmailAndPassword(
              context,
              email,
              password,
              _nameController,
              _lastnameController,
              _emailController,
              _isAssociateAccount,
              specialization: specialization,
              description: description,
              location: location,
              price: price,
            );

            setState(() {
              _isSigningUp = false;
            });

            if (user != null) {
              print("Cuenta creada correctamente");
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RegNumberPage()),
                  (route) => false);
            } else {
              print("Ha ocurrido un error.");
            }
          }
        }
      }
    } catch (e) {
      print("Excepción: $e");
    } finally {
      setState(() {
        _isSigningUp = false;
      });
    }
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void hideCurrentSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
  }
}
