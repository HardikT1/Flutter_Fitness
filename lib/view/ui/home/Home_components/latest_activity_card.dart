import 'package:fitness_app/utils/base_constants/base_extensions.dart';
import 'package:fitness_app/utils/common/common_progress_indicator.dart';
import 'package:fitness_app/utils/common/svg_image.dart';
import 'package:fitness_app/utils/widgets/text_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/base_constants/base_assets.dart';
import '../../../../utils/base_constants/base_colors.dart';
import '../../../../utils/base_constants/base_strings.dart';
import '../../../../utils/base_constants/text_style.dart';

class LatestWorkoutCard extends StatefulWidget {
  const LatestWorkoutCard({super.key});

  @override
  State<LatestWorkoutCard> createState() => _LatestWorkoutCardState();
}

class _LatestWorkoutCardState extends State<LatestWorkoutCard> {
  int? selectedIndex = 0;

  List<String> titleText = [
    BaseStrings.fullBodyWorkout,
    BaseStrings.lowerBodyWorkout,
    BaseStrings.abWorkout,
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextView(BaseStrings.latestActivity,
                  textStyle: BaseTextStyles.textFieldStyle.copyWith(
                      color: BaseColors.blackColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600)),
              TextView(
                BaseStrings.seeMore,
                textStyle: BaseTextStyles.textFieldStyle.copyWith(
                    fontSize: 12.sp, color: BaseColors.secondaryGreyColor),
              )
            ],
          ),
          5.toVSB,
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: titleText.length,
            itemBuilder: (context, index) {
              return workoutCard(index: index, title: titleText[index]);
            },
          )
        ],
      ),
    );
  }

  Column workoutCard({int? index, String? title}) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      InkWell(
        highlightColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },
        child: Card(
          elevation: 0,
          child: Container(
            height: 100,
            decoration: index == selectedIndex
                ? BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: BaseColors.whiteColor,
                    boxShadow: [
                        BoxShadow(
                          color: BaseColors.lightGreyColor.withOpacity(1.0),
                          offset: const Offset(0.2, 0.2),
                          blurRadius: 10.0,
                        ),
                      ])
                : ShapeDecoration.fromBoxDecoration(const BoxDecoration(
                    borderRadius: BorderRadius.zero,
                    color: BaseColors.whiteColor,
                    boxShadow: null)),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      5.toHSB,
                      Container(
                        height: 50.h,
                        width: 50.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(90),
                        ),
                        child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            child: SvgImage(
                              image: BaseAssets.workoutImageSvg,
                              height: 80.h,
                              width: 80.w,
                            )),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextView(
                                title ?? '',
                                textStyle:
                                    BaseTextStyles.textFieldStyle.copyWith(
                                  fontSize: 12.sp,
                                  color: index == selectedIndex
                                      ? BaseColors.blackColor
                                      : BaseColors.lightGreyColor,
                                ),
                              ),
                              TextView(
                                '180 Calories Burn | 20minutes',
                                textStyle:
                                    BaseTextStyles.textFieldStyle.copyWith(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400,
                                  color: BaseColors.primaryGreyColor,
                                ),
                              ),
                              8.toVSB,
                            ],
                          ),
                        ),
                      ),
                      IconButton(
                        highlightColor: Colors.transparent,
                        padding: const EdgeInsets.only(right: 0, bottom: 20),
                        onPressed: () {},
                        icon: const SvgImage(image: BaseAssets.nextBtnImage),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      70.toHSB,
                      const Expanded(
                        child: GradientProgressBar(
                          percent: 30,
                          gradient:
                              LinearGradient(colors: BaseColors.brandColorList),
                          backgroundColor: BaseColors.borderColor,
                        ),
                      ),
                      40.toHSB,
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}
