import 'package:flutter_bloc/flutter_bloc.dart';

// Define Onboarding States
class OnboardingState {
  final int currentPage;

  const OnboardingState({required this.currentPage});
}

// Define Onboarding Cubit
class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(const OnboardingState(currentPage: 0));

  // Update current page
  void updatePage(int newPage) {
    emit(OnboardingState(currentPage: newPage));
  }

  // Increment page (when "Next" is pressed)
  void nextPage() {
    emit(OnboardingState(currentPage: state.currentPage + 1));
  }
}
