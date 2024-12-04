import 'package:flutter/material.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:ts_social/constants/styles.dart';
import 'package:ts_social/screens/home_screen.dart';
import 'package:ts_social/widgets/custom_button.dart';
import 'package:ts_social/widgets/text_input_field.dart';

class EmailVerificationScreen extends StatefulWidget {
  final String email;

  const EmailVerificationScreen({Key? key, required this.email})
      : super(key: key);

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _codeController = TextEditingController();
  bool _isLoading = false;
  String? _errorMessage;

  Future<void> _verifyEmail() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() => _isLoading = true);
      try {
        final result = await Amplify.Auth.confirmSignUp(
          username: widget.email,
          confirmationCode: _codeController.text.trim(),
        );
        if (result.isSignUpComplete) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ),
          );
        } else {
          setState(() => _errorMessage = "Verification not complete.");
        }
      } catch (e) {
        setState(() => _errorMessage = e.toString());
      } finally {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Enter the verification code sent to your email.',
                style: AppStyles.screenTitleText,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32.0),
              TextInputField(
                label: 'Verification Code',
                controller: _codeController,
                keyboardType: TextInputType.number,
                validator: (value) =>
                    value == null || value.isEmpty ? 'Code is required' : null,
              ),
              const SizedBox(height: 24.0),
              if (_errorMessage != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: Text(
                    _errorMessage!,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              CustomButton(
                onPressed: _verifyEmail,
                label: 'Verify',
                isLoading: _isLoading,
              ),
              const SizedBox(height: 16.0),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Didn't receive the code? Resend"),
              ),
              const SizedBox(height: 32.0),
              const Text(
                'thoughtsketch',
                style: AppStyles.subtitleText,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
