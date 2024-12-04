import 'package:flutter/material.dart';

class Feature3Screen extends StatefulWidget {
  const Feature3Screen({super.key});

  @override
  State<Feature3Screen> createState() => _Feature3ScreenState();
}

class _Feature3ScreenState extends State<Feature3Screen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("feature screen 3",textAlign: TextAlign.center,),
    );
  }
}