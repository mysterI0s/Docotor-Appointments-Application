import 'package:final_project/core/constants/app_images.dart';
import 'package:final_project/core/theme/app_colors.dart';
import 'package:final_project/features/authentication/screens/on_boarding_screen.dart';
import 'package:final_project/features/authentication/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';

import '../../core/constants/app_consts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      if ((box.read('isFirstOpen') ?? true) == true) {
        //isFirstOpen should be => AppConst.isFirstOpen
        box.write('isFirstOpen', false);
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const OnBoardingScreen(),
          ),
        );
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => SignInScreen(),
          ),
        );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: AppColors.backGroundColor,
        body: Center(
          child: Image(
            image: AssetImage(
              AppImages.splashImage,
            ),
          ),
        ));
  }
}
