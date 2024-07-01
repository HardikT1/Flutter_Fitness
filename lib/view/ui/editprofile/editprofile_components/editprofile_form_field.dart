import 'package:fitness_app/utils/base_constants/base_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import '../../../../utils/base_constants/base_assets.dart';
import '../../../../utils/base_constants/base_strings.dart';
import '../../../../utils/common/custom_auth_text_form_field.dart';
import '../../../helper/validators.dart';

class EditProfileFormFields extends StatelessWidget {
  EditProfileFormFields({
    super.key,
    this.editProfileFormkey,
    this.emailController,
    this.firstNameController,
    this.lastNameController,
    this.dateOfBirthController,
  });

  final GlobalKey? editProfileFormkey;
  final TextEditingController? firstNameController;
  final TextEditingController? lastNameController;
  final TextEditingController? emailController;
  final TextEditingController? dateOfBirthController;

  final validators = Validators();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: editProfileFormkey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomAuthTextFormField(
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
              hintText: BaseStrings.enterLastName,
              prefixIcon: BaseAssets.userIcon,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.name,
              maxLines: 1,
              hasPrefixIcon: true,
              textEditingController: lastNameController,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
                LengthLimitingTextInputFormatter(15),
              ],
              validator: (value) => validators.validateLastName(value!),
            ),
            16.toVSB,
            CustomAuthTextFormField(
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
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2025),
                ).then((value) => dateOfBirthController?.text =
                    DateFormat("dd-MM-yyyy").format(value!));
              },
              validator: (value) => validators.validateDateOfBirth(value!),
            ),
          ],
        ),
      ),
    );
  }
}
