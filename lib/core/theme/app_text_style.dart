import 'package:final_project/core/constants/app_consts.dart';
import 'package:final_project/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextStyle {
  static const TextStyle f32W700NearBlackColor = TextStyle(
    color: AppColors.fontNearBlackColor,
    fontFamily: AppConst.nunito,
    fontSize: 32,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle f16W400DarkGrayColor = TextStyle(
    color: AppColors.fontDarkGrayColor,
    fontFamily: AppConst.nunito,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
}
