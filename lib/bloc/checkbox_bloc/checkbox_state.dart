part of 'checkbox_bloc.dart';

@immutable
abstract class CheckboxState extends Equatable {}

class CheckedChangedState extends CheckboxState {
  final bool? isChecked;

  CheckedChangedState({this.isChecked = false});

  @override
  List<Object?> get props => [isChecked];
}
