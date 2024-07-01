import 'package:flutter/material.dart';

import '../base_constants/base_colors.dart';
import '../base_constants/base_strings.dart';
import '../widgets/text_view.dart';

class CommonAuthTitle extends StatelessWidget {
  final String? subTitle;

  const CommonAuthTitle({super.key, this.subTitle = BaseStrings.welcomeBack});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Center(
          child: TextView(
            BaseStrings.hey,
            textStyle: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: BaseColors.blackColor),
          ),
        ),
        Center(
          child: TextView(
            subTitle ?? '',
            textStyle: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
                color: BaseColors.blackColor),
          ),
        )
      ],
    );
  }
}
