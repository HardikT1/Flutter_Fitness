import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../../utils/base_constants/base_colors.dart';

class CustomRichText extends StatelessWidget {
  final String? text;
  final String? boldText;
  final GestureRecognizer? onTap;

  const CustomRichText({super.key, this.text, this.boldText, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: text ?? "",
              style: const TextStyle(
                  color: BaseColors.blackColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            ),
            TextSpan(
              text: boldText ?? "",
              recognizer: onTap,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: BaseColors.purpleColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
