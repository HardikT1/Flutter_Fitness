import 'package:fitness_app/utils/base_constants/base_assets.dart';
import 'package:fitness_app/utils/base_constants/base_colors.dart';
import 'package:fitness_app/utils/base_constants/base_strings.dart';
import 'package:fitness_app/utils/base_constants/text_style.dart';
import 'package:fitness_app/utils/common/custom_appbar.dart';
import 'package:fitness_app/utils/widgets/text_view.dart';
import 'package:fitness_app/view/ui/home/Home_components/gradient_btn.dart';
import 'package:fitness_app/view/ui/home/Home_components/stepper/another_stepper.dart';
import 'package:fitness_app/view/ui/meal/food%20detail/const_lists_food_details.dart';
import 'package:fitness_app/view/ui/meal/food%20detail/food_detail_helper.dart';
import 'package:fitness_app/view/ui/meal/meal_schedule/meal_schedule_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FoodDetailScreen extends StatefulWidget {
  const FoodDetailScreen({super.key});

  @override
  State<FoodDetailScreen> createState() => _FoodDetailScreenState();
}

class _FoodDetailScreenState extends State<FoodDetailScreen> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: BaseColors.brandColorList),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const CustomAppBar(
          title: "",
          gradient: LinearGradient(colors: BaseColors.brandColorList),
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Container(
                width: double.infinity,
                height: 250.h,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: BaseColors.brandColorList),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 43.w, right: 43.w),
                  child: SvgPicture.asset(
                    BaseAssets.pancake, height: 263.h, width: 288.w,
                    // Adjust fit as needed
                  ),
                ),
              ),
            ),
            DraggableScrollableSheet(
              initialChildSize: 0.66,
              minChildSize: 0.66,
              // maxChildSize: 1.0,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                    color: Colors.white,
                  ),
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Padding(
                      padding: EdgeInsets.only(left: 30.w, right: 30.w),
                      // Adjust padding here
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FoodDetailHelper.singleton.blueberryPancake,
                          Padding(
                            padding: EdgeInsets.only(top: 30.h),
                            child: TextView(
                              BaseStrings.nutrition,
                              textStyle: BaseTextStyles.textFieldStyle.copyWith(
                                fontSize: 16.sp,
                                color: BaseColors.blackColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 15.h),
                            child: FoodDetailHelper.nutritionCard(
                              ConstantListsFoodDetails.nutrition,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 30.h),
                            child: FoodDetailHelper.singleton.descriptionTitle,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isExpanded = !isExpanded;
                              });
                            },
                            child: RichText(
                              textAlign: TextAlign.start,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: isExpanded
                                        ? BaseStrings.descriptionDetails
                                        : (BaseStrings
                                                    .descriptionDetails.length >
                                                100
                                            ? BaseStrings.descriptionDetails
                                                .substring(0, 100)
                                            : BaseStrings.descriptionDetails),
                                    style:
                                        BaseTextStyles.textFieldStyle.copyWith(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                      color: BaseColors.secondaryGreyColor,
                                    ),
                                  ),
                                  if (!isExpanded &&
                                      BaseStrings.descriptionDetails.length >
                                          100)
                                    TextSpan(
                                      text: '... ',
                                      // Ellipsis to indicate truncated text
                                      style: BaseTextStyles.textFieldStyle
                                          .copyWith(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400,
                                        color: BaseColors.secondaryGreyColor,
                                      ),
                                    ),
                                  if (!isExpanded &&
                                      BaseStrings.descriptionDetails.length >
                                          100)
                                    TextSpan(
                                      text: BaseStrings.descReadMore,
                                      style: BaseTextStyles.textFieldStyle
                                          .copyWith(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xff9DCEFF),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 30.h),
                            child: FoodDetailHelper.singleton.ingredient,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 15.h),
                            child: FoodDetailHelper.ingridientCard(
                              ConstantListsFoodDetails.ingridientList,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 30.h),
                            child: FoodDetailHelper.singleton.steps,
                          ),
                          AnotherStepper(
                            showGradient: true,
                            stepperList: ConstantListsFoodDetails.stepperData,
                            stepperDirection: Axis.vertical,
                            iconHeight: 24.h,
                            iconWidth: 24.w,
                            activeIndex: 1,
                            verticalGap: 35.h,
                            activeBarColor: BaseColors.secondaryPurpleColor,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 30.h, bottom: 30.h),
                            child: GradientBtn(
                              onPressed: () {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const MealScheduleScreen()));
                              },
                              height: 60.h,
                              btnText: "Add to Breakfast Meal",
                              textStyle: BaseTextStyles.textFieldStyle.copyWith(
                                fontWeight: FontWeight.w600,
                                color: BaseColors.whiteColor,
                                fontSize: 16.sp,
                              ),
                              colorGradient: const LinearGradient(
                                colors: BaseColors.brandColorList,
                              ),
                              width: 315.w,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
