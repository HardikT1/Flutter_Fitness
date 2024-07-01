import 'package:fitness_app/utils/base_constants/base_assets.dart';
import 'package:fitness_app/utils/base_constants/base_extensions.dart';
import 'package:fitness_app/utils/base_constants/text_style.dart';
import 'package:fitness_app/utils/common/custom_appbar.dart';
import 'package:fitness_app/view/ui/Dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/base_constants/base_colors.dart';
import '../../../utils/base_constants/base_strings.dart';
import '../../../utils/common/custom_form_button.dart';
import 'editprofile_components/editprofile_form_field.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});

  final editProfileFormKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final dateOfBirthController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: BaseStrings.editProfileAppBar),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: buildContainer(),
              ),
              20.toVSB,
              buildColumnforEdittextField(),
              20.toVSB,
              Padding(
                padding: EdgeInsets.only(
                    bottom: 40.h, left: 20.w, right: 20.w, top: 20.h),
                child: buildCustomFormButton(context),
              )
            ],
          ),
        ),
      ),
    );
  }

  CustomFormButton buildCustomFormButton(BuildContext context) {
    return CustomFormButton(
      onPressed: () {
        if (editProfileFormKey.currentState?.validate() == true) {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const DashboardScreen()));
        } else {
          null;
        }
      },
      buttonText: BaseStrings.updateBtn,
      btnTextStyle: BaseTextStyles.textFieldStyle.copyWith(
          color: BaseColors.whiteColor,
          fontSize: 16.sp,
          fontWeight: FontWeight.w700),
    );
  }

  Widget buildContainer() {
    return Stack(
      children: [
        Container(
          height: 150.h,
          width: 150.w,
          padding: const EdgeInsets.all(16),
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(colors: BaseColors.brandColorList),
            image: DecorationImage(
              image: AssetImage(BaseAssets.editProfile),
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          right: 5,
          child: Container(
            height: 40.h,
            width: 40.w,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(colors: BaseColors.brandColorList),
            ),
            child: Icon(
              Icons.edit,
              color: Colors.white,
              size: 24.h,
            ),
          ),
        )
      ],
    );
  }

  Widget buildColumnforEdittextField() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        EditProfileFormFields(
          editProfileFormkey: editProfileFormKey,
          firstNameController: firstNameController,
          lastNameController: lastNameController,
          emailController: emailController,
          dateOfBirthController: dateOfBirthController,
        )
      ],
    );
  }
}
