// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:mindhub/features/user_auth/presentation/pages/omit_diag.dart';

class StartDiag extends StatelessWidget {
  const StartDiag({super.key});

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
              const Text(
                "¡Listo!",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 45),
              ),
              const SizedBox(height: 15),
              const Text(
                "¿Te gustaría iniciar con",
                style: TextStyle(fontSize: 30),
              ),
              const Text(
                "tu primer diagnóstico?",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              const SizedBox(height: 40),
              Image.asset(
                'assets/register_icon.png',
                width: 100,
                height: 100,
              ),
              const SizedBox(height: 40),
              const SizedBox(height: 150),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      Future.delayed(const Duration(milliseconds: 100), () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const OmitDiag()),
                            (route) => false);
                      });
                    },
                    child: Container(
                      width: 85,
                      height: 85,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.black12,
                      ),
                      child: const Center(
                        child: Text(
                          "Omitir",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 19,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 0),
                  InkWell(
                    onTap: () {
                      Future.delayed(const Duration(milliseconds: 100), () {});
                      //  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    child: Ink(
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(7, 185, 159, 1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(15),
                        child: Container(
                          width: 85,
                          height: 85,
                          child: const Center(
                            child: Text(
                              "Iniciar",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 19),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
