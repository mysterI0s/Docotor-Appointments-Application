import 'package:easy_localization/easy_localization.dart';
import 'package:final_project/core/constants/app_strings.dart';
import 'package:final_project/core/generic_widgets/custom_text_form_field/bloc/text_form_field_cubit.dart';
import 'package:final_project/core/generic_widgets/custom_text_form_field/custom_text_form_field.dart';
import 'package:final_project/core/generic_widgets/main_button.dart';
import 'package:final_project/core/theme/app_text_style.dart';
import 'package:final_project/features/authentication/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewPasswordScreen extends StatelessWidget {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  NewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TextFormFieldCubit(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: 24.w,
              vertical: 12.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  AppStrings.enterNewPassword.tr(),
                  textAlign: TextAlign.center,
                  style: AppTextStyle.f32W700NearBlackColor,
                ),
                SizedBox(height: 188.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    AppStrings.password.tr(),
                    style: AppTextStyle.f12W400NearBlackColor.copyWith(
                      fontSize: 12.sp,
                    ),
                  ),
                ),
                SizedBox(height: 4.h),
                CustomTextFormField(
                  isPassword: true,
                  controller: passwordController,
                ),
                SizedBox(height: 26.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    AppStrings.confirmPassword.tr(),
                    style: AppTextStyle.f12W400NearBlackColor.copyWith(
                      fontSize: 12.sp,
                    ),
                  ),
                ),
                SizedBox(height: 4.h),
                CustomTextFormField(
                  isConfirmPassword: true,
                  controller: confirmPasswordController,
                ),
                SizedBox(height: 178.h),
                MainButton(
                  text: AppStrings.continueText.tr(),
                  onPressed: () {
                    final regex = RegExp(
                        r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)[A-Za-z\d]{8,}$');
                    final password = passwordController.text.trim();
                    final confirmPassword =
                        confirmPasswordController.text.trim();

                    if (password.isEmpty || confirmPassword.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(AppStrings.pleaseFillAllFields.tr()),
                          backgroundColor: Colors.red,
                        ),
                      );
                    } else if (!regex.hasMatch(password)) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(AppStrings.invalidPassword.tr()),
                          backgroundColor: Colors.red,
                        ),
                      );
                    } else if (password != confirmPassword) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(AppStrings.passwordsDoNotMatch.tr()),
                          backgroundColor: Colors.red,
                        ),
                      );
                    } else {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => SignInScreen(),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
