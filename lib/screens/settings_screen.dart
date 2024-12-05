import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          
          ListTile(
            leading: const Icon(Icons.widgets, color: Colors.blue),
            title: const Text('Tab Bar'),
            trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
            onTap: () {},
          ),
          const Divider(),

          ListTile(
            leading: const Icon(Icons.brush, color: Colors.purple),
            title: const Text('Appearance'),
            trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
            onTap: () {},
          ),
          const Divider(),

          ListTile(
            leading: const Icon(Icons.access_time, color: Colors.orange),
            title: const Text('Date & Time'),
            trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
            onTap: () {},
          ),
          const Divider(),
        ],
      ),
    );
  }
}
