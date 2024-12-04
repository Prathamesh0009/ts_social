import 'package:flutter/material.dart';
import 'package:ts_social/widgets/app_drawer.dart';

class HomeScreen extends StatelessWidget {

  const HomeScreen({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      drawer: AppDrawer(),
      body: const Center(
        child: Text('Welcome to the Home Screen!'),
      ),
    );
  }
}
