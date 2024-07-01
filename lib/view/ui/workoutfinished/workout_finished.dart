import 'package:fitness_app/utils/base_constants/base_colors.dart';
import 'package:fitness_app/utils/base_constants/base_extensions.dart';
import 'package:fitness_app/utils/base_constants/text_style.dart';
import 'package:fitness_app/utils/common/custom_form_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../utils/base_constants/base_assets.dart';
import '../../../utils/base_constants/base_strings.dart';

class WorkoutFinished extends StatelessWidget {
  const WorkoutFinished({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: BaseColors.whiteColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            65.toVSB,
            buildSvgPicture(),
            36.toVSB,
            buildColumnText(),
            150.toVSB,
            buildSizedBox()
          ],
        ),
      ),
    );
  }

  SizedBox buildSizedBox() {
    return SizedBox(
      width: 315.w,
      height: 60.h,
      child: CustomFormButton(
        onPressed: () {},
        buttonText: BaseStrings.btnText,
        btnTextStyle: BaseTextStyles.textFieldStyle.copyWith(
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
            color: BaseColors.whiteColor),
      ),
    );
  }

  SvgPicture buildSvgPicture() => SvgPicture.asset(BaseAssets.finishimage);

  Column buildColumnText() => Column(
        children: [
          Padding(
            padding: REdgeInsets.symmetric(horizontal: 40),
            child: Text(
              BaseStrings.activityFinishedTitle,
              textAlign: TextAlign.center,
              style: BaseTextStyles.textFieldStyle.copyWith(
                  fontSize: 20.sp,
                  color: BaseColors.blackColor,
                  fontWeight: FontWeight.w700),
            ),
          ),
          15.toVSB,
          Padding(
            padding: REdgeInsets.symmetric(horizontal: 20),
            child: Text(
              BaseStrings.activityFinidhedSubTitle,
              textAlign: TextAlign.center,
              style: BaseTextStyles.textFieldStyle.copyWith(
                  fontSize: 12.sp,
                  color: BaseColors.primaryGreyColor,
                  fontWeight: FontWeight.w400),
            ),
          ),
          5.toVSB,
          Text(
            BaseStrings.authorName,
            style: BaseTextStyles.textFieldStyle.copyWith(
                fontSize: 12.sp,
                color: BaseColors.primaryGreyColor,
                fontWeight: FontWeight.w400),
          ),
        ],
      );
}
