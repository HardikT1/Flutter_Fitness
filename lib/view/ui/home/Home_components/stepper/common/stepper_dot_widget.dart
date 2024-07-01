import 'package:fitness_app/utils/base_constants/base_colors.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class StepperDot extends StatelessWidget {
  /// Default stepper dot
  const StepperDot({
    super.key,
    required this.index,
    required this.totalLength,
    required this.activeIndex,
  });

  /// Index at which the item is present
  final int index;

  /// Total length of the list provided
  final int totalLength;

  /// Active index which needs to be highlighted and before that
  final int activeIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 18,
      width: 18,
      decoration: BoxDecoration(
        border: GradientBoxBorder(
          gradient: LinearGradient(
              colors: index <= activeIndex
                  ? BaseColors.secondaryColorList
                  : [
                      BaseColors.secondaryGreyColor,
                      BaseColors.secondaryGreyColor
                    ]),
          width: 1,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      child: Container(
        height: 10,
        width: 10,
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: index <= activeIndex
                  ? BaseColors.secondaryColorList
                  : [
                      BaseColors.secondaryGreyColor,
                      BaseColors.secondaryGreyColor
                    ]),
          borderRadius: const BorderRadius.all(
            Radius.circular(30),
          ),
        ),
      ),
    );
  }
}
