import 'package:final_project/core/constants/app_images.dart';
import 'package:final_project/core/generic_widgets/bottom_navigation_bar/bottom_navigation_bar_items.dart';
import 'package:final_project/core/generic_widgets/bottom_navigation_bar/cubit/bottom_navigation_cubit.dart';
import 'package:final_project/core/theme/app_colors.dart';
import 'package:final_project/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  final String userName = "Ghalia";

  final List<Map<String, String>> specialties = [
    {"image": AppImages.specialty_0, "name": "Dentist"},
    {"image": AppImages.specialty_1, "name": "Cardiologist"},
    {"image": AppImages.specialty_2, "name": "Psychiatrist"},
  ];

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BottomNavigationCubit(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hello $userName!",
                            style: AppTextStyle.f20W700NearBlackColor.copyWith(
                              fontSize: 24,
                            ),
                          ),
                          Text(
                            "How Are You Feeling Today?",
                            style: AppTextStyle.f16W400NearBlackColor.copyWith(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      CircleAvatar(
                        radius: 28.r,
                        child: const Image(
                          image: AssetImage(
                            AppImages.profile,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  // Search Bar
                  SizedBox(
                    height: 48.h,
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 14.h,
                          horizontal: 16.w,
                        ),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                            AppImages.search,
                            width: 18.r,
                            height: 18.r,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(28.r),
                          borderSide: const BorderSide(
                            color: AppColors.borderColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  // Horizontal ListView for Medical Specialties
                  const Text(
                    "What Are You Looking For?",
                    style: AppTextStyle.f20W700NearBlackColor,
                  ),
                  SizedBox(height: 8.h),
                  SizedBox(
                    height: 102,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 8),
                              height: 76,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                  image:
                                      AssetImage(specialties[index]['image']!),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Text(
                              specialties[index]['name']!,
                              style: AppTextStyle.f16W400NearBlackColor,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 24),
                  // "Don't Forget" Section
                  const Text(
                    "Don't Forget",
                    style: AppTextStyle.f20W700NearBlackColor,
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            // Doctor's Image
                            const CircleAvatar(
                              backgroundImage: AssetImage(
                                'assets/images/doctor1.png',
                              ), // Update with your image asset path
                              radius: 32,
                            ),
                            SizedBox(
                              width: 7.w,
                            ),
                            // Doctor's Info
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Dr. Assaed Hanash", // Doctor's name
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const Text(
                                    "ENT", // Specialty
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white70,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8.h,
                                  ), // Space before the date and time row
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Container(
                          height: 34.h,
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 5.h,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Row(
                            children: [
                              // Date Info
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    AppImages.calendar,
                                    width: 18.r,
                                    height: 18.r,
                                  ),
                                  SizedBox(width: 2.w),
                                  Text(
                                    "Wed 7 Sep 2024",
                                    style: AppTextStyle.f16W400NearBlackColor
                                        .copyWith(
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 17.w,
                              ),
                              // Time Info
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    AppImages.clock,
                                    width: 18.r,
                                    height: 18.r,
                                  ),
                                  SizedBox(width: 2.w),
                                  Text(
                                    "10:30 - 11:30 AM", // Time
                                    style: AppTextStyle.f16W400NearBlackColor
                                        .copyWith(
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Doctors Available Section
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 5, // Replace with actual count
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: const EdgeInsets.only(bottom: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundImage:
                                    AssetImage("assets/doctor$index.png"),
                                radius: 30,
                              ),
                              const SizedBox(width: 16),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Dr. Nour Srour",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text("ENT"),
                                  Row(
                                    children: [
                                      Icon(Icons.star,
                                          size: 16, color: Colors.yellow),
                                      SizedBox(width: 4),
                                      Text("4.9"),
                                      SizedBox(width: 16),
                                      Text("\$25/hr"),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        // Bottom Navigation Bar
        bottomNavigationBar:
            BlocBuilder<BottomNavigationCubit, BottomNavigationState>(
          builder: (context, state) {
            return BottomNavigationBar(
              currentIndex: state.pageIndex,
              onTap: (index) {
                context
                    .read<BottomNavigationCubit>()
                    .changePageIndex(newPageIndex: index);
              },
              items: [
                bottomNavBarItem(title: "Home", icon: "assets/home.svg"),
                bottomNavBarItem(
                    title: "Appointments", icon: "assets/calendar.svg"),
                bottomNavBarItem(title: "Profile", icon: "assets/profile.svg"),
              ],
            );
          },
        ),
      ),
    );
  }
}
