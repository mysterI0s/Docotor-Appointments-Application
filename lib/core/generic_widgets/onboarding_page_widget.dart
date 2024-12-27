import 'package:final_project/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class OnboardingPageWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;

  const OnboardingPageWidget({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          imagePath,
          height: 271.0,
        ),
        const SizedBox(height: 100.0),
        Text(
          title,
          style: AppTextStyle.f32W700NearBlackColor,
        ),
        const SizedBox(height: 8.0),
        Text(
          description,
          textAlign: TextAlign.center,
          style: AppTextStyle.f16W400DarkGrayColor,
        ),
      ],
    );
  }
}
