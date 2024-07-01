import 'package:equatable/equatable.dart';

class SignUpInitial extends Equatable {
  final int? currentPage;

  const SignUpInitial({this.currentPage});

  @override
  List<Object?> get props => [currentPage];
}
