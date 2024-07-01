import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../models/onboarding_widget_model.dart';
import '../../../../utils/base_constants/base_colors.dart';
import '../../../../utils/base_constants/base_strings.dart';

Widget onboardingItem(
    {required OnboardingWidgetModel onboardingPage,
    required BuildContext context,
    required heightCalculation,
    required String animationAssets,
    required controller}) {
  final height = MediaQuery.of(context).size.height;
  final width = MediaQuery.of(context).size.width;
  return SingleChildScrollView(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          color: Colors.white,
          child: SizedBox(
            height: height / 2,
            width: width,
            child: Stack(
              children: [
                CustomPaint(
                  size: Size(width, width * heightCalculation),
                  painter: onboardingPage.decoration,
                ),
                Center(child: Lottie.asset(animationAssets)),
              ],
            ),
          ),
        ),
        Container(
          height: height / 2,
          width: width,
          color: Colors.white,
          child: Stack(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0, top: 64),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(onboardingPage.title,
                          style: const TextStyle(
                              color: BaseColors.blackColor,
                              fontFamily: BaseStrings.poppins,
                              fontWeight: FontWeight.w700,
                              fontSize: 24)),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30.0, top: 16, right: 30),
                    child: Text(onboardingPage.desc,
                        style: const TextStyle(
                            color: BaseColors.primaryGreyColor,
                            fontFamily: BaseStrings.poppins,
                            fontWeight: FontWeight.w400,
                            fontSize: 14)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
