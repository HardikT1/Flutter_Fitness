import 'package:flutter/material.dart';

class BaseColors {
  static const List<Color> brandColorList = [
    Color(0xff9DCEFF),
    Color(0xff92A3FD),
  ];
  static const List<Color> secondaryColorList = [
    Color(0xffC58BF2),
    Color(0xffEEA4CE),
  ];

  static List<Color> secondaryColorListWithOpacity = [
    const Color(0xffC58BF2).withOpacity(0.3),
    const Color(0xffEEA4CE).withOpacity(0.5),
  ];
  static const List<Color> progressLinearGradient = [
    Color(0xff92A3FD),
    Color(0xffC58BF2),
  ];
  static const Color blackColor = Color(0xff1d1617);
  static const Color whiteColor = Color(0xffffffff);
  static const Color primaryGreyColor = Color(0xff7B6F72);
  static const Color secondaryGreyColor = Color(0xffADA4A5);
  static const Color lightGreyColor = Color(0xffDDDADA);
  static const Color borderColor = Color(0xffF7F8F8);
  static const Color primaryBlueColor = Color(0xff92A3FD);
  static const Color primarylightBlueColor = Color(0x4d95adfe);
  static const Color purpleColor = Color(0xffC58BF2);
  static const Color secondaryPurpleColor = Color(0xffEEA4CE);
  static const Color secondaryLightBlueColor = Color(0xff9DCEFF);
  static const Color shadowColor = Color(0xff95adfe);
  static const Color floatingShadowColor = Color(0x95ADFE4D);
}
