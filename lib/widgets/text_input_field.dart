import 'package:flutter/material.dart';
import 'package:ts_social/constants/styles.dart';

class TextInputField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;

  const TextInputField({
    Key? key,
    required this.label,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      decoration: AppStyles.inputDecoration.copyWith(
        labelText: label,
      ),
    );
  }
}
