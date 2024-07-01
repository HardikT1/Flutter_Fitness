import 'package:fitness_app/utils/base_constants/base_colors.dart';
import 'package:fitness_app/utils/base_constants/base_extensions.dart';
import 'package:fitness_app/view/ui/home/Home_components/stepper/stepper_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../../../../utils/base_constants/text_style.dart';
import 'common/dot_provider.dart';

class VerticalStepperItem extends StatelessWidget {
  /// Stepper Item to show vertical stepper
  const VerticalStepperItem(
      {super.key,
      required this.item,
      required this.index,
      required this.totalLength,
      required this.gap,
      required this.activeIndex,
      required this.isInverted,
      required this.activeBarColor,
      required this.inActiveBarColor,
      required this.barWidth,
      required this.iconHeight,
      required this.iconWidth,
      required this.showGradient});

  /// Stepper item of type [StepperData] to inflate stepper with data
  final StepperData item;

  /// Index at which the item is present
  final int index;

  /// Total length of the list provided
  final int totalLength;

  /// Active index which needs to be highlighted and before that
  final int activeIndex;

  /// Gap between the items in the stepper
  final double gap;

  /// Inverts the stepper with text that is being used
  final bool isInverted;

  /// Bar color for active step
  final Color activeBarColor;

  /// Bar color for inactive step
  final Color inActiveBarColor;

  /// Bar width/thickness
  final double barWidth;

  /// Height of [StepperData.iconWidget]
  final double iconHeight;

  /// Width of [StepperData.iconWidget]
  final double iconWidth;
  final bool showGradient;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: isInverted ? getInvertedChildren() : getChildren(),
    );
  }

  List<Widget> getChildren() {
    return [
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: index == 0
                    ? [Colors.transparent, Colors.transparent]
                    : index <= activeIndex
                        ? BaseColors.secondaryColorList
                        : [
                            BaseColors.secondaryGreyColor,
                            BaseColors.secondaryGreyColor
                          ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )),
              width: barWidth,
              height: gap,
            ),
          ),
          Row(
            children: [
              SizedBox(
                height: 15.h,
                width: 15.w,
                child: showGradient
                    ? GradientText(("${index + 1}"),
                        style: BaseTextStyles.textFieldStyle.copyWith(
                            fontSize: 14, fontWeight: FontWeight.w400),
                        colors: index <= activeIndex
                            ? BaseColors.secondaryColorList
                            : [
                                BaseColors.secondaryGreyColor,
                                BaseColors.secondaryGreyColor
                              ])
                    : const SizedBox(),
              ),
              2.toHSB,
              DotProvider(
                activeIndex: activeIndex,
                index: index,
                item: item,
                totalLength: totalLength,
                iconHeight: iconHeight,
                iconWidth: iconWidth,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: index == totalLength - 1
                    ? [Colors.transparent, Colors.transparent]
                    : index < activeIndex
                        ? BaseColors.secondaryColorList
                        : [
                            BaseColors.secondaryGreyColor,
                            BaseColors.secondaryGreyColor
                          ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )),
              width: barWidth,
              height: gap,
            ),
          ),
        ],
      ),
      const SizedBox(width: 5),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (item.title != null) ...[
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  item.title!.text,
                  textAlign: TextAlign.start,
                  style: item.title!.textStyle ??
                      const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
            ],
            if (item.subtitle != null) ...[
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  item.subtitle!.text,
                  textAlign: TextAlign.start,
                  style: item.subtitle!.textStyle ??
                      TextStyle(
                        fontSize: 10,
                        color: BaseColors.secondaryColorList[1],
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
            ],
          ],
        ),
      ),
    ];
  }

  List<Widget> getInvertedChildren() {
    return getChildren().reversed.toList();
  }
}
