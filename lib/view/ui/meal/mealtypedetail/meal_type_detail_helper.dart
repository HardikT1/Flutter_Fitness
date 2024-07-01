import 'package:fitness_app/models/mealtypemodels/meal_type_popular_model.dart';
import 'package:fitness_app/models/mealtypemodels/meal_type_recommendation_model.dart';
import 'package:fitness_app/models/mealtypemodels/mealtypecategorymodel.dart';
import 'package:fitness_app/utils/base_constants/text_style.dart';
import 'package:fitness_app/view/ui/meal/food%20detail/food_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../utils/base_constants/base_assets.dart';
import '../../../../utils/base_constants/base_colors.dart';
import '../../home/Home_components/gradient_btn.dart';

class MealTypeDetailHelper {
  static Widget categoryCard(List<MealTypeCategoryModel> dataList, Size size) {
    return SizedBox(
      height: 130.h,
      child: ListView.builder(
        itemCount: dataList.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          final category = dataList[index];
          return Padding(
            padding: EdgeInsets.only(right: 15.w),
            child: Container(
              width: 80.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: index % 2 == 0
                    ? LinearGradient(
                        colors: [
                            BaseColors.brandColorList[0].withOpacity(0.3),
                            BaseColors.brandColorList[1].withOpacity(0.3)
                          ],
                        begin: Alignment.topLeft,
                        end: Alignment.topRight,
                        tileMode: TileMode.clamp)
                    : LinearGradient(
                        colors: [
                            BaseColors.secondaryColorList[0].withOpacity(0.3),
                            BaseColors.secondaryColorList[1].withOpacity(0.3)
                          ],
                        begin: Alignment.topLeft,
                        end: Alignment.topRight,
                        tileMode: TileMode.clamp),
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 15.h, left: 20.w, right: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (category.image != null) // Check if image is not null
                      Container(
                        padding: const EdgeInsets.all(8),
                        width: 40.w,
                        height: 41.h,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: BaseColors.whiteColor),
                        child: SvgPicture.asset(category.image!),
                      ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.h),
                      child: Text(category.title!,
                          style: BaseTextStyles.textFieldStyle.copyWith(
                              color: BaseColors.blackColor,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400) // Set text color
                          ),
                    ),
                    category.description?.trim().isEmpty != true
                        ? Text(
                            category.description ?? '',
                            style: const TextStyle(
                                color: Colors.white), // Set text color
                          )
                        : Container(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  static Widget recommendetionCard(
      List<MealTypeRecommendationModel> dataList, Size size) {
    return SizedBox(
      height: 239,
      child: ListView.builder(
        itemCount: dataList.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          final recommandetionlist = dataList[index];
          return Padding(
            padding: EdgeInsets.only(right: 15.w),
            child: Container(
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: index % 2 == 0
                    ? LinearGradient(
                        colors: [
                            BaseColors.brandColorList[0].withOpacity(0.3),
                            BaseColors.brandColorList[1].withOpacity(0.3)
                          ],
                        begin: Alignment.topLeft,
                        end: Alignment.topRight,
                        tileMode: TileMode.clamp)
                    : LinearGradient(
                        colors: [
                            BaseColors.secondaryColorList[0].withOpacity(0.3),
                            BaseColors.secondaryColorList[1].withOpacity(0.3)
                          ],
                        begin: Alignment.topLeft,
                        end: Alignment.topRight,
                        tileMode: TileMode.clamp),
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 30.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (recommandetionlist.image !=
                          null) // Check if image is not null
                        SizedBox(
                            height: 80,
                            width: 116,
                            child: SvgPicture.asset(recommandetionlist.image!)),
                      Padding(
                        padding: EdgeInsets.only(top: 15.h),
                        child: Text(recommandetionlist.title!,
                            style: BaseTextStyles.textFieldStyle.copyWith(
                                color: BaseColors.blackColor,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400) // Set text color
                            ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5.h, bottom: 15.h),
                        child: Text(
                          recommandetionlist.description!,
                          style: BaseTextStyles.textFieldStyle.copyWith(
                              fontSize: 12.sp,
                              color: BaseColors.primaryGreyColor,
                              fontWeight: FontWeight.w400), // Set text color
                        ),
                      ),
                      GradientBtn(
                        height: 38.h,
                        btnText: "View",
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const FoodDetailScreen()));
                        },
                        textStyle: BaseTextStyles.textFieldStyle.copyWith(
                            fontWeight: FontWeight.w600,
                            color: BaseColors.whiteColor,
                            fontSize: 12.sp),
                        colorGradient: const LinearGradient(
                            colors: BaseColors.brandColorList),
                        width: 110.w,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  static Widget popularCard(List<MealTypePopular> dataList, Size size,
      int? selectedIndex, Function(int) onTap) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: dataList.length,
      itemBuilder: (BuildContext context, int index) {
        final data = dataList[index];
        return Column(children: [
          InkWell(
            highlightColor: Colors.transparent,
            splashFactory: NoSplash.splashFactory,
            onTap: () {
              onTap(index);
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Card(
                elevation: 0,
                child: Container(
                  decoration: index == selectedIndex
                      ? BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: BaseColors.whiteColor,
                          boxShadow: [
                              BoxShadow(
                                color:
                                    BaseColors.lightGreyColor.withOpacity(1.0),
                                offset: const Offset(0.2, 0.2),
                                blurRadius: 10.0,
                              ),
                            ])
                      : ShapeDecoration.fromBoxDecoration(const BoxDecoration(
                          borderRadius: BorderRadius.zero,
                          color: Colors.transparent,
                          boxShadow: null)),
                  child: ListTile(
                    minVerticalPadding: 15,
                    horizontalTitleGap: 8.0,
                    leading: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: data.image != null
                          ? SvgPicture.asset(data.image!)
                          : const SizedBox(),
                    ),
                    title: Text(
                      data.title!,
                      style: BaseTextStyles.textFieldStyle.copyWith(
                        fontSize: 12.sp,
                        color: BaseColors.blackColor,
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 3),
                      child: Text(
                        data.description!,
                        style: BaseTextStyles.textFieldStyle.copyWith(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                          color: BaseColors.primaryGreyColor,
                        ),
                      ),
                    ),
                    trailing: IconButton(
                      highlightColor: Colors.transparent,
                      padding: const EdgeInsets.only(left: 40, bottom: 20),
                      onPressed: () {},
                      icon: SvgPicture.asset(BaseAssets.btnNotificationMeal),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ]);
        /* return notificationElements(data, index);*/
      },
    );
  }
}
