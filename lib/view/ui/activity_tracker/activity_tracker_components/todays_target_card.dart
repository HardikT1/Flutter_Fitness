import 'package:fitness_app/utils/base_constants/base_assets.dart';
import 'package:fitness_app/utils/base_constants/base_colors.dart';
import 'package:fitness_app/utils/base_constants/base_extensions.dart';
import 'package:fitness_app/utils/base_constants/text_style.dart';
import 'package:fitness_app/view/ui/activity_tracker/activity_tracker_components/today_target_sub_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../utils/base_constants/base_strings.dart';

class TodaysTargetCard extends StatelessWidget {
  const TodaysTargetCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: const LinearGradient(
              colors: BaseColors.brandColorList,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )),
        child: Container(
          color: Colors.white.withOpacity(0.5),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      BaseStrings.headerTodysTarget,
                      style: BaseTextStyles.textFieldStyle.copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: BaseColors.blackColor),
                    ),
                    Container(
                      alignment: Alignment.topRight,
                      width: 24.h,
                      height: 24.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          gradient: const LinearGradient(
                              colors: BaseColors.brandColorList,
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight)),
                      child: Center(
                        child: GestureDetector(
                            onTap: () {},
                            child: SvgPicture.asset("assets/icons/add.svg")),
                      ),
                    )
                  ],
                ),
              ),
              20.toVSB,
              Row(
                children: [
                  const TodaysTargetSubCard(
                      image: BaseAssets.water,
                      title: BaseStrings.waterLiter,
                      value: BaseStrings.waterIntake),
                  SizedBox(
                    width: 15.w,
                  ),
                  const TodaysTargetSubCard(
                      image: BaseAssets.footSteps,
                      title: BaseStrings.footsteps,
                      value: BaseStrings.foot)
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
