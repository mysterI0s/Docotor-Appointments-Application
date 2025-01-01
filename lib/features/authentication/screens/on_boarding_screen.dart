import 'package:easy_localization/easy_localization.dart';
import 'package:final_project/core/constants/app_images.dart';
import 'package:final_project/core/constants/app_strings.dart';
import 'package:final_project/core/generic_widgets/main_button.dart';
import 'package:final_project/core/generic_widgets/onboarding_page_widget.dart';
import 'package:final_project/core/theme/app_text_style.dart';
import 'package:final_project/features/authentication/cubit/onboarding_cubit.dart';
import 'package:final_project/features/authentication/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
  final PageController pageController = PageController();

  OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OnboardingCubit(),
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BlocBuilder<OnboardingCubit, OnboardingState>(
              builder: (context, state) {
                return state.currentPage == 0
                    ? Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24.0, vertical: 32.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const WelcomeScreen(),
                                  ),
                                );
                              },
                              child: Text(
                                AppStrings.skip.tr(),
                                style: AppTextStyle.f16W400NearBlackColor,
                              ),
                            )
                          ],
                        ),
                      )
                    : const SizedBox.shrink();
              },
            ),
            Expanded(
              child: PageView(
                controller: pageController,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (index) {
                  context.read<OnboardingCubit>().updatePage(index);
                },
                children: [
                  OnboardingPageWidget(
                    imagePath: AppImages.onBoardingImage1,
                    title: AppStrings.onlineHealthCheck.tr(),
                    description: "Book The Best Doctor In Various\nSpecialties",
                  ),
                  OnboardingPageWidget(
                    imagePath: AppImages.onBoardingImage2,
                    title: AppStrings.nearToYou.tr(),
                    description:
                        AppStrings.scheduleYourVisit.tr(),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: Column(
                children: [
                  SmoothPageIndicator(
                    controller: pageController,
                    count: 2,
                    effect: const WormEffect(
                      dotWidth: 10.0,
                      dotHeight: 10.0,
                      activeDotColor: Colors.teal,
                      dotColor: Colors.grey,
                      spacing: 8.0,
                    ),
                  ),
                  const SizedBox(height: 32.0),
                  BlocBuilder<OnboardingCubit, OnboardingState>(
                    builder: (context, state) {
                      return MainButton(
                        text: state.currentPage == 0 ? AppStrings.next.tr() : AppStrings.getStarted.tr(),
                        minWidth: double.infinity,
                        onPressed: () {
                          if (state.currentPage == 0) {
                            pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                            context.read<OnboardingCubit>().nextPage();
                          } else {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const WelcomeScreen(),
                              ),
                            );
                          }
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
