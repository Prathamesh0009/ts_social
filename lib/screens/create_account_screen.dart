import 'package:flutter/material.dart';
import 'package:ts_social/constants/styles.dart';
import 'package:ts_social/widgets/custom_button.dart';
import 'package:ts_social/widgets/password_input_field.dart';
import 'package:ts_social/widgets/text_input_field.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:ts_social/screens/email_verification_screen.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({Key? key}) : super(key: key);

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final _formKey = GlobalKey<FormState>(); //Uniquely identifies the form widget for validation.
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  String? _errorMessage;

  Future<void> _signUp() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() => _isLoading = true);

      try {
        final result = await Amplify.Auth.signUp(
          username: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );

         Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EmailVerificationScreen(
                email: _emailController.text.trim(),
              ),
            ),
          );
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Create Account.',
                style: AppStyles.screenTitleText,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32.0),
              TextInputField(
                label: 'Full name',
                controller: _fullNameController,
                validator: (value) =>
                    value == null || value.trim().isEmpty ? 'Name is required' : null,
              ),
              const SizedBox(height: 16.0),
              TextInputField(
                label: 'Email',
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
                validator: (value) => value == null || !value.contains('@')
                    ? 'Enter a valid email'
                    : null,
              ),
              const SizedBox(height: 16.0),
              PasswordInputField(
                controller: _passwordController,
                validator: (value) => value == null || value.length < 6
                    ? 'Password must be at least 6 characters'
                    : null,
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
                onPressed: _signUp,
                label: 'Sign Up',
                isLoading: _isLoading,
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
