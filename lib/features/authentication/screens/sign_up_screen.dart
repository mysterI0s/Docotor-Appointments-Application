import 'package:easy_localization/easy_localization.dart';
import 'package:final_project/core/constants/app_consts.dart';
import 'package:final_project/core/constants/app_images.dart';
import 'package:final_project/core/constants/app_strings.dart';
import 'package:final_project/core/generic_widgets/custom_text_form_field/bloc/text_form_field_cubit.dart';
import 'package:final_project/core/generic_widgets/custom_text_form_field/custom_text_form_field.dart';
import 'package:final_project/core/generic_widgets/main_button.dart';
import 'package:final_project/core/theme/app_colors.dart';
import 'package:final_project/core/theme/app_text_style.dart';
import 'package:final_project/features/authentication/cubit/auth_cubit.dart';
import 'package:final_project/features/authentication/cubit/auth_state.dart';
import 'package:final_project/features/authentication/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailAddressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  SignUpScreen({super.key});

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
                  AppStrings.signup.tr(),
                  textAlign: TextAlign.center,
                  style: AppTextStyle.f40W700NearBlackColor,
                ),
                SizedBox(height: 40.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    AppStrings.name.tr(),
                    style: AppTextStyle.f12W400NearBlackColor.copyWith(
                      fontSize: 12.sp,
                    ),
                  ),
                ),
                SizedBox(height: 4.h),
                CustomTextFormField(
                  controller: nameController,
                ),
                SizedBox(height: 20.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    AppStrings.email.tr(),
                    style: AppTextStyle.f12W400NearBlackColor.copyWith(
                      fontSize: 12.sp,
                    ),
                  ),
                ),
                SizedBox(height: 4.h),
                CustomTextFormField(
                  controller: emailAddressController,
                ),
                SizedBox(height: 20.h),
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
                SizedBox(height: 20.h),
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
                SizedBox(height: 40.h),
                BlocConsumer<AuthCubit, AuthState>(
                  builder: (BuildContext context, AuthState state) {
                    if (state is RegisterLoadingState) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return MainButton(
                        text: AppStrings.signup.tr(),
                        onPressed: () {
                          final regex = RegExp(
                              r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)[A-Za-z\d]{8,}$');
                          final name = nameController.text.trim();
                          final email = emailAddressController.text.trim();
                          final password = passwordController.text.trim();
                          final confirmPassword =
                              confirmPasswordController.text.trim();

                          if (name.isEmpty ||
                              email.isEmpty ||
                              password.isEmpty ||
                              confirmPassword.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content:
                                    Text(AppStrings.pleaseFillAllFields.tr()),
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
                                content:
                                    Text(AppStrings.passwordsDoNotMatch.tr()),
                                backgroundColor: Colors.red,
                              ),
                            );
                          } else {
                            context.read<AuthCubit>().register(
                                email, name, password, confirmPassword);
                          }
                        },
                      );
                    }
                  },
                  listener: (BuildContext context, AuthState state) {
                    if (state is RegisterSuccessState) {
                      box.write(AppConst.user, state.model.user?.toJson());
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(AppStrings.signedUpSuccessfully.tr()),
                          backgroundColor: Colors.green,
                        ),
                      );
                      Future.delayed(const Duration(seconds: 1), () {
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) => SignInScreen(),
                          ),
                          (Route<dynamic> route) => false,
                        );
                      });
                    }

                    if (state is RegisterErrorState) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(state.errorMsg)));
                    }
                  },
                ),
                SizedBox(height: 32.h),
                Column(
                  children: [
                    Text(
                      AppStrings.or.tr(),
                      style: AppTextStyle.f32W700NearBlackColor.copyWith(
                        fontSize: 16.sp,
                      ),
                    ),
                    SizedBox(height: 21.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: SvgPicture.asset(
                            AppImages.facebook,
                            height: 32.r,
                            width: 32.r,
                          ),
                          onPressed: () {
                            // Facebook login
                          },
                        ),
                        SizedBox(width: 18.w),
                        IconButton(
                          icon: SvgPicture.asset(
                            AppImages.chrome,
                            height: 32.r,
                            width: 32.r,
                          ),
                          onPressed: () {
                            // Google login
                          },
                        ),
                        SizedBox(width: 18.w),
                        IconButton(
                          icon: SvgPicture.asset(
                            AppImages.x,
                            height: 32.r,
                            width: 32.r,
                          ),
                          onPressed: () {
                            // X login
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 18.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppStrings.haveAccount.tr(),
                      style: AppTextStyle.f12W400NearBlackColor.copyWith(
                        fontSize: 12.sp,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => SignInScreen(),
                          ),
                        );
                      },
                      child: Text(
                        AppStrings.login.tr(),
                        style: AppTextStyle.f12W400NearBlackColor.copyWith(
                          fontSize: 12.sp,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
