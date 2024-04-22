import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mindhub/features/user_auth/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:mindhub/features/user_auth/presentation/pages/reg_emergency_page.dart';

class RegNumberPage extends StatefulWidget {
  const RegNumberPage({super.key});

  @override
  State<RegNumberPage> createState() => _RegNumberPageState();
}

class _RegNumberPageState extends State<RegNumberPage> {
  bool _isSigningUp = false;
  final FirebaseAuthService _auth = FirebaseAuthService();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _emergencynumberController =
      TextEditingController();

  @override
  void dispose() {
    _numberController.dispose();
    _emergencynumberController.dispose();
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
                height: 100,
              ),
              Image.asset(
                'assets/register_icon.png',
                width: 90,
                height: 90,
              ),
              const SizedBox(height: 10),
              const Text(
                "¡Tu cuenta se ha creado!",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 27,
                ),
              ),
              const Text(
                "Necesitamos un par de datos extra...",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              const Text(
                "Ingresa tu número de teléfono",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: _numberController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Número de teléfono',
                  hintText: 'Ingrese su número',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const SizedBox(
                height: 15,
              ),
              const SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  Future.delayed(const Duration(milliseconds: 100), () {
                    // _RegNumber();
                  });
                },
                child: Ink(
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(7, 185, 159, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: InkWell(
                    onTap: () async {
                      // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => MenuPage()), (route) => false);
                      setState(() {
                        _isSigningUp = true;
                      });
                      // Llama al método para actualizar el número de teléfono
                      User? user = await _auth.updatePhoneNumber(
                          context, _numberController.text);
                      setState(() {
                        _isSigningUp = false;
                      });
                      if (user != null) {
                        // Usuario actualizado correctamente, navega a la siguiente página
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RegEmergencyPage()),
                            (route) => false);
                      }
                    },
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: Center(
                        child: _isSigningUp
                            ? const CircularProgressIndicator(
                                color: Colors.white)
                            : const Text(
                                "Siguiente",
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
