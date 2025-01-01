import 'package:final_project/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:final_project/core/theme/app_colors.dart';

class CustomInputField extends StatelessWidget {
  final String label;
  final String initialValue;
  final ValueChanged<String> onChanged;

  const CustomInputField({
    required this.label,
    required this.initialValue,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyle.f16W400NearBlackColor),
        SizedBox(height: 5.h),
        TextField(
          controller: TextEditingController(text: initialValue),
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: label,
            hintStyle: AppTextStyle.f16W400NearBlackColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: const BorderSide(color: AppColors.borderColor),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
          ),
        ),
      ],
    );
  }
}
