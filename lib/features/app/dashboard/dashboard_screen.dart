import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  List<Widget> _buildScreen() {
    return [
      const Text('Home'),
      const Text('Chat'),
      const Text('Add'),
      const Text('Profile'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
        context,
        screens: _buildScreen()
    );
  }
}
