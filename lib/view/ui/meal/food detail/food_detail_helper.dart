import 'package:fitness_app/models/fooddetail/food_detail_ingridient.dart';
import 'package:fitness_app/models/fooddetail/food_detail_nutrition.dart';
import 'package:fitness_app/utils/base_constants/base_colors.dart';
import 'package:fitness_app/utils/base_constants/base_extensions.dart';
import 'package:fitness_app/utils/base_constants/text_style.dart';
import 'package:fitness_app/utils/widgets/text_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../utils/base_constants/base_assets.dart';
import '../../../../utils/base_constants/base_strings.dart';

class FoodDetailHelper {
  FoodDetailHelper._internal();

  static final FoodDetailHelper singleton = FoodDetailHelper._internal();
  Widget blueberryPancake = Padding(
    padding: const EdgeInsets.only(top: 0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        40.toVSB,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              BaseStrings.blueBerryPanCake,
              style: BaseTextStyles.textFieldStyle.copyWith(
                  color: BaseColors.blackColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700),
            ),
            SvgPicture.asset(BaseAssets.heart)
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 5.h),
          child: RichText(
              text: TextSpan(children: [
            TextSpan(
                text: BaseStrings.by,
                style: BaseTextStyles.textFieldStyle.copyWith(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: BaseColors.blackColor)),
            TextSpan(
                text: BaseStrings.james,
                style: BaseTextStyles.textFieldStyle.copyWith(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff9DCEFF))),
          ])),
        ),
      ],
    ),
  );

  static Widget nutritionCard(List<FoodDetailNutrition> dataList) {
    return SizedBox(
      height: 38.h,
      child: ListView.builder(
        itemCount: dataList.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          final nutrition = dataList[index];
          return Padding(
            padding: EdgeInsets.only(right: 15.w),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                      colors: [
                        BaseColors.brandColorList[0].withOpacity(0.3),
                        BaseColors.brandColorList[1].withOpacity(0.3)
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.topRight,
                      tileMode: TileMode.clamp)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  if (nutrition.image != null) // Check if image is not null
                    Padding(
                        padding: EdgeInsets.only(left: 10.w),
                        child: SvgPicture.asset(nutrition.image!)),
                  Text(nutrition.title!,
                      style: BaseTextStyles.textFieldStyle.copyWith(
                          color: BaseColors.blackColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400) // Set text color
                      ),
                  Padding(
                    padding: EdgeInsets.only(left: 5.w, right: 10.w),
                    child: Text(
                      nutrition.description!,
                      style: BaseTextStyles.textFieldStyle.copyWith(
                          color: BaseColors.blackColor,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400), // Set text color
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget descriptionTitle = Padding(
    padding: EdgeInsets.only(bottom: 15.h),
    child: TextView(
      BaseStrings.descriptions,
      textStyle: BaseTextStyles.textFieldStyle.copyWith(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          color: BaseColors.blackColor),
    ),
  );
  Widget descrptionDetails = RichText(
      textAlign: TextAlign.start,
      text: TextSpan(children: [
        TextSpan(
            text: BaseStrings.descriptionDetails,
            style: BaseTextStyles.textFieldStyle.copyWith(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: BaseColors.secondaryGreyColor)),
        TextSpan(
            text: BaseStrings.descReadMore,
            style: BaseTextStyles.textFieldStyle.copyWith(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: BaseColors.secondaryLightBlueColor)),
      ]));

  Widget ingredient = Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      TextView(BaseStrings.ingredientTitle,
          textAlign: TextAlign.start,
          textStyle: BaseTextStyles.textFieldStyle.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 16.sp,
              color: BaseColors.blackColor)),
      TextView(
        BaseStrings.ingridientItems,
        textStyle: BaseTextStyles.textFieldStyle.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 12.sp,
            color: BaseColors.primaryGreyColor),
      )
    ],
  );

  static Widget ingridientCard(List<FoodDetailIngridient> dataList) {
    return SizedBox(
      height: 140.h,
      child: ListView.builder(
        itemCount: dataList.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          final ingridient = dataList[index];
          return Padding(
            padding: EdgeInsets.only(right: 15.w),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                padding: EdgeInsets.only(
                    left: 20.w, right: 20.w, top: 20.h, bottom: 20.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                      colors: [
                        BaseColors.brandColorList[0].withOpacity(0.3),
                        BaseColors.brandColorList[1].withOpacity(0.3)
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.topRight,
                      tileMode: TileMode.clamp),
                ),
                child: SvgPicture.asset(ingridient.image!),
              ),
              TextView(
                ingridient.title!,
                textAlign: TextAlign.start,
                textStyle: BaseTextStyles.textFieldStyle.copyWith(
                    color: BaseColors.blackColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400),
              ),
              TextView(
                ingridient.description!,
                textAlign: TextAlign.start,
                textStyle: BaseTextStyles.textFieldStyle.copyWith(
                    color: BaseColors.primaryGreyColor,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400),
              ),
            ]),
          );
        },
      ),
    );
  }

  Widget steps = Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      TextView(BaseStrings.stepByStep,
          textStyle: BaseTextStyles.textFieldStyle.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 16.sp,
              color: BaseColors.blackColor)),
      TextView(
        BaseStrings.steps,
        textStyle: BaseTextStyles.textFieldStyle.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 12.sp,
            color: BaseColors.primaryGreyColor),
      )
    ],
  );
}
