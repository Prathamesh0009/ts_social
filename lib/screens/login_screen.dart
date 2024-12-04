import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:ts_social/constants/styles.dart';
import 'package:ts_social/screens/create_account_screen.dart';
import 'package:ts_social/screens/home_screen.dart';
import 'package:ts_social/widgets/custom_button.dart';
import 'package:ts_social/widgets/password_input_field.dart';
import 'package:ts_social/widgets/text_input_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  String? _errorMessage;

  Future<void> _signIn() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() => _isLoading = true);
      try {
        final result = await Amplify.Auth.signIn(
          username: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
        if (result.isSignedIn) {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomeScreen(),),);
        } else {
          setState(() => _errorMessage = "Sign-in not complete");
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
                'Login to your account.',
                style: AppStyles.screenTitleText, 
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32.0),
              TextInputField(
                label: 'Email',
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
                validator: (value) => value == null || !value.contains('@')
                    ? "Enter a valid email"
                    : null,
              ),
              const SizedBox(height: 16.0),
              PasswordInputField(
                controller: _passwordController,
                validator: (value) => value == null || value.length < 6
                    ? "Password must be at least 6 characters"
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
                onPressed: _signIn,
                label: 'Login',
                isLoading: _isLoading,
              ),
              const SizedBox(height: 16.0),
              Center(
                      child: RichText(
                        text: TextSpan(
                          text: "Don't have an account yet? ",
                          style: AppStyles.greyText, 
                          children: [
                            TextSpan(
                              text: 'Sign Up',
                              style: AppStyles.blueText,
                              recognizer: TapGestureRecognizer() //Detects taps on "Sign Up" 
                                ..onTap = () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const CreateAccountScreen(),
                                    ),
                                  );
                                },
                            ),
                          ],
                        ),
                      ),
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
