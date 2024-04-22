// ignore_for_file: library_private_types_in_public_api, unused_element, avoid_print, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:uuid/uuid.dart';

class ScheduleAppointmentPage extends StatefulWidget {
  final String psychologistName;
  final String psychologistlastName;

  const ScheduleAppointmentPage(
      {super.key,
      required this.psychologistName,
      required this.psychologistlastName});

  @override
  _ScheduleAppointmentPageState createState() =>
      _ScheduleAppointmentPageState();
}

class _ScheduleAppointmentPageState extends State<ScheduleAppointmentPage> {
  late DateTime _selectedDate;
  late TimeOfDay _selectedTime;
  late String _selectedSessionType;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
    _selectedTime = TimeOfDay.now();
    _selectedSessionType = 'Presencial';
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (pickedTime != null && pickedTime != _selectedTime) {
      setState(() {
        _selectedTime = pickedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agendar cita'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Agendar cita nueva con:',
                  style: TextStyle(fontSize: 20)),
              Text('${widget.psychologistName} ${widget.psychologistlastName}',
                  style: const TextStyle(
                      fontSize: 40, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              TableCalendar(
                focusedDay: DateTime.now(),
                firstDay: DateTime.now(),
                lastDay: DateTime.now().add(const Duration(days: 365)),
                headerStyle: const HeaderStyle(
                  formatButtonVisible: false,
                ),
                calendarStyle: CalendarStyle(
                  selectedDecoration: const BoxDecoration(
                    color: Color.fromRGBO(7, 185, 159, 1),
                    shape: BoxShape.circle,
                  ),
                  selectedTextStyle: const TextStyle(color: Colors.white),
                  todayDecoration: BoxDecoration(
                    color: Colors.grey[300],
                    shape: BoxShape.circle,
                  ),
                ),
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDate, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDate = selectedDay;
                  });
                },
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: () => _selectTime(context),
                borderRadius: BorderRadius.circular(10),
                child: Ink(
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(7, 185, 159, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const SizedBox(
                    width: 150,
                    height: 55,
                    child: Center(
                      child: Text(
                        "Seleccionar Hora",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile<String>(
                      title: const Text(
                        'Presencial',
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                      value: 'Presencial',
                      groupValue: _selectedSessionType,
                      onChanged: (value) {
                        setState(() {
                          _selectedSessionType = value!;
                        });
                      },
                      dense: true,
                      activeColor: const Color.fromRGBO(7, 185, 159, 1),
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<String>(
                      title: const Text(
                        'En Línea',
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                      value: 'En Línea',
                      groupValue: _selectedSessionType,
                      onChanged: (value) {
                        setState(() {
                          _selectedSessionType = value!;
                        });
                      },
                      dense: true,
                      activeColor: const Color.fromRGBO(7, 185, 159, 1),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: () {
                  sendAppointmentData(context);
                },
                borderRadius: BorderRadius.circular(10),
                child: Ink(
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(7, 185, 159, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const SizedBox(
                    width: 250,
                    height: 55,
                    child: Center(
                      child: Text(
                        "Confirmar",
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
        ),
      ),
    );
  }

  Future<void> sendAppointmentData(BuildContext context) async {
    final user = FirebaseAuth.instance.currentUser;
    final db = FirebaseFirestore.instance;
    final userDoc = await db.collection('Users').doc(user!.uid).get();

    final userName = userDoc['nombre'];
    final userLastName = userDoc['apellido'];
    final uuid = const Uuid().v4();

    hideCurrentSnackBar(context);
    Map<String, dynamic> appointmentData = {
      'date': _selectedDate.toString(),
      'time': _selectedTime.format(context),
      'psychologistName': widget.psychologistName,
      'psychologistlastName': widget.psychologistlastName,
      'sessionType': _selectedSessionType,
      'userId': user.uid,
      'userName': userName, // Guardar solo el nombre del usuario
      'userLastName': userLastName, // Guardar solo el apellido del usuario
      'uuid': uuid,
    };

    DocumentReference<Map<String, dynamic>> docDataSend =
        db.collection('appointments').doc(user.uid);

    docDataSend.set({uuid: appointmentData}, SetOptions(merge: true));
    Navigator.pop(context);
    sendAppointmentDataAdmin(
        context, user, db, userDoc, userName, userLastName, uuid);
  }

  Future<void> sendAppointmentDataAdmin(BuildContext context, user, db, userDoc,
      userName, userLastName, uuid) async {
    hideCurrentSnackBar(context);
    Map<String, dynamic> appointmentData = {
      'date': _selectedDate.toString(),
      'time': _selectedTime.format(context),
      'psychologistName': widget.psychologistName,
      'psychologistlastName': widget.psychologistlastName,
      'sessionType': _selectedSessionType,
      'userId': user.uid,
      'userName': userName, // Guardar solo el nombre del usuario
      'userLastName': userLastName, // Guardar solo el apellido del usuario
      'uuid': uuid,
    };

    DocumentReference<Map<String, dynamic>> docDataSend =
        db.collection('appointments_admin').doc('appointments_admin');

    docDataSend.set({uuid: appointmentData}, SetOptions(merge: true));
    Navigator.pop(context);
  }
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
