import 'package:flutter/material.dart';

class Feature2Screen extends StatefulWidget {
  const Feature2Screen({super.key});

  @override
  State<Feature2Screen> createState() => _Feature2ScreenState();
}

class _Feature2ScreenState extends State<Feature2Screen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("feature screen 2",textAlign: TextAlign.center,),
    );
  }
}