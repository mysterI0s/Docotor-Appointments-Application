import 'package:final_project/core/constants/app_images.dart';
import 'package:final_project/core/theme/app_colors.dart';
import 'package:final_project/features/authentication/screens/on_boarding_screen.dart';
import 'package:final_project/features/authentication/screens/welcome_screen.dart';
import 'package:final_project/features/home/screens/home_screen.dart';
import 'package:flutter/material.dart';

import '../../core/constants/app_consts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final bool isLoggedIn = box.read('isLoggedIn') ?? false;
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      if ((box.read(AppConst.isFirstOpen) ?? true) == true) {
        box.write(AppConst.isFirstOpen, false);
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => OnBoardingScreen(),
          ),
        );
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) =>
                isLoggedIn ? const HomeScreen() : const WelcomeScreen(),
          ),
        );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.lightGray,
      body: Center(
        child: Image(
          image: AssetImage(
            AppImages.splashImage,
          ),
        ),
      ),
    );
  }
}
