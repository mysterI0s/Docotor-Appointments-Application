import 'package:easy_localization/easy_localization.dart';
import 'package:final_project/core/constants/app_images.dart';
import 'package:final_project/core/constants/app_strings.dart';
import 'package:final_project/core/generic_widgets/back_arrow_widget.dart';
import 'package:final_project/core/generic_widgets/custom_date_picker.dart';
import 'package:final_project/core/generic_widgets/custom_input_field.dart';
import 'package:final_project/core/generic_widgets/main_button.dart';
import 'package:final_project/core/theme/app_colors.dart';
import 'package:final_project/core/theme/app_text_style.dart';
import 'package:final_project/features/settings/cubit/settings_cubit.dart';
import 'package:final_project/features/settings/cubit/settings_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsCubit(GetStorage()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.lightGray,
          leading: const ArrowBackWidget(),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(24.0.r),
            child: BlocBuilder<SettingsCubit, SettingsState>(
              builder: (context, SettingsState state) {
                final cubit = context.read<SettingsCubit>();
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Stack(
                          children: [
                            CircleAvatar(
                              radius: 50.r,
                              backgroundColor: AppColors.borderColor,
                              child: ClipOval(
                                child: Image.asset(
                                  AppImages.profile,
                                  fit: BoxFit.cover,
                                  width: 100.w,
                                  height: 100.h,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0.h,
                              right: 0.w,
                              child: GestureDetector(
                                onTap: () {},
                                child: CircleAvatar(
                                  radius: 15.r,
                                  backgroundColor: Colors.white,
                                  child: Icon(Icons.add, size: 20.r),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 58.h),
                      CustomInputField(
                        label: AppStrings.name.tr(),
                        initialValue: state.name,
                        onChanged: cubit.updateName,
                      ),
                      SizedBox(height: 20.h),
                      CustomDatePickerField(
                        label: AppStrings.dateOfBirth.tr(),
                        initialDate: state.dateOfBirth,
                        onDatePicked: cubit.updateDateOfBirth,
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: AppColors.borderColor),
                                borderRadius: BorderRadius.circular(16.r),
                              ),
                              child: RadioListTile(
                                value: AppStrings.male.tr(),
                                groupValue: state.gender,
                                onChanged: (value) =>
                                    cubit.updateGender(value as String),
                                title: Text(
                                  AppStrings.male.tr(),
                                  style: AppTextStyle.f16W400NearBlackColor,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: AppColors.borderColor),
                                borderRadius: BorderRadius.circular(16.r),
                              ),
                              child: RadioListTile(
                                value: AppStrings.female.tr(),
                                groupValue: state.gender,
                                onChanged: (value) =>
                                    cubit.updateGender(value as String),
                                title: Text(
                                  AppStrings.female.tr(),
                                  style: AppTextStyle.f16W400NearBlackColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      CustomInputField(
                        label: AppStrings.email.tr(),
                        initialValue: state.email,
                        onChanged: cubit.updateEmail,
                      ),
                      SizedBox(height: 24.h),
                      CustomInputField(
                        label: AppStrings.phoneNumber.tr(),
                        initialValue: state.phoneNumber,
                        onChanged: cubit.updatePhoneNumber,
                      ),
                      SizedBox(height: 70.h),
                      Center(
                        child: MainButton(
                          text: AppStrings.save.tr(),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
