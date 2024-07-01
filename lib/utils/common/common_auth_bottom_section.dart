import 'package:fitness_app/utils/base_constants/base_extensions.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../view/ui/Login/login_components/custom_rich_text.dart';
import '../base_constants/base_assets.dart';
import '../base_constants/base_colors.dart';
import '../base_constants/base_strings.dart';
import '../widgets/text_view.dart';
import 'custom_form_button.dart';

class CommonAuthBottomSection extends StatelessWidget {
  final String? text;
  final String? boldText;
  final GestureRecognizer? onTap;
  final VoidCallback? googleOnTap;
  final VoidCallback? facebookOnTap;
  final VoidCallback? buttonTap;
  final String? buttonText;

  final bool? iconShow;
  final bool? buttonEnabled;

  const CommonAuthBottomSection(
      {super.key,
      this.text,
      this.boldText,
      this.onTap,
      this.googleOnTap,
      this.iconShow,
      this.buttonText,
      this.buttonTap,
      this.facebookOnTap,
      this.buttonEnabled = true});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomFormButton(
            iconShow: iconShow,
            buttonText: buttonText,
            onPressed: buttonTap,
            buttonEnabled: buttonEnabled,
            btnTextStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: BaseColors.whiteColor)),
        10.toVSB,
        orWidget(),
        18.toVSB,
        socialBtn(googleOnTap: googleOnTap, facebookOnTap: facebookOnTap),
        18.toVSB,
        CustomRichText(
          text: text,
          boldText: boldText,
          onTap: onTap,
        ),
      ],
    );
  }

  Widget orWidget() {
    return const IntrinsicHeight(
      child: Row(
        children: [
          Expanded(
              child: Divider(
            color: BaseColors.lightGreyColor,
          )),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: TextView(
              BaseStrings.or,
              textStyle: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: BaseColors.blackColor),
            ),
          ),
          Expanded(
              child: Divider(
            color: BaseColors.lightGreyColor,
          )),
        ],
      ),
    );
  }

  Widget socialBtn({VoidCallback? googleOnTap, VoidCallback? facebookOnTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: googleOnTap,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: BaseColors.secondaryGreyColor)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
              child: Image.asset(BaseAssets.googleImage, height: 20),
            ),
          ),
        ),
        18.toHSB,
        InkWell(
          onTap: facebookOnTap,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: BaseColors.secondaryGreyColor)),
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
                child: SvgPicture.asset(BaseAssets.facebookImage, height: 20)),
          ),
        )
      ],
    );
  }
}
