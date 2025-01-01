import 'package:final_project/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:final_project/core/theme/app_colors.dart';

class CustomDatePickerField extends StatelessWidget {
  final String label;
  final DateTime initialDate;
  final ValueChanged<DateTime> onDatePicked;

  const CustomDatePickerField({
    required this.label,
    required this.initialDate,
    required this.onDatePicked,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyle.f16W400NearBlackColor),
        SizedBox(height: 5.h),
        InkWell(
          onTap: () async {
            final date = await showDatePicker(
              context: context,
              initialDate: initialDate,
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
            );
            if (date != null) onDatePicked(date);
          },
          child: InputDecorator(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
                borderSide: const BorderSide(color: AppColors.borderColor),
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
            ),
            child: Text(
              "${initialDate.day} ${initialDate.month} ${initialDate.year}",
              style: AppTextStyle.f16W400NearBlackColor,
            ),
          ),
        ),
      ],
    );
  }
}
