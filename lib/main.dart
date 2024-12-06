import 'package:flutter/material.dart';
import 'package:ts_social/screens/landing_screen.dart';
import 'package:ts_social/screens/welcome_screen.dart';
import 'package:ts_social/services/amplify_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //Ensures that Flutter is fully initialized before any asynchronous operations.

  // Initialize Amplify
  final amplifyService = AmplifyService(); // create an instance of Amplify Service
  await amplifyService.configureAmplify(); // configures amplify before the app starts

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      home: const WelcomeScreen(),
    );
  }
}
