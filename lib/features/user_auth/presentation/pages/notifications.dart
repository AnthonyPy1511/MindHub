import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.notifications),
            title: Text('Notification $index'),
            subtitle: const Text('This is a notification message.'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              // Handle notification tap
            },
          );
        },
      ),
    );
  }
}
