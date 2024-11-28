import 'package:flutter/material.dart';
import 'package:ts_social/constants/styles.dart';

class EmailButton extends StatelessWidget {
  final VoidCallback onPressed; 
  const EmailButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onPressed, 
      icon: const Icon(Icons.email),
      label: const Text('Continue with Email'),
      style: AppStyles.emailButtonStyle,
    );
  }
}
