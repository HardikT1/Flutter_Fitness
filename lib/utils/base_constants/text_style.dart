import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'base_colors.dart';
import 'base_strings.dart';

class BaseTextStyles {
  static const TextStyle textFieldHint = TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w500,
      color: BaseColors.secondaryGreyColor);

  static const TextStyle textFieldStyle = TextStyle(
      fontFamily: BaseStrings.poppins,
      fontSize: 13,
      fontWeight: FontWeight.w500,
      color: BaseColors.blackColor);

  static const TextStyle textUnderLine = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: BaseColors.secondaryGreyColor,
      decoration: TextDecoration.underline,
      decorationColor: BaseColors.secondaryGreyColor);

  static const TextStyle appBarTextStyle = TextStyle(
      fontSize: 16, fontWeight: FontWeight.w700, color: BaseColors.blackColor);

  static const TextStyle profileTitle = TextStyle(
      fontSize: 16, fontWeight: FontWeight.w600, color: BaseColors.blackColor);

  static TextStyle dateViewMonthStyle = TextStyle(
      fontFamily: BaseStrings.inter,
      fontSize: 12.sp,
      color: BaseColors.primaryGreyColor,
      fontWeight: FontWeight.w400);

  static TextStyle dateViewDayStyle = TextStyle(
      fontFamily: BaseStrings.inter,
      fontSize: 14.sp,
      color: BaseColors.primaryGreyColor,
      fontWeight: FontWeight.w500);

  static TextStyle alertDialogStyle = const TextStyle(
      fontSize: 12, fontWeight: FontWeight.w500, color: BaseColors.whiteColor);
}
