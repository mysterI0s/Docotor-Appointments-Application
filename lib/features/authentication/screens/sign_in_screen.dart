import 'package:easy_localization/easy_localization.dart';
import 'package:final_project/core/constants/app_consts.dart';
import 'package:final_project/core/constants/app_images.dart';
import 'package:final_project/core/constants/app_strings.dart';
import 'package:final_project/core/generic_widgets/custom_text_form_field/custom_text_form_field.dart';
import 'package:final_project/core/generic_widgets/main_button.dart';
import 'package:final_project/core/theme/app_colors.dart';
import 'package:final_project/core/theme/app_text_style.dart';
import 'package:final_project/features/authentication/cubit/auth_cubit.dart';
import 'package:final_project/features/authentication/cubit/auth_state.dart';
import 'package:final_project/features/authentication/screens/forgot_password_screen.dart';
import 'package:final_project/features/authentication/screens/sign_up_screen.dart';
import 'package:final_project/features/home/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthCubit(),
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
                  AppStrings.login.tr(),
                  textAlign: TextAlign.center,
                  style: AppTextStyle.f40W700NearBlackColor,
                ),
                SizedBox(height: 40.h),
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
                  controller: emailController,
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
                SizedBox(height: 8.h),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ForgotPasswordScreen(),
                      ));
                    },
                    child: Text(
                      AppStrings.forgotPassword.tr(),
                      style: AppTextStyle.f12W400NearBlackColor.copyWith(
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 178.h),
                BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is LoginSuccessState) {
                      box.write(AppConst.isLoggedIn, true);
                      box.write(AppConst.accessToken, state.model.accessToken);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(AppStrings.loggedInSuccessfully.tr()),
                          backgroundColor: Colors.green,
                        ),
                      );
                      Future.delayed(const Duration(seconds: 1), () {
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ),
                          (Route<dynamic> route) => false,
                        );
                      });
                    } else if (state is LoginErrorState) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.errorMsg),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is LoginLoadingState) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    return MainButton(
                      text: AppStrings.login.tr(),
                      onPressed: () {
                        final regex = RegExp(
                            r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)[A-Za-z\d]{8,}$');
                        final email = emailController.text.trim();
                        final password = passwordController.text.trim();

                        if (email.isEmpty || password.isEmpty) {
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
                        } else {
                          context.read<AuthCubit>().login(email, password);
                        }
                      },
                    );
                  },
                ),
                SizedBox(height: 38.h),
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
                      AppStrings.doNotHaveAccount.tr(),
                      style: AppTextStyle.f12W400NearBlackColor.copyWith(
                        fontSize: 12.sp,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => SignUpScreen(),
                          ),
                        );
                      },
                      child: Text(
                        AppStrings.signup.tr(),
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
