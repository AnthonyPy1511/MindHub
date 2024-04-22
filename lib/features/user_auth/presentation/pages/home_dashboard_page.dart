import 'package:flutter/material.dart';

class HomeDash extends StatelessWidget {
  const HomeDash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "MindHub",
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color.fromRGBO(7, 185, 159, 1),
              ),
              child: Container(
                margin: const EdgeInsets.only(top: 50, bottom: 50),
                padding: EdgeInsets.zero,
                height: 10,
                child: const Text('Menú',
                    style: TextStyle(color: Colors.white, fontSize: 20)),
              ),
            ),
            ListTile(
              title: const Text('Inicio'),
              onTap: () {
                // Lógica
              },
            ),
            ListTile(
              title: const Text('Historial Clínico'),
              onTap: () {
                // Lógica
              },
            ),
            ListTile(
              title: const Text('Conversaciones'),
              onTap: () {
                // Lógica
              },
            ),
            ListTile(
              title: const Text('Cuenta'),
              onTap: () {
                // Lógica
              },
            ),
            ListTile(
              title: const Text('Cerrar Sesión',
                  style: TextStyle(color: Colors.red)),
              onTap: () {
                //  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomePage()), (route) => false);
              },
            ),
          ],
        ),
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 10),
              Text(
                "Inicio",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                ),
              ),
              Text(
                "Dashboard",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
