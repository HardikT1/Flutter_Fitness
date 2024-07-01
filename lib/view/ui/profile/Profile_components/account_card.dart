import 'package:fitness_app/utils/base_constants/base_assets.dart';
import 'package:fitness_app/utils/base_constants/base_extensions.dart';
import 'package:fitness_app/utils/base_constants/base_strings.dart';
import 'package:flutter/material.dart';

import '../../../../utils/base_constants/base_colors.dart';
import '../../../../utils/base_constants/text_style.dart';
import '../../../../utils/widgets/text_view.dart';
import 'common_row.dart';
import 'personal_data_form_fields.dart';

class AccountCard extends StatelessWidget {
  const AccountCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Card(
        elevation: 0,
        child: Container(
          decoration: BoxDecoration(
              color: BaseColors.whiteColor,
              boxShadow: [
                BoxShadow(
                  color: BaseColors.lightGreyColor.withOpacity(1.0),
                  offset: const Offset(0.2, 0.2),
                  blurRadius: 10.0,
                ),
              ],
              borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                15.toVSB,
                const TextView(BaseStrings.account,
                    textStyle: BaseTextStyles.profileTitle),
                15.toVSB,
                CommonRow(
                  pngImage: true,
                  text: BaseStrings.personalData,
                  img: BaseAssets.profileBlueImage,
                  onTap: () {
                    showDialogWithFields(context);
                  },
                ),
                10.toVSB,
                const CommonRow(
                    pngImage: true,
                    text: BaseStrings.achievement,
                    img: BaseAssets.achievementImage),
                10.toVSB,
                const CommonRow(
                    pngImage: true,
                    text: BaseStrings.activityHistory,
                    img: BaseAssets.activityBlueImage),
                10.toVSB,
                const CommonRow(
                    pngImage: true,
                    text: BaseStrings.workoutProgress,
                    img: BaseAssets.workoutImage),
                10.toVSB,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void showDialogWithFields(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) {
      var emailController = TextEditingController();
      var dateOfBirthController = TextEditingController();
      var messageController = TextEditingController();
      return AlertDialog(
        title: const Text(BaseStrings.personalData),
        content: PersonalDataFormFields(
          passwordController: messageController,
          emailController: emailController,
          dateOfBirthController: dateOfBirthController,
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              textBtn(
                onTap: () {
                  Navigator.of(context).pop(true);
                },
                btnText: BaseStrings.cancelText,
              ),
              10.toHSB,
              textBtn(
                onTap: () {
                  Navigator.of(context).pop(true);
                },
                btnText: BaseStrings.saveText,
              ),
            ],
          ),
        ],
      );
    },
  );
}

Widget textBtn({VoidCallback? onTap, String? btnText}) {
  return InkWell(
    highlightColor: Colors.transparent,
    splashColor: Colors.transparent,
    splashFactory: NoSplash.splashFactory,
    onTap: onTap,
    child: Container(
      decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [
            BaseColors.secondaryLightBlueColor,
            BaseColors.primaryBlueColor
          ]),
          borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Center(
          child: TextView(
            btnText ?? '',
            textStyle: BaseTextStyles.alertDialogStyle,
          ),
        ),
      ),
    ),
  );
}
