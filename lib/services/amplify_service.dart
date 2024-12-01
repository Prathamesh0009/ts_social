import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:ts_social/amplifyconfiguration.dart';

class AmplifyService {

  // Configure Amplify
  Future<void> configureAmplify() async {
    try {
      final authPlugin = AmplifyAuthCognito(); // Creates the authentication plugin instance.
      await Amplify.addPlugin(authPlugin); //Adds the plugin to Amplify.
      await Amplify.configure(amplifyconfig); ///Configures Amplify using amplifyconfiguration.dart
      print('Amplify configured successfully');
    } catch (e) {
      print('Failed to configure Amplify: $e');
    }
  }

  // Sign-Up User
  Future<void> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final result = await Amplify.Auth.signUp(
        username: email,
        password: password,
      );
      print('Sign-up successful: $result');
    } catch (e) {
      throw Exception('Sign-up failed: ${e.toString()}');
    }
  }

  // Sign-In User
  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final result = await Amplify.Auth.signIn(
        username: email,
        password: password,
      );
      print('Sign-in successful: $result');
    } catch (e) {
      throw Exception('Sign-in failed: ${e.toString()}');
    }
  }

  // Sign-Out User
  Future<void> signOut() async {
    try {
      await Amplify.Auth.signOut();
      print('Sign-out successful');
    } catch (e) {
      throw Exception('Sign-out failed: ${e.toString()}');
    }
  }
}
