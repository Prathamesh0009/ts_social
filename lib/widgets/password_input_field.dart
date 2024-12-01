import 'package:flutter/material.dart';
import 'package:ts_social/constants/styles.dart';

class PasswordInputField extends StatefulWidget {
  final TextEditingController? controller;  //used to control and retrieve the text input value of a text field.
  final String? Function(String?)? validator;

  const PasswordInputField({
    Key? key,
    this.controller,
    this.validator,
  }) : super(key: key);

  @override
  State<PasswordInputField> createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: !_isPasswordVisible,
      validator: widget.validator,
      decoration: AppStyles.passwordInputDecoration.copyWith(
        suffixIcon: IconButton(
          icon: Icon(
            _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
          },
        ),
      ),
    );
  }
}
