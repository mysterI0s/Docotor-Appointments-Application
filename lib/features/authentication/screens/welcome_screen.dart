import 'package:final_project/core/theme/app_colors.dart';
import 'package:final_project/core/theme/app_text_style.dart';
import 'package:final_project/features/authentication/screens/sign_in_screen.dart';
import 'package:final_project/features/authentication/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:final_project/core/generic_widgets/main_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 24.w), // Use ScreenUtil for padding
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              const Text(
                "Welcome !",
                style: AppTextStyle.f40W700NearBlackColor,
              ),
              const Spacer(),
              MainButton(
                text: "Sign Up",
                minWidth: double.infinity,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => SignUpScreen(),
                    ),
                  );
                },
              ),
              SizedBox(height: 24.h),
              MainButton(
                text: "Log In",
                minWidth: double.infinity,
                buttonColor: AppColors.snowColor,
                textStyle: AppTextStyle.f16W700LightGrayColor.copyWith(
                  color: AppColors.primaryColor,
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => SignInScreen(),
                    ),
                  );
                },
              ),
              SizedBox(height: 32.h),
            ],
          ),
        ),
      ),
    );
  }
}
