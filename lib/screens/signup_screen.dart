import 'package:flutter/material.dart';
import 'package:ts_social/constants/styles.dart';
import 'package:ts_social/screens/create_account_screen.dart';
import 'package:ts_social/widgets/email_button.dart';
import 'package:ts_social/widgets/social_login_buttons.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
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
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Get started for free.',
              style: AppStyles.screenTitleText, 
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            const SocialLoginButtons(
              direction: Axis.vertical,
            ),
            const SizedBox(height: 20),
            const Text(
              '- Or -',
              style: AppStyles.greyText,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            EmailButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CreateAccountScreen(),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            const Text(
              "By signing in, you agree to our Terms of Use & Privacy Policy",
              style: AppStyles.disclaimerText, 
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            const Text(
              'thoughtsketch',
              style: AppStyles.subtitleText, 
            ),
          ],
        ),
      ),
    );
  }
}
