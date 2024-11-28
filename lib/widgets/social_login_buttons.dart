import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ts_social/constants/styles.dart';

class SocialLoginButtons extends StatelessWidget {
  final Axis direction; 

  const SocialLoginButtons({
    super.key,
    this.direction = Axis.horizontal, 
  });

  @override
  Widget build(BuildContext context) {
    if (direction == Axis.horizontal) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: _buildButtons(),
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: _buildButtons(spacing: 16.0), 
      );
    }
  }

  List<Widget> _buildButtons({double spacing = 0.0}) {
    return [
      OutlinedButton(
        onPressed: () {
          
        },
        style: AppStyles.socialButtonStyle,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'lib/assets/icons/google_logo.svg',
              width: 24,
              height: 24,
            ),
            const SizedBox(width: 8),
            const Text(
              'Google',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
      SizedBox(width: 30, height: 30), 
      OutlinedButton(
        onPressed: () {
          
        },
        style: AppStyles.socialButtonStyle,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'lib/assets/icons/facebook_logo.svg',
              width: 24,
              height: 24,
            ),
            const SizedBox(width: 8),
            const Text(
              'Facebook',
              style: TextStyle(color: Colors.blue),
            ),
          ],
        ),
      ),
    ];
  }
}
