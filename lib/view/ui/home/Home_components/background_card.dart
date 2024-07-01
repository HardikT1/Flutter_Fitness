import 'package:flutter/material.dart';

import '../../../../utils/base_constants/base_colors.dart';

class BackgroundCard extends StatelessWidget {
  final Widget? child;
  final double? height;
  final double? width;
  final bool isGradient;
  final Color? color;
  final Color? shedowColor;
  final double? elevation;
  final bool hasBoxShadow;

  const BackgroundCard({
    super.key,
    this.child,
    this.height,
    this.width,
    this.isGradient = false,
    this.color,
    this.shedowColor,
    this.elevation = 0,
    this.hasBoxShadow = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: hasBoxShadow == true
            ? [
                BoxShadow(
                  color: BaseColors.lightGreyColor.withOpacity(0.4),
                  blurRadius: 25.0,
                  spreadRadius: 1.0,
                  offset: const Offset(
                    0.0, // Move to right 10  horizontally
                    5.0, // Move to bottom 10 Vertically
                  ),
                ),
              ]
            : [],
      ),
      child: Card(
        shadowColor: shedowColor,
        elevation: elevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: isGradient ? null : color,
            gradient: isGradient
                ? LinearGradient(colors: [
                    BaseColors.primaryBlueColor.withOpacity(0.2),
                    BaseColors.secondaryGreyColor.withOpacity(0.2),
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight)
                : null,
          ),
          child: child,
        ),
      ),
    );
  }
}
