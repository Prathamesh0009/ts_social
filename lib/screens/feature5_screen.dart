import 'package:flutter/material.dart';

class Feature5Screen extends StatefulWidget {
  const Feature5Screen({super.key});

  @override
  State<Feature5Screen> createState() => _Feature5ScreenState();
}

class _Feature5ScreenState extends State<Feature5Screen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("feature screen 5",textAlign: TextAlign.center,),
    );
  }
}