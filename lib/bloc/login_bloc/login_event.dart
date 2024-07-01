import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class LoginFormEvent extends Equatable {
  final GlobalKey<FormState>? formKey;

  final String? email;
  final String? password;

  const LoginFormEvent({this.formKey, this.password, this.email});

  @override
  List<Object?> get props => [formKey];
}
