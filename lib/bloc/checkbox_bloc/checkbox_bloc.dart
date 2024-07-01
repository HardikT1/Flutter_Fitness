import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'checkbox_event.dart';

part 'checkbox_state.dart';

class CheckboxBloc extends Bloc<CheckedChangedEvent, CheckedChangedState> {
  CheckboxBloc() : super(CheckedChangedState()) {
    on<CheckedChangedEvent>((event, emit) {
      emit(CheckedChangedState(isChecked: event.isChecked));
    });
  }
}
