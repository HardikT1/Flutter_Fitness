import 'package:flutter_bloc/flutter_bloc.dart';

import 'onboarding_events.dart';
import 'onboarding_states.dart';

class OnboardingBloc extends Bloc<OnBoardingPageChangeEvent, OnboardingStates> {
  OnboardingBloc() : super(const OnboardingStates(pageIndex: 0)) {
    on<OnBoardingPageChangeEvent>((event, emit) {
      emit(OnboardingStates(pageIndex: event.pageIndex));
    });
  }
}
