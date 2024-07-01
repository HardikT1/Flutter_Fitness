import 'package:fitness_app/utils/base_constants/base_colors.dart';
import 'package:fitness_app/utils/base_constants/base_extensions.dart';
import 'package:fitness_app/utils/base_constants/box_style.dart';
import 'package:fitness_app/utils/base_constants/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../../../../utils/base_constants/base_assets.dart';
import '../../../../utils/base_constants/base_strings.dart';
import '../../../../utils/common/custom_auth_text_form_field.dart';
import '../../../helper/validators.dart';

class PersonalDataFormFields extends StatelessWidget {
  PersonalDataFormFields(
      {super.key,
      this.signupFormKey,
      this.emailController,
      this.passwordController,
      this.genderController,
      this.dateOfBirthController,
      this.isPrivacyPolicyChecked = false});

  final GlobalKey? signupFormKey;
  final TextEditingController? genderController;
  final TextEditingController? dateOfBirthController;
  final TextEditingController? emailController;
  final TextEditingController? passwordController;
  final bool? isPrivacyPolicyChecked;

  final validators = Validators();
  final initialDate = DateTime(
      DateTime.now().year - 12, DateTime.now().month, DateTime.now().day);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: signupFormKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomAuthTextFormField(
              hintText: BaseStrings.dateOfBirth,
              prefixIcon: BaseAssets.calendarIcon,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.name,
              maxLines: 1,
              isReadOnly: true,
              hasPrefixIcon: true,
              textEditingController: dateOfBirthController,
              onTap: () {
                showDatePicker(
                  context: context,
                  initialDate: initialDate,
                  firstDate: DateTime(1920),
                  lastDate: initialDate,
                ).then((value) => dateOfBirthController?.text =
                    DateFormat("dd-MM-yyyy").format(value!));
              },
              validator: (value) => validators.validateDateOfBirth(value!),
            ),
            16.toVSB,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: CustomAuthTextFormField(
                    hintText: BaseStrings.yourWeight,
                    prefixIcon: BaseAssets.weightScaleIcon,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    maxLines: 1,
                    hasPrefixIcon: true,
                    textEditingController: emailController,
                    validator: (value) => validators.validateWeight(value!),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                      LengthLimitingTextInputFormatter(3),
                      MaxLengthFormatter(300)
                    ],
                  ),
                ),
                16.toHSB,
                Container(
                  height: 48,
                  width: 48,
                  decoration: BaseBoxStyles.commonGradientBoxDecoration
                      .copyWith(borderRadius: BorderRadius.circular(16.0)),
                  child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        BaseStrings.kg,
                        style: BaseTextStyles.textFieldStyle
                            .copyWith(color: BaseColors.whiteColor),
                      )),
                )
              ],
            ),
            16.toVSB,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: CustomAuthTextFormField(
                    hintText: BaseStrings.yourHeight,
                    prefixIcon: BaseAssets.swapIcon,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.number,
                    maxLines: 1,
                    hasPrefixIcon: true,
                    textEditingController: passwordController,
                    validator: (value) => validators.validateHeight(value!),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                      LengthLimitingTextInputFormatter(3),
                      MaxLengthFormatter(180)
                    ],
                  ),
                ),
                16.toHSB,
                Container(
                  height: 48,
                  width: 48,
                  decoration: BaseBoxStyles.commonGradientBoxDecoration
                      .copyWith(borderRadius: BorderRadius.circular(16.0)),
                  child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        BaseStrings.cm,
                        style: BaseTextStyles.textFieldStyle
                            .copyWith(color: BaseColors.whiteColor),
                      )),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
