import 'package:fitness_app/utils/base_constants/text_style.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../utils/base_constants/base_colors.dart';

class CustomRichText extends StatelessWidget {
  final String? text;
  final Color? textColor;
  final String? linkText;
  final GestureRecognizer? onTap;

  const CustomRichText(
      {super.key,
      this.text,
      this.linkText,
      this.textColor = BaseColors.blackColor,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return RichText(
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: text ?? "",
            style: TextStyle(
                color: textColor, fontSize: 14, fontWeight: FontWeight.w400),
          ),
          TextSpan(
              text: linkText ?? "",
              recognizer: onTap,
              style: BaseTextStyles.textUnderLine),
        ],
      ),
    );
  }
}
