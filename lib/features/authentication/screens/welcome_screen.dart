import 'package:final_project/core/theme/app_colors.dart';
import 'package:final_project/core/theme/app_text_style.dart';
import 'package:final_project/features/authentication/screens/sign_in_screen.dart';
import 'package:final_project/features/authentication/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:final_project/core/generic_widgets/main_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Text(
                "Welcome !",
                style:
                    AppTextStyle.f32W700NearBlackColor.copyWith(fontSize: 40),
              ),
              const Spacer(),
              MainButton(
                text: "Sign Up",
                minWidth: double.infinity,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const SignUpScreen(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 24.0),
              MainButton(
                text: "Log In",
                minWidth: double.infinity,
                buttonColor: AppColors.snowColor,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const SignInScreen(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 32.0),
            ],
          ),
        ),
      ),
    );
  }
}
