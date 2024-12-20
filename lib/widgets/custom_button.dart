import 'package:flutter/material.dart';
import 'package:ts_social/constants/styles.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed; //represents a function with no parameters and no return value.
  final String label;
  final bool isLoading;

  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.label,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: isLoading ? null : onPressed,
        style: AppStyles.customButtonStyle, 
        child: isLoading
            ? const CircularProgressIndicator(color: Colors.black)
            : Text(
                label,
                style: AppStyles.customButtonText,
              ),
      ),
    );
  }
}
