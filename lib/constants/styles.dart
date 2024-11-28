import 'package:flutter/material.dart';

class AppStyles {
  static const TextStyle whiteBold32 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static const TextStyle loginText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  );

  static const TextStyle blueText = TextStyle(
    color: Colors.blue,
    decoration: TextDecoration.underline,
  );

  static const TextStyle greyText = TextStyle(
    color: Colors.grey,
  );

  static final emailButtonStyle = OutlinedButton.styleFrom(
    side: BorderSide(color: Colors.grey.shade300),
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
  );

  static final socialButtonStyle = OutlinedButton.styleFrom(
    backgroundColor: Colors.white,
    side: BorderSide(color: Colors.grey.shade300),
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
  );

  // Styles for CustomButton
  static final customButtonStyle = OutlinedButton.styleFrom(
    padding: const EdgeInsets.symmetric(vertical: 16.0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
  );

  static const customButtonText = TextStyle(
    fontSize: 16.0,
    color: Colors.black,
  );

  // Styles for PasswordInputField and TextInputField
  static final inputDecoration = InputDecoration(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(color: Colors.grey.shade300),
    ),
  );

  static final passwordInputDecoration = inputDecoration.copyWith(
    labelText: 'Password',
  );

  // Styles for CreateAccountScreen, LoginScreen, SignupScreen, and WelcomeScreen
  static const screenTitleText = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
  );

  static const subtitleText = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
  );

  static const disclaimerText = TextStyle(
    fontSize: 12.0,
    color: Colors.grey,
  );
}
