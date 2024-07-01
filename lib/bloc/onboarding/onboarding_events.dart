import 'package:equatable/equatable.dart';

abstract class OnboardingEvents extends Equatable {
  const OnboardingEvents();
}

class OnBoardingPageChangeEvent extends OnboardingEvents {
  final int? pageIndex;

  const OnBoardingPageChangeEvent(this.pageIndex);

  @override
  List<Object?> get props => [pageIndex];
}
