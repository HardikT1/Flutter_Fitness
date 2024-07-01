import 'package:fitness_app/utils/base_constants/base_colors.dart';
import 'package:fitness_app/utils/base_constants/base_extensions.dart';
import 'package:fitness_app/utils/base_constants/box_style.dart';
import 'package:fitness_app/utils/base_constants/text_style.dart';
import 'package:fitness_app/view/ui/signup/signuponboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../../../utils/base_constants/base_assets.dart';
import '../../../../utils/base_constants/base_strings.dart';
import '../../../../utils/common/custom_auth_text_form_field.dart';
import '../../../../utils/common/custom_form_button.dart';
import '../../../../utils/enum/direction.dart';
import '../../../helper/validators.dart';

class SignUpProfileFormFields extends StatelessWidget {
  SignUpProfileFormFields(
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
  final items = ["Male", "Female", "Other"];
  final initialDate = DateTime(
      DateTime.now().year - 12, DateTime.now().month, DateTime.now().day);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: signupFormKey,
      child: Column(
        children: [
          DropdownMenu<String>(
            initialSelection: "",
            controller: genderController,
            requestFocusOnTap: false,
            hintText: BaseStrings.chooseGender,
            onSelected: (String? gender) {
              genderController?.text = gender ?? "";
            },
            leadingIcon: SizedBox(
                height: 13.h,
                width: 14.w,
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: SvgPicture.asset(
                    BaseAssets.twoUserIcon,
                  ),
                )),
            enableSearch: false,
            enableFilter: false,
            width: 315.w,
            expandedInsets: EdgeInsets.zero,
            inputDecorationTheme: InputDecorationTheme(
                hintStyle: BaseTextStyles.textFieldHint,
                errorMaxLines: 2,
                errorStyle: const TextStyle(
                  color: Colors.red,
                  fontSize: 12,
                ),
                isDense: true,
                filled: true,
                fillColor: BaseColors.borderColor,
                contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(14)),
                  borderSide:
                      BorderSide(width: 1, color: BaseColors.borderColor),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(14)),
                  borderSide:
                      BorderSide(width: 1, color: BaseColors.borderColor),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: const BorderSide(
                      color: BaseColors.borderColor, width: 0.0),
                )),
            menuStyle: MenuStyle(
                alignment: Alignment.bottomLeft,
                surfaceTintColor: MaterialStatePropertyAll(Colors.white)),
            dropdownMenuEntries:
                items.map<DropdownMenuEntry<String>>((String gender) {
              return DropdownMenuEntry<String>(
                  value: gender,
                  label: gender,
                  labelWidget: Text(gender),
                  style: const ButtonStyle(
                      alignment: Alignment.centerLeft,
                      visualDensity: VisualDensity.comfortable));
            }).toList(),
          ),
          16.toVSB,
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
                barrierDismissible: false,
                initialEntryMode: DatePickerEntryMode.calendarOnly,
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
                decoration: BaseBoxStyles.commonGradientBoxDecoration.copyWith(
                    borderRadius: BorderRadius.circular(16.0),
                    gradient: LinearGradient(
                        colors: BaseColors.secondaryColorList.reversed.toList(),
                        begin: Alignment.topLeft,
                        end: Alignment.topRight,
                        tileMode: TileMode.clamp)),
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
                decoration: BaseBoxStyles.commonGradientBoxDecoration.copyWith(
                    borderRadius: BorderRadius.circular(16.0),
                    gradient: LinearGradient(
                        colors: BaseColors.secondaryColorList.reversed.toList(),
                        begin: Alignment.topLeft,
                        end: Alignment.topRight,
                        tileMode: TileMode.clamp)),
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
          30.toVSB,
          CustomFormButton(
            buttonText: BaseStrings.next,
            btnTextStyle: BaseTextStyles.appBarTextStyle.copyWith(
                color: BaseColors.whiteColor, fontWeight: FontWeight.w400),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignupOnBoarding()),
              );
            },
            buttonEnabled: true,
            iconShow: true,
            iconDirection: Direction.right,
          ),
          30.toVSB,
        ],
      ),
    );
  }
}
