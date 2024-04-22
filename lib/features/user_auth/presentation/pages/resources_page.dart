import 'package:flutter/material.dart';
import 'package:mindhub/features/user_auth/presentation/pages/What_to_do%20_in_case_of.dart';
import 'package:mindhub/features/user_auth/presentation/pages/actovity.dart';
import 'package:mindhub/features/user_auth/presentation/pages/fast_diagnostic.dart';
import 'package:mindhub/features/user_auth/presentation/pages/trastornos.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class ResourcesPage extends StatelessWidget {
  const ResourcesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recursos"),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildResourceButton(
            context: context,
            title: "Trastornos",
            imagePath: "assets/logo.png",
            navigatorTo: Future.value(const TrastornosPage()),
          ),
          _buildResourceButton(
            context: context,
            title: "¿Qué hacer en caso de...?",
            imagePath: "assets/logo.png",
            navigatorTo: Future.value(const WhatToDoInCaseOfPage()),
          ),
          _buildResourceButton(
            context: context,
            title: "Actividades",
            imagePath: "assets/logo.png",
            navigatorTo: Future.value(const ActivityPage()),
          ),
          _buildResourceButton(
            context: context,
            title: "Diagnósticos Rápidos",
            imagePath: "assets/logo.png",
            navigatorTo: Future.value(const FastDiagnosticPage()),
          ),
        ],
      ),
    );
  }

  Widget _buildResourceButton({
    required BuildContext context,
    required String imagePath,
    required String title,
    required Future navigatorTo,
  }) {
    return InkWell(
      onTap: () {
        navigatorTo.then((value) {
          PersistentNavBarNavigator.pushNewScreen(
            context,
            screen: value,
            withNavBar: false,
          );
        });
      },
      child: Column(
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: ResourcesPage(),
  ));
}
