import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_text_style.dart';
import 'bloc/text_form_field_cubit.dart';
import 'bloc/text_form_field_state.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.isPassword = false,
    this.isConfirmPassword = false,
    required this.controller,
  });
  final bool isPassword;
  final bool isConfirmPassword;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TextFormFieldCubit, TextFormFieldState>(
      builder: (context, state) {
        return SizedBox(
          height: 48.h,
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              hintStyle: AppTextStyle.f16W400DarkGrayColor,
              contentPadding: EdgeInsets.symmetric(
                vertical: 14.h,
                horizontal: 16.w,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
                borderSide: const BorderSide(
                  color: AppColors.borderColor,
                ),
              ),
              suffixIcon: Visibility(
                  visible: isPassword || isConfirmPassword,
                  child: IconButton(
                    onPressed: () {
                      if (isPassword) {
                        context.read<TextFormFieldCubit>().changeHiddenStatue();
                      } else if (isConfirmPassword) {
                        context
                            .read<TextFormFieldCubit>()
                            .changeConfrimHiddenStatue();
                      }
                    },
                    icon: Icon(isPassword
                        ? (context.read<TextFormFieldCubit>().hiddenPassword)
                            ? Icons.visibility_off
                            : Icons.visibility
                        : (isConfirmPassword)
                            ? (context
                                    .read<TextFormFieldCubit>()
                                    .hiddenConfirmPassword)
                                ? Icons.visibility_off
                                : Icons.visibility
                            : null),
                  )),
            ),
            obscureText: isPassword
                ? context.read<TextFormFieldCubit>().hiddenPassword
                : isConfirmPassword
                    ? context.read<TextFormFieldCubit>().hiddenConfirmPassword
                    : false,
          ),
        );
      },
    );
  }
}
