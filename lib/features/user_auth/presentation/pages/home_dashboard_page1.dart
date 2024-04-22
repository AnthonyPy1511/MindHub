import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mindhub/features/user_auth/presentation/pages/my_activity.dart';
import 'package:mindhub/features/user_auth/presentation/pages/next_appointment.dart';
import 'package:mindhub/features/user_auth/presentation/pages/notifications.dart';
import 'package:mindhub/features/user_auth/presentation/pages/search_associated.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class HomeDash1 extends StatefulWidget {
  const HomeDash1({super.key});

  @override
  State<HomeDash1> createState() => _HomeDash1State();
}

class _HomeDash1State extends State<HomeDash1> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getUserData(),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child:
                  CircularProgressIndicator(), // Muestra un indicador de carga mientras se obtiene el dato del usuario
            ),
          );
        }
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text('Error: ${snapshot.error}'),
            ),
          );
        }
        return Scaffold(
          appBar: AppBar(
            title: const Text("MindHub"),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "¡Bienvenido/a ${snapshot.data ?? ''}!",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        const Text(
                          "¿Qué haremos hoy?",
                          // snapshot.data ?? '', // Muestra el nombre del usuario
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      icon: const Icon(Icons.notifications),
                      onPressed: () {
                        PersistentNavBarNavigator.pushNewScreen(
                          context,
                          screen: const NotificationsPage(),
                          withNavBar: false,
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildFeatureContainer(
                      context: context,
                      color: const Color.fromRGBO(7, 185, 159, 1),
                      icon: Icons.calendar_month,
                      title: "Próxima sesion",
                      navigatorTo: Future.value(const NextAppointmentPage()),
                    ),
                    _buildFeatureContainer(
                      context: context,
                      color: const Color.fromRGBO(7, 185, 159, 1),
                      icon: Icons.edit_calendar,
                      title: "Agendar cita",
                      navigatorTo: Future.value(SearchAssociatedPage()),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    children: [
                      _buildGridItem(
                        context: context,
                        color: const Color.fromRGBO(7, 185, 159, 1),
                        icon: Icons.route,
                        title: "Mis actividades",
                        navigatorTo: Future.value(const MyActivityPage()),
                      ),
                      _buildGridItem(
                        context: context,
                        color: const Color.fromRGBO(7, 185, 159, 1),
                        icon: Icons.search,
                        title: "Buscar Asociados",
                        navigatorTo: Future.value(const SearchAssociatedPage()),
                      ),
                      // _buildGridItem(
                      //   context: context,
                      //   color: Color.fromRGBO(7, 185, 159, 1),
                      //   icon: Icons.info,
                      //   title: "Acerca de",
                      //   navigatorTo: Future.value(null),
                      // ),
                      // _buildGridItem(
                      //   context: context,
                      //   color: Color.fromRGBO(7, 185, 159, 1),
                      //   icon: Icons.exposure_zero,
                      //   title: "---",
                      //   navigatorTo: Future.value(null),
                      // ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<String> _getUserData() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    final String uid = user?.uid ?? '';

    DocumentSnapshot<Map<String, dynamic>> userData =
        await FirebaseFirestore.instance.collection('Users').doc(uid).get();

    if (userData.exists && userData.data()!.containsKey('nombre')) {
      return userData['nombre'] ?? '';
    }

    // Si el usuario no se encuentra en la colección "Users", buscar en "psychologists"
    userData = await FirebaseFirestore.instance
        .collection('psychologists')
        .doc(uid)
        .get();

    if (userData.exists && userData.data()!.containsKey('nombre')) {
      return userData['nombre'] ?? '';
    }

    // Si el usuario no se encuentra en ninguna colección, devuelve una cadena vacía
    return '';
  }

  Widget _buildFeatureContainer({
    required BuildContext context,
    required Color color,
    required IconData icon,
    required String title,
    required Future navigatorTo,
  }) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: InkWell(
          onTap: () {
            navigatorTo.then((value) {
              PersistentNavBarNavigator.pushNewScreen(
                context,
                screen: value,
                withNavBar: false,
              );
            });
          },
          child: Container(
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: Colors.white,
                  size: 30,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGridItem({
    required BuildContext context,
    required Color color,
    required IconData icon,
    required String title,
    required Future navigatorTo,
  }) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () {
          navigatorTo.then((value) {
            PersistentNavBarNavigator.pushNewScreen(
              context,
              screen: value,
              withNavBar: false,
            );
          });
        },
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.white,
                size: 30,
              ),
              const SizedBox(height: 5),
              Text(
                title,
                style: const TextStyle(color: Colors.white, fontSize: 15),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
