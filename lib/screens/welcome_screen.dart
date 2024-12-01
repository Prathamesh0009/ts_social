import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ts_social/constants/styles.dart';
import 'package:ts_social/screens/login_screen.dart';
import 'package:ts_social/widgets/email_button.dart';
import 'package:ts_social/widgets/social_login_buttons.dart';
import 'package:ts_social/screens/signup_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -45,
            left: -8,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height, //Dynamically adjusts the image’s height based on the screen size.
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image:
                      AssetImage("lib/assets/images/welcome_screen_image.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 5),
                child: const Text(
                  'thoughtsketch',
                  style: AppStyles.whiteBold32, 
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      "Login in with",
                      style: AppStyles.loginText, 
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const SocialLoginButtons(),
                    const SizedBox(height: 10),
                    const Text(
                      'Or',
                      textAlign: TextAlign.center,
                      style: AppStyles.greyText, 
                    ),
                    const SizedBox(height: 10),
                    EmailButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  LoginScreen(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: RichText(
                        text: TextSpan(
                          text: "Don't have an account yet? ",
                          style: AppStyles.greyText, 
                          children: [
                            TextSpan(
                              text: 'Create an account',
                              style: AppStyles.blueText,
                              recognizer: TapGestureRecognizer() //Detects taps on "Create an account" 
                                ..onTap = () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const SignupScreen(),
                                    ),
                                  );
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
