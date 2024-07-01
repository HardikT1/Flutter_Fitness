import 'package:equatable/equatable.dart';

abstract class SignUpEvent extends Equatable {
  onBoardingEvents();
}

class PageChangedEvent extends SignUpEvent {
  final int? currentPage;

  PageChangedEvent(this.currentPage);

  @override
  onBoardingEvents() {}

  @override
  List<Object?> get props => [currentPage];
}
