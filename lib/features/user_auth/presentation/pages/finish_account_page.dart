import 'package:flutter/material.dart';
import 'package:mindhub/features/user_auth/presentation/pages/start_diag_page.dart';

class FinishAccountPage extends StatefulWidget {
  const FinishAccountPage({super.key});

  @override
  State<FinishAccountPage> createState() => _FinishAccountPageState();
}

class _FinishAccountPageState extends State<FinishAccountPage> {
  final bool _isSigningUp = false;
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
      body: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 100,
                ),
                Image.asset(
                  'assets/register_icon.png',
                  width: 90,
                  height: 90,
                ),
                const SizedBox(height: 30),
                const Text(
                  "¡Listo!",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 27,
                  ),
                ),
                const Text(
                  "Has completado la creación de tu cuenta.",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 30, // Adjust this value as needed
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: InkWell(
                onTap: () async {
                  setState(() {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const StartDiag()),
                        (route) => false);
                  });
                },
                child: Container(
                  width: double.infinity,
                  height: 55,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(7, 185, 159, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: _isSigningUp
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text(
                          "¡Llévame ahí!",
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
        ],
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
