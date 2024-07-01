import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class BaseState extends Equatable {}

class BaseInitialState extends BaseState {
  @override
  List<Object?> get props => [];
}

class BaseLoadingState extends BaseState {
  @override
  List<Object?> get props => [];
}

abstract class BaseLoadedState extends BaseState {
  @override
  List<Object?> get props => [];
}

class BaseErrorState extends BaseState {
  final String error;

  BaseErrorState(this.error);

  @override
  List<Object?> get props => [error];
}
