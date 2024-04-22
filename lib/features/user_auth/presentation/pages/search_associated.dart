import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'doctor_profile_page.dart';

class SearchAssociatedPage extends StatelessWidget {
  const SearchAssociatedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Psicólogos Asociados',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Color.fromRGBO(7, 185, 159, 1)),
        elevation: 0,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream:
            FirebaseFirestore.instance.collection('psychologists').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error: ${snapshot.error}',
                style: const TextStyle(color: Colors.red),
              ),
            );
          }
          final psychologists = snapshot.data!.docs.map((doc) {
            final data = doc.data() as Map<String, dynamic>;
            return Psychologist(
              id: doc.id, // Añade el id del psicólogo
              name: data['nombre'] ?? '',
              lastName: data['apellido'] ?? '', // Incluye el apellido
              specialization: data['especializacion'] ?? '',
              description: data['descripcion'] ?? '', // Añade la descripción
              location: data['ubicacion'] ?? '', // Añade la ubicación
              price: data['precio'] ?? '', // Añade el precio
              photoUrl: data['fotoUrl'] ?? '', // Añade la URL de la foto
            );
          }).toList();
          return ListView.builder(
            itemCount: psychologists.length,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 16.0),
                child: InkWell(
                  onTap: () {
                    // Navegar a la vista del perfil del psicólogo cuando se hace clic
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PsychologistProfilePage(
                          psychologist: psychologists[
                              index], // Pasar el psicólogo seleccionado
                        ),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: psychologists[index]
                                    .photoUrl
                                    .isNotEmpty
                                ? NetworkImage(psychologists[index].photoUrl)
                                : const AssetImage('assets/default_avatar.png')
                                    as ImageProvider,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Lic. ${psychologists[index].name} ${psychologists[index].lastName}',
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.favorite_border),
                                      color:
                                          const Color.fromRGBO(7, 185, 159, 1),
                                      onPressed: () {
                                        // Lógica para guardar el perfil del psicólogo
                                      },
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.psychology,
                                      color: Color.fromRGBO(7, 185, 159, 1),
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      psychologists[index].specialization,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on,
                                      color: Color.fromRGBO(7, 185, 159, 1),
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      psychologists[index].location,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.attach_money,
                                      color: Color.fromRGBO(7, 185, 159, 1),
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      '${psychologists[index].price} MXN por sesión.',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class Psychologist {
  final String id; // ID del psicólogo
  final String name;
  final String lastName;
  final String specialization;
  final String description; // Descripción del psicólogo
  final String location; // Ubicación del psicólogo
  final String price; // Precio del psicólogo
  final String photoUrl; // URL de la foto del psicólogo

  Psychologist({
    required this.id,
    required this.name,
    required this.lastName,
    required this.specialization,
    required this.description,
    required this.location,
    required this.price,
    required this.photoUrl,
  });
}
