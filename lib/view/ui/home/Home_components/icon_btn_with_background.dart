import 'package:flutter/material.dart';
import '../../../../utils/base_constants/base_colors.dart';

class IconBtnWithBackground extends StatelessWidget {
  final Widget? icon;
  final double? height;
  final double? width;
  final Color? backgroundColor;

  const IconBtnWithBackground(
      {super.key,
      this.icon,
      this.height = 40,
      this.width = 40,
      this.backgroundColor = BaseColors.borderColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: backgroundColor),
      child: icon,
    );
  }
}
