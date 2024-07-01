import 'package:fitness_app/utils/base_constants/base_extensions.dart';
import 'package:fitness_app/utils/base_constants/base_strings.dart';
import 'package:fitness_app/utils/widgets/text_view.dart';
import 'package:fitness_app/view/ui/home/Home_components/stepper/another_stepper.dart';
import 'package:fitness_app/view/ui/home/Home_components/stepper/stepper_data.dart';
import 'package:flutter/material.dart';

import '../../../../utils/base_constants/base_colors.dart';
import '../../../../utils/common/common_progress_indicator.dart';
import 'background_card.dart';

class WaterIntakeCard extends StatefulWidget {
  const WaterIntakeCard({super.key});

  @override
  State<WaterIntakeCard> createState() => _WaterIntakeCardState();
}

class _WaterIntakeCardState extends State<WaterIntakeCard> {
  int activeStep = 0;
  List<StepperData> stepperData = [
    StepperData(
        title: StepperText(
          "6am - 8am",
        ),
        subtitle: StepperText("600ml"),
        iconWidget: Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: BaseColors.secondaryColorList),
              borderRadius: BorderRadius.all(Radius.circular(30))),
        )),
    StepperData(
        title: StepperText("9am - 11am"),
        subtitle: StepperText("500ml"),
        iconWidget: Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: BaseColors.secondaryColorList),
              borderRadius: BorderRadius.all(Radius.circular(30))),
        )),
    StepperData(
        title: StepperText("11am - 2pm"),
        subtitle: StepperText("1000ml"),
        iconWidget: Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: BaseColors.secondaryColorList),
              borderRadius: BorderRadius.all(Radius.circular(30))),
        )),
    StepperData(
        title: StepperText("2pm - 4pm"),
        subtitle: StepperText("700ml"),
        iconWidget: Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: BaseColors.secondaryColorList),
              borderRadius: BorderRadius.all(Radius.circular(30))),
        )),
    StepperData(
        title: StepperText("4pm - now"),
        subtitle: StepperText("900ml"),
        iconWidget: Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: BaseColors.secondaryColorList),
              borderRadius: BorderRadius.all(Radius.circular(30))),
        )),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BackgroundCard(
      height: size.height,
      isGradient: true,
      color: BaseColors.whiteColor,
      // backGroundColor: BaseColors.whiteColor,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(16)),
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.all(12),
              child: RotatedBox(
                quarterTurns: -1,
                child: GradientProgressBar(
                  gradient: LinearGradient(
                    colors: BaseColors.brandColorList,
                  ),
                  backgroundColor: BaseColors.borderColor,
                  percent: 40,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const TextView(
                    BaseStrings.waterIntake,
                    textStyle: TextStyle(
                        color: BaseColors.blackColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                  3.toVSB,
                  TextView(
                    '4 Litres',
                    textStyle: TextStyle(
                        color: BaseColors.brandColorList[1],
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                  3.toVSB,
                  const TextView(
                    BaseStrings.realTimeUpdate,
                    textStyle: TextStyle(
                        color: BaseColors.primaryGreyColor,
                        fontSize: 10,
                        fontWeight: FontWeight.w400),
                  ),
                  Flexible(
                    child: SizedBox(
                      width: size.width * 0.28,
                      child: AnotherStepper(
                        stepperList: stepperData,
                        stepperDirection: Axis.vertical,
                        iconWidth: 15,
                        iconHeight: 15,
                        verticalGap: 20,
                        activeIndex: 1,
                        barThickness: 3,
                        activeBarColor: BaseColors.secondaryColorList[1],
                        inActiveBarColor: Colors.grey,
                        isDashboard: true,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
