import 'package:fitness_app/utils/base_constants/base_colors.dart';
import 'package:fitness_app/utils/base_constants/base_extensions.dart';
import 'package:flutter/material.dart';

import '../../../../utils/base_constants/base_strings.dart';
import '../../../../utils/base_constants/text_style.dart';
import '../../../../utils/common/common_switch.dart';
import '../../../../utils/widgets/text_view.dart';

class UpcomingWorkoutCard extends StatefulWidget {
  const UpcomingWorkoutCard({super.key});

  @override
  State<UpcomingWorkoutCard> createState() => _UpcomingWorkoutCardState();
}

class _UpcomingWorkoutCardState extends State<UpcomingWorkoutCard> {
  int? selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextView(
                BaseStrings.upcomingWorkout,
                fontSize: 16,
                color: BaseColors.blackColor,
                fontWeight: FontWeight.w600,
              ),
              TextView(
                BaseStrings.seeMore,
                fontSize: 13,
                color: BaseColors.secondaryGreyColor,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
          10.toVSB,
          ListView.builder(
            shrinkWrap: true,
            itemCount: 2,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return workoutCard(index: selectedIndex);
            },
          ),
        ],
      ),
    );
  }

  Widget workoutCard({
    int? index,
  }) {
    bool switchValue = false;
    Size size = MediaQuery.of(context).size;

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
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: BaseColors.whiteColor,
                boxShadow: [
                  BoxShadow(
                    color: BaseColors.lightGreyColor.withOpacity(1.0),
                    offset: const Offset(0.2, 0.2),
                    blurRadius: 10.0,
                  ),
                ]),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      5.toHSB,
                      Container(
                        height: size.height * 0.07,
                        width: size.width * 0.12,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            //  borderRadius: BorderRadius.circular(90),
                            gradient: LinearGradient(colors: [
                              const Color(0xffC58BF2).withOpacity(0.5),
                              const Color(0xffEEA4CE).withOpacity(0.5),
                            ])),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextView(
                                'Upperbody Workout',
                                textStyle: BaseTextStyles.textFieldStyle
                                    .copyWith(
                                        fontSize: 14,
                                        color: BaseColors.blackColor),
                              ),
                              TextView(
                                'June 05, 02:00pm',
                                textStyle:
                                    BaseTextStyles.textFieldStyle.copyWith(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: BaseColors.primaryGreyColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      CommonGradientSwitch(
                        isSwitchOn: switchValue,
                        height: size.height * 0.03,
                        width: size.width * 0.12,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}
