import 'package:flutter/material.dart';
import '../../../../utils/base_constants/base_colors.dart';
import '../../../../utils/base_constants/base_strings.dart';
import '../../../../utils/widgets/background_card.dart';
import '../../../../utils/widgets/text_view.dart';
import '../../home/Home_components/gradient_btn.dart';

class DailyWorkoutScheduleCard extends StatelessWidget {
  const DailyWorkoutScheduleCard({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: BackgroundCard(
        height: size.height * 0.08,
        width: size.width,
        isGradient: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const TextView(
                BaseStrings.dailyWorkoutSchedule,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              GradientBtn(
                btnText: BaseStrings.check,
                height: size.height * 0.045,
                width: size.width * 0.23,
                colorGradient:
                    const LinearGradient(colors: BaseColors.brandColorList),
                textStyle: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: BaseColors.whiteColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}
