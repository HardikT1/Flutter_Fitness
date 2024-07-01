import 'package:fitness_app/utils/base_constants/base_colors.dart';
import 'package:fitness_app/utils/base_constants/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TodaysTargetSubCard extends StatelessWidget {
  final String image;
  final String title;
  final String value;

  const TodaysTargetSubCard(
      {super.key,
      required this.image,
      required this.title,
      required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: BaseColors.whiteColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset(image, width: 25.w, height: 34.h),
              Padding(
                padding: EdgeInsets.only(top: 10.h, left: 8.w, bottom: 10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: BaseTextStyles.textFieldStyle.copyWith(
                            fontSize: 14.sp, color: const Color(0xFF9DCEFF))),
                    Text(
                      value,
                      style: BaseTextStyles.textFieldStyle.copyWith(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: BaseColors.primaryGreyColor),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
