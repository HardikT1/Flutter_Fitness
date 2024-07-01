import 'package:equatable/equatable.dart';

class OnboardingStates extends Equatable {
  final int? pageIndex;

  const OnboardingStates({this.pageIndex});

  @override
  List<Object?> get props => [pageIndex];
}
