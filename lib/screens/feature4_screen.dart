import 'package:flutter/material.dart';

class Feature4Screen extends StatefulWidget {
  const Feature4Screen({super.key});

  @override
  State<Feature4Screen> createState() => _Feature3ScreenState();
}

class _Feature3ScreenState extends State<Feature4Screen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("feature screen 4",textAlign: TextAlign.center,),
    );
  }
}