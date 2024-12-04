import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const Divider(),
          // Button List
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text('Settings'),
                  onTap: () {
                    
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.man),
                  title: const Text('Profile'),
                  onTap: () {
                   
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
