import 'package:fitness_app/utils/base_constants/base_extensions.dart';
import 'package:fitness_app/utils/base_constants/text_style.dart';
import 'package:fitness_app/view/ui/profile/Profile_components/common_row.dart';
import 'package:flutter/material.dart';

import '../../../../utils/base_constants/base_assets.dart';
import '../../../../utils/base_constants/base_colors.dart';
import '../../../../utils/base_constants/base_strings.dart';
import '../../../../utils/widgets/text_view.dart';

class OtherCard extends StatelessWidget {
  const OtherCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Card(
        elevation: 0,
        child: Container(
          decoration: BoxDecoration(
            color: BaseColors.whiteColor,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: BaseColors.lightGreyColor.withOpacity(1.0),
                offset: const Offset(0.2, 0.2),
                blurRadius: 10.0,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                15.toVSB,
                const TextView(BaseStrings.other,
                    textStyle: BaseTextStyles.profileTitle),
                15.toVSB,
                const CommonRow(
                    text: BaseStrings.contactUs,
                    img: BaseAssets.contactUsImage),
                15.toVSB,
                const CommonRow(
                    text: BaseStrings.privacyPolicyText,
                    img: BaseAssets.privacyPolicyImage),
                15.toVSB,
                InkWell(
                  onTap: () {
                    logOutDialog(context: context);
                  },
                  child: Row(
                    children: [
                      ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return LinearGradient(
                            colors: [
                              const Color(0xff9DCEFF).withOpacity(0.7),
                              const Color(0xff92A3FD)
                            ],
                            // Your gradient colors
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ).createShader(bounds);
                        },
                        child: const Icon(
                          Icons.logout_outlined,
                          size: 24, // Adjust icon size as needed
                          color: Colors.white, // Set a base color for the icon
                        ),
                      ),
                      10.toHSB,
                      const TextView(BaseStrings.logOut,
                          textStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: BaseColors.primaryGreyColor)),
                      const Spacer(),
                    ],
                  ),
                ),
                15.toVSB,
              ],
            ),
          ),
        ),
      ),
    );
  }

  void logOutDialog({BuildContext? context}) {
    showDialog(
      context: context!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const TextView(
            BaseStrings.logOut,
            textStyle: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: BaseColors.blackColor),
          ),
          content: const TextView(
            BaseStrings.logOutContent,
            textStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: BaseColors.blackColor),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                textBtn(
                  onTap: () {
                    Navigator.of(context).pop(true);
                  },
                  btnText: BaseStrings.noText,
                ),
                10.toHSB,
                textBtn(
                  onTap: () {
                    Navigator.of(context).pop(true);
                  },
                  btnText: BaseStrings.yesText,
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
}
