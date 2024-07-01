import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class LoginFormState extends Equatable {
  final List<Color> buttonColor;

  const LoginFormState(this.buttonColor);

  @override
  List<Object?> get props => [buttonColor];
}
