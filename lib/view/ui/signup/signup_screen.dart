import 'package:fitness_app/utils/base_constants/base_extensions.dart';
import 'package:fitness_app/view/ui/signup/signup_components/signup_form_fields.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/checkbox_bloc/checkbox_bloc.dart';
import '../../../utils/base_constants/base_colors.dart';
import '../../../utils/base_constants/base_strings.dart';
import '../../../utils/common/common_auth_bottom_section.dart';
import '../../../utils/common/common_auth_title.dart';
import '../Login/login_screen.dart';
import 'singup_profile_screen.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final signUpFormKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BaseColors.whiteColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: BlocProvider(
            create: (context) => CheckboxBloc(),
            child: BlocBuilder<CheckboxBloc, CheckedChangedState>(
              builder: (context, state) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    50.toVSB,
                    const CommonAuthTitle(
                      subTitle: BaseStrings.createAnAccount,
                    ),
                    30.toVSB,
                    SignUpFormFields(
                      signupFormKey: signUpFormKey,
                      firstNameController: firstNameController,
                      lastNameController: lastNameController,
                      emailController: emailController,
                      passwordController: passwordController,
                      isPrivacyPolicyChecked: state.isChecked,
                    ),
                    90.toVSB,
                    CommonAuthBottomSection(
                      text: BaseStrings.alreadyHaveAnAccount,
                      boldText: BaseStrings.login,
                      buttonText: BaseStrings.register,
                      iconShow: true,
                      buttonEnabled: state.isChecked == true,
                      onTap: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(
                                  builder: (context) => const LoginScreen()))
                              .then((value) {
                            firstNameController.text = "";
                            lastNameController.text = "";
                            emailController.text = "";
                            passwordController.text = "";
                            BlocProvider.of<CheckboxBloc>(context)
                                .add(CheckedChangedEvent(isChecked: false));
                          });
                        },
                      buttonTap: () => {
                        if (signUpFormKey.currentState?.validate() == true)
                          if (state.isChecked == true)
                            Navigator.of(context)
                                .push(MaterialPageRoute(
                                    builder: (context) =>
                                        SignUpProfileScreen()))
                                .then((value) {
                              firstNameController.text = "";
                              lastNameController.text = "";
                              emailController.text = "";
                              passwordController.text = "";
                              BlocProvider.of<CheckboxBloc>(context)
                                  .add(CheckedChangedEvent(isChecked: false));
                            })
                          else
                            {null}
                      },
                    ),
                    50.toVSB,
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
