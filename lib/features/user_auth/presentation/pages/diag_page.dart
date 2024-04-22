import 'package:flutter/material.dart';
import 'package:mindhub/features/user_auth/presentation/pages/login_page/login_page.dart';
import 'package:mindhub/features/user_auth/presentation/pages/sign_up_page.dart';

class DiagPage extends StatelessWidget {
  const DiagPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/register_icon.png',
                width: 70,
                height: 70,
              ),
              const SizedBox(height: 10),
              const Text(
                "D.S.",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                ),
              ),
              const Text(
                "¿Te gustaría iniciar",
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              const Text(
                "con tu diagnóstico?",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 200,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()));
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
              ),
              const SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const SignUpPage())); // Lógica del botón "Registrarse"
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black12,
                  ),
                  child: const Center(
                    child: Text(
                      "Registrarse",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              InkWell(
                onTap: () {
                  // Agrega un retraso de medio segundo (500 milisegundos) antes de ejecutar la lógica
                  Future.delayed(const Duration(milliseconds: 500), () {
                    // Lógica del botón "EMERGENCIA"
                    print("Botón 'EMERGENCIA' presionado después del retraso");
                  });
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white38,
                  ),
                  child: const Center(
                    child: Text(
                      "EMERGENCIA",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
