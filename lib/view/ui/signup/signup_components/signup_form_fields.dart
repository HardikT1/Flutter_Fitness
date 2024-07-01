import 'package:fitness_app/bloc/checkbox_bloc/checkbox_bloc.dart';
import 'package:fitness_app/utils/base_constants/base_extensions.dart';
import 'package:fitness_app/utils/base_constants/box_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utils/base_constants/base_assets.dart';
import '../../../../utils/base_constants/base_colors.dart';
import '../../../../utils/base_constants/base_strings.dart';
import '../../../../utils/common/custom_auth_text_form_field.dart';
import '../../../helper/validators.dart';
import 'custom_rich_text.dart';

class SignUpFormFields extends StatelessWidget {
  SignUpFormFields(
      {super.key,
      this.signupFormKey,
      this.emailController,
      this.passwordController,
      this.firstNameController,
      this.lastNameController,
      this.isPrivacyPolicyChecked = false});

  final GlobalKey? signupFormKey;
  final TextEditingController? firstNameController;
  final TextEditingController? lastNameController;
  final TextEditingController? emailController;
  final TextEditingController? passwordController;
  final bool? isPrivacyPolicyChecked;

  final validators = Validators();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: signupFormKey,
      child: Column(
        children: [
          CustomAuthTextFormField(
            key: UniqueKey(),
            hintText: BaseStrings.enterFirstName,
            prefixIcon: BaseAssets.userIcon,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.name,
            maxLines: 1,
            hasPrefixIcon: true,
            textEditingController: firstNameController,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
              LengthLimitingTextInputFormatter(15),
            ],
            validator: (value) => validators.validateFirstName(value!),
          ),
          16.toVSB,
          CustomAuthTextFormField(
            key: UniqueKey(),
            hintText: BaseStrings.enterLastName,
            prefixIcon: BaseAssets.userIcon,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.name,
            maxLines: 1,
            hasPrefixIcon: true,
            textEditingController: lastNameController,
            validator: (value) => validators.validateLastName(value!),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
              LengthLimitingTextInputFormatter(15),
            ],
          ),
          16.toVSB,
          CustomAuthTextFormField(
            key: UniqueKey(),
            hintText: BaseStrings.email,
            prefixIcon: BaseAssets.emailIcon,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            maxLines: 1,
            hasPrefixIcon: true,
            textEditingController: emailController,
            validator: (value) => validators.validateEmail(value!),
          ),
          16.toVSB,
          CustomAuthTextFormField(
            key: UniqueKey(),
            hintText: BaseStrings.password,
            prefixIcon: BaseAssets.passwordIcon,
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.visiblePassword,
            maxLines: 1,
            obscureText: true,
            isPassword: true,
            hasPrefixIcon: true,
            textEditingController: passwordController,
            validator: (value) => validators.validatePassword(value!),
          ),
          16.toVSB,
          Align(
            alignment: Alignment.centerLeft,
            child: Wrap(
              spacing: 16.0,
              children: [
                Container(
                  // Fixed height and width is given so
                  // that it won't get change in responsiveness
                  width: 24,
                  height: 24,
                  alignment: Alignment.center,
                  decoration: isPrivacyPolicyChecked == true
                      ? BaseBoxStyles.commonGradientBoxDecoration.copyWith(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(6)),
                        )
                      : BaseBoxStyles.commonGradientBoxDecoration.copyWith(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(6)),
                          gradient: LinearGradient(colors: [
                            BaseColors.secondaryGreyColor,
                            BaseColors.secondaryGreyColor
                          ])),
                  child: InkWell(
                    splashFactory: NoSplash.splashFactory,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      BlocProvider.of<CheckboxBloc>(context).add(
                          CheckedChangedEvent(
                              isChecked: !(isPrivacyPolicyChecked == true)));
                    },
                    child: isPrivacyPolicyChecked == true
                        ? const Icon(Icons.check_rounded, color: Colors.white)
                        : Padding(
                            padding: const EdgeInsets.all(1.5),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: BaseColors.whiteColor,
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                          ),
                  ),
                ),
                const Wrap(children: [
                  CustomRichText(
                    text: BaseStrings.byContinuing,
                    linkText: BaseStrings.privacyPolicy,
                    textColor: BaseColors.secondaryGreyColor,
                  ),
                  CustomRichText(
                    text: BaseStrings.and,
                    textColor: BaseColors.secondaryGreyColor,
                    linkText: BaseStrings.termOfUse,
                  ),
                ]),
              ],
            ),
          )
        ],
      ),
    );
  }
}
