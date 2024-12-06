import 'package:flutter/material.dart';

class Feature1Screen extends StatefulWidget {
  const Feature1Screen({super.key});

  @override
  State<Feature1Screen> createState() => _Feature1ScreenState();
}

class _Feature1ScreenState extends State<Feature1Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("feature screen 1",textAlign: TextAlign.center,),
    );
  }
}