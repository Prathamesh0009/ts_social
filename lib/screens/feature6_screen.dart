import 'package:flutter/material.dart';

class Feature6Screen extends StatefulWidget {
  const Feature6Screen({super.key});

  @override
  State<Feature6Screen> createState() => _Feature3ScreenState();
}

class _Feature3ScreenState extends State<Feature6Screen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("feature screen 3",textAlign: TextAlign.center,),
    );
  }
}