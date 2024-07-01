part of 'checkbox_bloc.dart';

@immutable
abstract class CheckboxEvent extends Equatable {}

class CheckedChangedEvent extends CheckboxEvent {
  final bool? isChecked;

  CheckedChangedEvent({this.isChecked = false});

  @override
  List<Object?> get props => [isChecked];
}
