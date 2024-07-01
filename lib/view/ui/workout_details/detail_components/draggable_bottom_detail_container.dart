import 'package:fitness_app/utils/base_constants/base_assets.dart';
import 'package:fitness_app/utils/base_constants/base_colors.dart';
import 'package:fitness_app/utils/base_constants/base_extensions.dart';
import 'package:fitness_app/utils/base_constants/base_strings.dart';
import 'package:fitness_app/utils/common/svg_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../utils/widgets/text_view.dart';
import 'equipments_card.dart';
import 'exercises_section.dart';
import 'gradient_bg_card.dart';

class DraggableBottomDetailContainer extends StatefulWidget {
  const DraggableBottomDetailContainer({super.key});

  @override
  State<DraggableBottomDetailContainer> createState() =>
      _DraggableBottomDetailContainerState();
}

class _DraggableBottomDetailContainerState
    extends State<DraggableBottomDetailContainer> {
  final DraggableScrollableController sheetController =
      DraggableScrollableController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      controller: sheetController,
      initialChildSize: 0.63,
      minChildSize: 0.60,
      maxChildSize: 0.9,
      builder: (BuildContext context, scrollController) {
        return Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          child: CustomScrollView(
            controller: scrollController,
            slivers: [
              SliverToBoxAdapter(
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).hintColor,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    height: 4,
                    width: 40,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                  ),
                ),
              ),
              SliverList.list(children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextView(
                            BaseStrings.fullBodyWorkout,
                            textStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: BaseColors.blackColor),
                          ),
                          TextView(
                            '11 Exercises | 32mins | 320 Calories Burn',
                            textStyle: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: BaseColors.primaryGreyColor),
                          ),
                        ],
                      ),
                      SvgPicture.asset(BaseAssets.heart)
                    ],
                  ),
                ),
                10.toVSB,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(children: [
                    scheduleCard(),
                    10.toVSB,
                    beginnerCard(),
                  ]),
                ),
                10.toVSB,
                EquipmentsCard(),
                ExercisesSection()
              ])
            ],
          ),
        );
      },
    );
  }

  Widget scheduleCard() {
    return GradientBgCard(
      isGradient: true,
      linearGradientColor: LinearGradient(colors: [
        BaseColors.primaryBlueColor.withOpacity(0.4),
        BaseColors.secondaryLightBlueColor.withOpacity(0.4)
      ]),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SvgImage(
              image: BaseAssets.calendarIcon,
            ),
            15.toHSB,
            const TextView(
              BaseStrings.scheduleWorkout,
              textStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: BaseColors.primaryGreyColor),
            ),
            const Spacer(),
            const TextView(
              '5/27, 09:00 AM',
              textStyle: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: BaseColors.primaryGreyColor),
            ),
            Image.asset(
              BaseAssets.forwardIcon,
              height: 20,
              width: 20,
            )
          ],
        ),
      ),
    );
  }

  Widget beginnerCard() {
    return GradientBgCard(
      isGradient: true,
      linearGradientColor: LinearGradient(colors: [
        BaseColors.purpleColor.withOpacity(0.4),
        BaseColors.secondaryPurpleColor.withOpacity(0.4)
      ]),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SvgImage(
              image: BaseAssets.filterIcon,
            ),
            15.toHSB,
            const TextView(
              'Difficulty',
              textStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: BaseColors.primaryGreyColor),
            ),
            const Spacer(),
            const TextView(
              'Beginner',
              textStyle: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: BaseColors.primaryGreyColor),
            ),
            Image.asset(
              BaseAssets.forwardIcon,
              height: 20,
              width: 20,
            )
          ],
        ),
      ),
    );
  }
}
