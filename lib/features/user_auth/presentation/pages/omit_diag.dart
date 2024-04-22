// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:mindhub/features/user_auth/presentation/pages/menu_page.dart';

class OmitDiag extends StatelessWidget {
  const OmitDiag({super.key});

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
              const SizedBox(height: 10),
              const Text(
                "¡Descuida!",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                ),
              ),
              const Text(
                "Aquí estaremos cuando",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              const Text(
                "te sientas listo/a.",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              const SizedBox(height: 10),
              Image.asset(
                'assets/community.png',
                width: 300,
                height: 300,
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const MenuPage()),
                      (route) => false);
                },
                child: Ink(
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(7, 185, 159, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: double.infinity,
                      height: 55,
                      child: const Center(
                        child: Text(
                          "Entrar",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 22,
                          ),
                        ),
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
