import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:fitness_app/utils/base_constants/base_colors.dart';
import 'package:fitness_app/utils/base_constants/base_extensions.dart';
import 'package:fitness_app/utils/base_constants/box_style.dart';
import 'package:fitness_app/utils/base_constants/text_style.dart';
import 'package:fitness_app/utils/common/custom_appbar.dart';
import 'package:fitness_app/view/ui/meal/meal_schedule/meal_schedule_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../../../../utils/base_constants/base_assets.dart';
import '../../../../utils/base_constants/base_strings.dart';
import '../../../../utils/common/common_progress_indicator.dart';

class MealScheduleScreen extends StatefulWidget {
  const MealScheduleScreen({super.key});

  @override
  State<MealScheduleScreen> createState() => _MealScheduleScreenState();
}

class _MealScheduleScreenState extends State<MealScheduleScreen> {
  final EasyInfiniteDateTimelineController _controller =
      EasyInfiniteDateTimelineController();
  DateTime _focusDate = DateTime.now();
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: Container(
        height: 60.h,
        width: 60.h,
        decoration: BoxDecoration(
            gradient:
                const LinearGradient(colors: BaseColors.secondaryColorList),
            borderRadius: BorderRadius.circular(100)),
        child: const Icon(
          Icons.add,
          color: BaseColors.whiteColor,
        ),
      ),
      appBar: const CustomAppBar(
        title: BaseStrings.mealSchedule,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            EasyInfiniteDateTimeLine(
              controller: _controller,
              firstDate: DateTime.now().add(const Duration(days: -365)),
              focusDate: _focusDate,
              lastDate: DateTime.now().add(const Duration(days: 365)),
              onDateChange: (selectedDate) {
                setState(() {
                  _focusDate = selectedDate;
                });
              },
              timeLineProps: const EasyTimeLineProps(vPadding: 10),
              itemBuilder: (context, fullDate, isSelected, onTap) {
                return Container(
                  decoration: isSelected
                      ? BaseBoxStyles.commonGradientBoxDecoration
                          .copyWith(borderRadius: BorderRadius.circular(10))
                      : BaseBoxStyles.commonGradientBoxDecoration.copyWith(
                          borderRadius: BorderRadius.circular(10),
                          gradient: const LinearGradient(colors: [
                            BaseColors.borderColor,
                            BaseColors.borderColor
                          ])),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Text(
                          DateFormat('EEE').format(fullDate),
                          style: TextStyle(
                              color: isSelected
                                  ? BaseColors.whiteColor
                                  : BaseColors.primaryGreyColor,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          DateFormat('dd').format(fullDate),
                          style: TextStyle(
                              color: isSelected
                                  ? BaseColors.whiteColor
                                  : BaseColors.primaryGreyColor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                );
              },
              dayProps: EasyDayProps(
                  activeDayStyle: DayStyle(
                      decoration: BaseBoxStyles.commonGradientBoxDecoration
                          .copyWith(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10))),
                      borderRadius: 10,
                      dayNumStyle: BaseTextStyles.dateViewDayStyle
                          .copyWith(color: BaseColors.whiteColor),
                      dayStrStyle: BaseTextStyles.dateViewMonthStyle
                          .copyWith(color: BaseColors.whiteColor),
                      monthStrStyle: BaseTextStyles.dateViewMonthStyle
                          .copyWith(color: BaseColors.whiteColor)),
                  inactiveDayStyle: DayStyle(
                      decoration: BaseBoxStyles.commonGradientBoxDecoration
                          .copyWith(
                              gradient: const LinearGradient(colors: [
                                BaseColors.borderColor,
                                BaseColors.borderColor
                              ]),
                              borderRadius: const BorderRadius.all(Radius.circular(10))),
                      dayNumStyle: BaseTextStyles.dateViewDayStyle,
                      dayStrStyle: BaseTextStyles.dateViewMonthStyle,
                      monthStrStyle: BaseTextStyles.dateViewMonthStyle),
                  todayStyle: DayStyle(dayNumStyle: BaseTextStyles.dateViewDayStyle, dayStrStyle: BaseTextStyles.dateViewMonthStyle, monthStrStyle: BaseTextStyles.dateViewMonthStyle)),
              headerBuilder: (context, dateTime) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          _controller.animateToDate(DateTime(_focusDate.year,
                              _focusDate.month - 1, dateTime.day));
                          setState(() {
                            _focusDate = DateTime(_focusDate.year,
                                _focusDate.month - 1, dateTime.day);
                          });
                        },
                        icon: SvgPicture.asset(BaseAssets.arrowLeftIcon)),
                    Text(
                      DateFormat.yMMMM().format(dateTime).toString(),
                      style: TextStyle(
                          color: BaseColors.secondaryGreyColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp),
                    ),
                    IconButton(
                        onPressed: () {
                          _controller.animateToDate(DateTime(_focusDate.year,
                              _focusDate.month + 1, dateTime.day));
                          setState(() {
                            _focusDate = DateTime(_focusDate.year,
                                _focusDate.month + 1, dateTime.day);
                          });
                        },
                        icon: SvgPicture.asset(BaseAssets.arrowRightIcon))
                  ],
                );
              },
            ),
            ListView.builder(
              padding: const EdgeInsets.only(top: 28.0, left: 30, right: 30),
              itemCount: mealScheduleMap.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final category = mealScheduleMap.keys.elementAt(index);
                final meals = mealScheduleMap[category];
                int totalCalories = meals!
                    .map<int>((meal) => meal.mealCalories!)
                    .reduce((value, element) => value + element);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          category.name,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16.sp,
                              fontFamily: BaseStrings.poppins),
                        ),
                        const Spacer(),
                        Text(
                          "${meals.length} ${BaseStrings.meals} | $totalCalories ${BaseStrings.calories.toLowerCase()}",
                          style: TextStyle(
                              color: BaseColors.secondaryGreyColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 12.sp,
                              fontFamily: BaseStrings.poppins),
                          textAlign: TextAlign.right,
                        )
                      ],
                    ),
                    15.toVSB,
                    ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: meals.length,
                      itemBuilder: (context, mealIndex) {
                        final meal = meals[mealIndex];
                        return InkWell(
                          highlightColor: Colors.transparent,
                          splashFactory: NoSplash.splashFactory,
                          child: Container(
                            decoration: ShapeDecoration.fromBoxDecoration(
                                const BoxDecoration(
                                    borderRadius: BorderRadius.zero,
                                    color: Colors.transparent,
                                    boxShadow: null)),
                            child: ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: Container(
                                height: 60.w,
                                width: 60.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    gradient: LinearGradient(
                                        colors: mealIndex % 2 == 0
                                            ? [
                                                BaseColors.brandColorList[0]
                                                    .withOpacity(0.3),
                                                BaseColors.brandColorList[1]
                                                    .withOpacity(0.3)
                                              ]
                                            : [
                                                BaseColors.secondaryColorList[0]
                                                    .withOpacity(0.3),
                                                BaseColors.secondaryColorList[1]
                                                    .withOpacity(0.3)
                                              ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.topRight,
                                        tileMode: TileMode.clamp)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 12.0),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.transparent,
                                    child: meal.image != null
                                        ? SvgPicture.asset(meal.image!)
                                        : const SizedBox(),
                                  ),
                                ),
                              ),
                              title: Text(
                                meal.title!,
                                style: BaseTextStyles.textFieldStyle.copyWith(
                                    fontSize: 14.sp,
                                    color: BaseColors.blackColor,
                                    fontFamily: BaseStrings.poppins,
                                    fontWeight: FontWeight.w500),
                              ),
                              subtitle: Padding(
                                padding: const EdgeInsets.only(top: 3),
                                child: Text(
                                  meal.mealTime!,
                                  style: BaseTextStyles.textFieldStyle.copyWith(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                      color: BaseColors.primaryGreyColor,
                                      fontFamily: BaseStrings.poppins),
                                ),
                              ),
                              trailing: IconButton(
                                padding: EdgeInsets.only(left: 40.w),
                                onPressed: null,
                                icon: SvgPicture.asset(
                                  BaseAssets.circleArrowButton,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    20.toVSB,
                  ],
                );
              },
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: 30.0.h, left: 30.w, right: 30.w, bottom: 15.h),
              child: Row(
                children: [
                  Text(
                    BaseStrings.todayMealNutritions,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                        fontFamily: BaseStrings.poppins),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30.w, right: 30.w, bottom: 15.h),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: mealNutritionsList.length,
                itemBuilder: (BuildContext context, int index) {
                  final data = mealNutritionsList[index];
                  return Column(children: [
                    InkWell(
                      highlightColor: Colors.transparent,
                      splashFactory: NoSplash.splashFactory,
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Card(
                          color: Colors.transparent,
                          elevation: 0,
                          child: Container(
                            decoration: index == selectedIndex
                                ? BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: BaseColors.whiteColor,
                                    boxShadow: [
                                        BoxShadow(
                                          color: BaseColors.lightGreyColor
                                              .withOpacity(1.0),
                                          offset: const Offset(0.2, 0.2),
                                          blurRadius: 10.0,
                                        ),
                                      ])
                                : ShapeDecoration.fromBoxDecoration(
                                    const BoxDecoration(
                                        borderRadius: BorderRadius.zero,
                                        color: Colors.transparent,
                                        boxShadow: null)),
                            child: ListTile(
                              minVerticalPadding: 15,
                              horizontalTitleGap: 8.0,
                              title: Row(
                                children: [
                                  Text(
                                    data.title!,
                                    style: BaseTextStyles.textFieldStyle
                                        .copyWith(
                                            fontSize: 12.sp,
                                            color: BaseColors.blackColor,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: BaseStrings.poppins),
                                  ),
                                  8.toHSB,
                                  SvgPicture.asset(data.image!),
                                  const Spacer(),
                                  Text(data.description!,
                                      style: BaseTextStyles.textFieldStyle
                                          .copyWith(
                                              fontSize: 10.sp,
                                              color:
                                                  BaseColors.primaryGreyColor,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: BaseStrings.poppins))
                                ],
                              ),
                              subtitle: Padding(
                                padding: const EdgeInsets.only(top: 3),
                                child: GradientProgressBar(
                                  gradient: const LinearGradient(
                                    colors: BaseColors.progressLinearGradient,
                                  ),
                                  backgroundColor: BaseColors.borderColor,
                                  percent: (100 / ((index + 2) - 0.6)).floor(),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]);
                  /* return notificationElements(data, index);*/
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
