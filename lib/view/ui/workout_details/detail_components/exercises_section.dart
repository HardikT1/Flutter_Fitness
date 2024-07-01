import 'package:fitness_app/utils/base_constants/base_extensions.dart';
import 'package:flutter/material.dart';

import '../../../../utils/base_constants/base_assets.dart';
import '../../../../utils/base_constants/base_colors.dart';
import '../../../../utils/base_constants/base_strings.dart';
import '../../../../utils/widgets/text_view.dart';
import '../../exercise detail/exercise_detail_screen.dart';

class ExercisesSection extends StatelessWidget {
  ExercisesSection({super.key});

  final List<String> images = [
    BaseAssets.exercises1Img,
    BaseAssets.exercises2Img,
    BaseAssets.exercises3Img,
    BaseAssets.exercises1Img,
  ];

  final List<String> equipmentTexts = [
    'Warm Up',
    'Jumping Jack',
    'Squats',
    'Rest and Drink',
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextView(
                BaseStrings.exercisesText,
                textStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: BaseColors.blackColor),
              ),
              TextView(
                '3 sets',
                textStyle: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: BaseColors.secondaryGreyColor),
              ),
            ],
          ),
        ),
        12.toVSB,
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const ExerciseDetailScreen()));
          },
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: images.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8, left: 20, right: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: BaseColors.secondaryLightBlueColor
                              .withOpacity(0.4)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                            width: size.width * 0.15, images[index]),
                      ),
                    ),
                    8.toHSB,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextView(
                          equipmentTexts[index],
                          textStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: BaseColors.blackColor),
                        ),
                        const TextView(
                          '12x',
                          textStyle: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: BaseColors.primaryGreyColor),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: BaseColors.primaryGreyColor, width: 1)),
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Image.asset(
                            BaseAssets.forwardIcon,
                            width: 15,
                            height: 15,
                          ),
                        ))
                  ],
                ),
              );
            },
          ),
        ),
        10.toVSB,
      ],
    );
  }
}
