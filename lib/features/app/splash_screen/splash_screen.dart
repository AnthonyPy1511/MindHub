import 'package:flutter/material.dart';
import 'package:mindhub/features/user_auth/presentation/pages/home_page/home_page.dart';

class SplashScreen extends StatefulWidget {
  final Widget? child;

  const SplashScreen({super.key, this.child});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 0), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
          (route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png',
              width: 150,
              height: 150,
            ),
            const SizedBox(height: 10),
            const Text(
              "MindHub",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 50,
              ),
            ),
            const Text(
              "Salud Mental",
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 130),
              child: Container(
                width: double.infinity,
                height: 5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1),
                  color: const Color.fromRGBO(7, 185, 159, 1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
