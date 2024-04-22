// import 'dart:html';
// ignore_for_file: avoid_print, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:mindhub/features/user_auth/presentation/pages/home_page/text_mindHub_and_Salud_mental.dart';
import 'package:mindhub/features/user_auth/presentation/pages/home_page/widget/button_emergency.dart';
import 'package:mindhub/features/user_auth/presentation/pages/home_page/widget/button_login.dart';
import 'package:mindhub/features/user_auth/presentation/pages/home_page/widget/button_register.dart';
import 'package:mindhub/features/user_auth/presentation/pages/home_page/widget/image_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text(""),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              imageWidget(),
              const SizedBox(height: 10),
              textMindHubAndSaludMental(),
              const SizedBox(height: 170),
              buttonLogin(context),
              const SizedBox(height: 30),
              buttonRegiester(context),
              const SizedBox(
                height: 40,
              ),
              buttonEmergency(context),
            ],
          ),
        ),
      ),
    );
  }
}
