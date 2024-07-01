import 'package:fitness_app/utils/base_constants/base_assets.dart';
import 'package:fitness_app/utils/base_constants/base_extensions.dart';
import 'package:fitness_app/utils/common/svg_image.dart';
import 'package:fitness_app/view/ui/workout_details/workout_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/base_constants/base_colors.dart';
import '../../../../utils/base_constants/base_strings.dart';
import '../../../../utils/widgets/text_view.dart';
import '../../home/Home_components/gradient_btn.dart';

class WorkoutTypesCard extends StatelessWidget {
  WorkoutTypesCard({super.key});

  final List<String> titleText = [
    'Fullbody Workout',
    'Lowerbody Workout',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextView(
            BaseStrings.trainText,
            fontSize: 16,
            color: BaseColors.blackColor,
            fontWeight: FontWeight.w600,
          ),
          10.toVSB,
          ListView.builder(
            itemCount: titleText.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 10),
                child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const WorkoutDetailScreen()));
                    },
                    child:
                        typesCard(title: titleText[index], context: context)),
              );
            },
          ),
          15.toVSB,
        ],
      ),
    );
  }

  Widget typesCard({String? title, BuildContext? context}) {
    Size size = MediaQuery.of(context!).size;
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                BaseColors.brandColorList[0].withOpacity(0.3),
                BaseColors.brandColorList[1].withOpacity(0.3)
              ],
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              tileMode: TileMode.clamp),
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextView(
                  title ?? '',
                  fontSize: 14,
                  color: BaseColors.blackColor,
                  fontWeight: FontWeight.w500,
                ),
                5.toVSB,
                const TextView(
                  '11 Exercises | 32mins',
                  fontSize: 12,
                  color: BaseColors.primaryGreyColor,
                  fontWeight: FontWeight.w400,
                ),
                10.toVSB,
                GradientBtn(
                  btnText: BaseStrings.viewMore,
                  height: size.height * 0.045,
                  // width: size.width * 0.26,
                  colorGradient: const LinearGradient(
                      colors: [BaseColors.whiteColor, BaseColors.whiteColor]),
                  textStyle: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: BaseColors.brandColorList[0]),
                )
              ],
            ),
            Container(
              width: 95,
              height: 95,
              decoration: const BoxDecoration(
                  color: BaseColors.whiteColor, shape: BoxShape.circle),
              child: const SvgImage(
                image: BaseAssets.workoutImageSvg,
              ),
            )
          ],
        ),
      ),
    );
  }
}
