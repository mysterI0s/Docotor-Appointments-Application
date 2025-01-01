import 'package:final_project/core/constants/app_consts.dart';
import 'package:final_project/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.lightGray,
    fontFamily: AppConst.nunito,
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.black,
    scaffoldBackgroundColor: Colors.grey[900],
    fontFamily: AppConst.nunito,
    textTheme: const TextTheme(
      displayMedium: TextStyle(color: Colors.white),
      bodyLarge: TextStyle(color: Colors.white),
    ),
  );
}
