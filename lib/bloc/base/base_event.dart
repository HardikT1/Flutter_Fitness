import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class BaseEvent extends Equatable {
  const BaseEvent();
}

abstract class LoadBaseEvent extends BaseEvent {
  @override
  List<Object?> get props => [];
}
