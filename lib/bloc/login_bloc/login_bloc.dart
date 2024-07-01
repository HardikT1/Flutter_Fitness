import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../utils/base_constants/base_colors.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginFormBloc extends Bloc<LoginFormEvent, LoginFormState> {
  final GlobalKey<FormState> formKey;

  String? email;
  String? password;

  LoginFormBloc(this.formKey)
      : super(LoginFormState([
          BaseColors.primaryGreyColor.withOpacity(0.7),
          BaseColors.primaryGreyColor.withOpacity(0.7)
        ])) {
    on<LoginFormEvent>((event, emit) {
      if (event.email == email) {
        emit(LoginFormState(validateEmail()! && validatePassword()!
            ? BaseColors.brandColorList
            : [
                BaseColors.primaryGreyColor.withOpacity(0.7),
                BaseColors.primaryGreyColor.withOpacity(0.7)
              ]));
      } else if (event.password == password) {
        emit(LoginFormState(validateEmail()! && validatePassword()!
            ? BaseColors.brandColorList
            : [
                BaseColors.primaryGreyColor.withOpacity(0.7),
                BaseColors.primaryGreyColor.withOpacity(0.7)
              ]));
      }
    });
  }

  bool? validatePassword() {
    return password?.trim().isNotEmpty == true;
  }

  bool? validateEmail() {
    return email?.trim().isNotEmpty == true;
  }

  void setEmail(String value) {
    email = value;
    add(LoginFormEvent(email: email));
  }

  void setPassword(String value) {
    password = value;
    add(LoginFormEvent(password: password));
  }
}
