import 'package:easy_localization/easy_localization.dart';
import 'package:final_project/core/constants/app_consts.dart';
import 'package:final_project/core/constants/app_images.dart';
import 'package:final_project/core/constants/app_strings.dart';
import 'package:final_project/core/generic_widgets/bottom_navigation_bar/bottom_navigation_bar_items.dart';
import 'package:final_project/core/generic_widgets/bottom_navigation_bar/cubit/bottom_navigation_cubit.dart';
import 'package:final_project/core/theme/app_colors.dart';
import 'package:final_project/core/theme/app_text_style.dart';
import 'package:final_project/core/theme/cubit/theme_cubit.dart';
import 'package:final_project/features/authentication/cubit/auth_cubit.dart';
import 'package:final_project/features/authentication/cubit/auth_state.dart';
import 'package:final_project/features/authentication/screens/sign_in_screen.dart';
import 'package:final_project/features/home/cubit/favorite_cubit.dart';
import 'package:final_project/features/home/cubit/favorite_state.dart';
import 'package:final_project/features/home/doctors_bank.dart';
import 'package:final_project/features/settings/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  final userData = box.read(AppConst.user);
  final token = box.read(AppConst.accessToken);

  final DoctorsBank doctorsBank = DoctorsBank();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FavoriteCubit(doctorsBank.recentVisits.length),
      child: Scaffold(
        key: _scaffoldKey,
        endDrawer: Drawer(
          width: 187.5.w,
          child: Column(
            children: [
              SizedBox(
                height: 64.h,
              ),
              CircleAvatar(
                radius: 40.r,
                child: ClipOval(
                  child: Image(
                    fit: BoxFit.cover,
                    width: 80.r,
                    height: 80.r,
                    image: const AssetImage(
                      AppImages.profile,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                userData['name'],
                style: AppTextStyle.f20W700NearBlackColor,
              ),
              SizedBox(
                height: 64.h,
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const SettingsScreen(),
                    ),
                  );
                },
                child: Text(
                  AppStrings.settings.tr(),
                  style: AppTextStyle.f16W400NearBlackColor,
                ),
              ),
              SizedBox(
                height: 21.h,
              ),
              TextButton(
                onPressed: () {
                  context.read<ThemeCubit>().toggleTheme();
                },
                child: Text(
                  AppStrings.darkMode.tr(),
                  style: AppTextStyle.f16W400NearBlackColor,
                ),
              ),
              SizedBox(
                height: 21.h,
              ),
              TextButton(
                onPressed: () {
                  final currentLocale = context.locale;
                  if (currentLocale.languageCode == 'en') {
                    context.setLocale(const Locale('ar'));
                  } else {
                    context.setLocale(const Locale('en'));
                  }
                },
                child: Text(
                  AppStrings.language.tr(),
                  style: AppTextStyle.f16W400NearBlackColor,
                ),
              ),
              SizedBox(
                height: 21.h,
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  AppStrings.aboutUs.tr(),
                  style: AppTextStyle.f16W400NearBlackColor,
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  BlocListener<AuthCubit, AuthState>(
                    listener: (context, state) {
                      if (state is LogoutSuccessState) {
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) => SignInScreen(),
                          ),
                          (Route<dynamic> route) => false,
                        );
                      } else if (state is LogoutErrorState) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(state.errorMsg)),
                        );
                      }
                    },
                    child: InkWell(
                      onTap: () {
                        context.read<AuthCubit>().logout(token);
                        box.remove(token);
                      },
                      child: SvgPicture.asset(
                        AppImages.logout,
                        width: 24.r,
                        height: 24.r,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Text(AppStrings.logout.tr()),
                  SizedBox(
                    width: 24.w,
                  )
                ],
              ),
              SizedBox(
                height: 32.h,
              )
            ],
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(24.0.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${AppStrings.hello.tr()} ${userData['name']}!",
                            style: AppTextStyle.f20W700NearBlackColor.copyWith(
                              fontSize: 24.sp,
                            ),
                          ),
                          Text(
                            AppStrings.howAreYouFeelingToday.tr(),
                            style: AppTextStyle.f16W400NearBlackColor.copyWith(
                              fontSize: 14.sp,
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        borderRadius: BorderRadius.circular(
                          100.r,
                        ),
                        onTap: () {
                          _scaffoldKey.currentState?.openEndDrawer();
                        },
                        child: Container(
                          padding: EdgeInsets.all(
                            4.w,
                          ),
                          child: CircleAvatar(
                            radius: 28.r,
                            child: const Image(
                              image: AssetImage(
                                AppImages.profile,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  SizedBox(
                    height: 48.h,
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 14.h,
                          horizontal: 16.w,
                        ),
                        suffixIcon: Padding(
                          padding: EdgeInsets.all(8.0.w),
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
                  Text(
                    AppStrings.whatLookingFor.tr(),
                    style: AppTextStyle.f20W700NearBlackColor,
                  ),
                  SizedBox(height: 8.h),
                  SizedBox(
                    height: 103.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 8.w),
                              height: 76.h,
                              width: 80.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.r),
                                image: DecorationImage(
                                  image: AssetImage(
                                      doctorsBank.specialties[index]['image']!),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Text(
                              doctorsBank.specialties[index]['name']!,
                              style: AppTextStyle.f16W400NearBlackColor,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 32.h),
                  Text(
                    AppStrings.doNotForget.tr(),
                    style: AppTextStyle.f20W700NearBlackColor,
                  ),
                  SizedBox(height: 8.h),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 12.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: const AssetImage(
                                AppImages.doc2,
                              ),
                              radius: 32.r,
                            ),
                            SizedBox(
                              width: 7.w,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    AppStrings.drAssaedHanash.tr(),
                                    style: AppTextStyle.f20W700NearBlackColor
                                        .copyWith(
                                      color: AppColors.lightGray,
                                    ),
                                  ),
                                  Text(
                                    "ENT",
                                    style: AppTextStyle.f16W400NearBlackColor
                                        .copyWith(
                                      color: AppColors.lightGray,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 22.h,
                        ),
                        Container(
                          height: 34.h,
                          margin: EdgeInsets.symmetric(
                            horizontal: 7.w,
                          ),
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
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    AppImages.clock,
                                    width: 18.r,
                                    height: 18.r,
                                  ),
                                  SizedBox(width: 1.w),
                                  Text(
                                    "10:30 - 11:30 AM",
                                    style: AppTextStyle.f16W400NearBlackColor
                                        .copyWith(
                                      fontSize: 14.sp,
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
                  SizedBox(height: 24.h),
                  Text(
                    AppStrings.recentVisit.tr(),
                    style: AppTextStyle.f20W700NearBlackColor,
                  ),
                  SizedBox(height: 8.h),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 135.h,
                        margin: EdgeInsets.only(
                          bottom: 8.h,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 16.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.snowColor,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 103.h,
                              width: 100.w,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      doctorsBank.recentVisits[index].image),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 9.w,
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          doctorsBank.recentVisits[index].name,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: AppTextStyle
                                              .f20W700NearBlackColor,
                                        ),
                                      ),
                                      BlocBuilder<FavoriteCubit, FavoriteState>(
                                        builder:
                                            (context, FavoriteState state) {
                                          final isFavorite = context
                                              .read<FavoriteCubit>()
                                              .isFavorite(index);
                                          return InkWell(
                                            onTap: () {
                                              context
                                                  .read<FavoriteCubit>()
                                                  .toggleFavorite(index);
                                            },
                                            borderRadius: BorderRadius.circular(
                                              8.r,
                                            ),
                                            child: Container(
                                              padding: EdgeInsets.all(
                                                8.w,
                                              ),
                                              child: SvgPicture.asset(
                                                isFavorite
                                                    ? AppImages.favorited
                                                    : AppImages.favorite,
                                                width: 24.r,
                                                height: 24.r,
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                  Text(
                                    doctorsBank.recentVisits[index].specialty,
                                    style: AppTextStyle.f16W400NearBlackColor,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                            AppImages.star,
                                            width: 18.r,
                                            height: 18.r,
                                          ),
                                          SizedBox(width: 4.w),
                                          Text(
                                            doctorsBank
                                                .recentVisits[index].rating,
                                            style: AppTextStyle
                                                .f16W400NearBlackColor,
                                          ),
                                        ],
                                      ),
                                      Text(
                                        doctorsBank.recentVisits[index].price,
                                        style:
                                            AppTextStyle.f16W400NearBlackColor,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar:
            BlocBuilder<BottomNavigationCubit, BottomNavigationState>(
          builder: (context, state) {
            return BottomNavigationBar(
              backgroundColor: AppColors.snowColor,
              currentIndex: state.pageIndex,
              onTap: (index) {
                context
                    .read<BottomNavigationCubit>()
                    .changePageIndex(newPageIndex: index);
              },
              items: [
                bottomNavBarItem(icon: AppImages.home),
                bottomNavBarItem(icon: AppImages.calendar),
                bottomNavBarItem(icon: AppImages.favorite),
                bottomNavBarItem(icon: AppImages.notification)
              ],
            );
          },
        ),
      ),
    );
  }
}
