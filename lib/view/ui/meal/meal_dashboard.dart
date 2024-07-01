import 'package:fitness_app/utils/base_constants/base_assets.dart';
import 'package:fitness_app/utils/base_constants/base_colors.dart';
import 'package:fitness_app/utils/base_constants/base_strings.dart';
import 'package:fitness_app/utils/common/common_dropdown.dart';
import 'package:fitness_app/utils/common/custom_appbar.dart';
import 'package:fitness_app/utils/widgets/background_card.dart';
import 'package:fitness_app/utils/widgets/text_view.dart';
import 'package:fitness_app/view/ui/meal/meal_healper.dart';
import 'package:fitness_app/view/ui/meal/meal_schedule/meal_schedule_screen.dart';
import 'package:fitness_app/view/ui/meal/mealtypedetail/meal_type_detail.dart';
import 'package:flutter/material.dart';

class MealDashboard extends StatefulWidget {
  const MealDashboard({super.key});

  @override
  State<MealDashboard> createState() => _MealDashboardState();
}

class _MealDashboardState extends State<MealDashboard> {
  final MealHealper mealHealper = MealHealper();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const CustomAppBar(
        title: BaseStrings.mealPlannerText,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const TextView(BaseStrings.mealNutritionsText,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: BaseColors.blackColor),
                CommonDropdown(
                  height: size.height * 0.04,
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 30),
              width: size.width,
              height: size.width * 0.50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: BaseColors.whiteColor,
              ),
              child: mealHealper.mealChat(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                splashFactory: NoSplash.splashFactory,
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const MealScheduleScreen(),
                  ));
                },
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
                          BaseStrings.dailyMealScheduleText,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                        Container(
                          height: size.width * 0.10,
                          width: size.width * 0.20,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                                colors: BaseColors.brandColorList,
                                end: Alignment.bottomCenter,
                                begin: Alignment.topRight),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: const Center(
                              child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: TextView(
                              BaseStrings.checkText,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: BaseColors.whiteColor,
                            ),
                          )),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const TextView(BaseStrings.todayMealsText,
                      textStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: BaseColors.blackColor)),
                  CommonDropdown(
                    height: size.height * 0.04,
                  )
                ],
              ),
            ),
            mealHealper.mealListTile(size,
                title: "Salmon Nigiri",
                subtitle: "Today | 7am",
                trailingIcon: Icons.notifications_none_sharp,
                iconColor: BaseColors.purpleColor,
                leadingIcon: BaseAssets.bunIcon),
            mealHealper.mealListTile(size,
                title: "Lowfat Milk",
                subtitle: "Today | 8am",
                trailingIcon: Icons.notifications_off_outlined,
                iconColor: BaseColors.lightGreyColor,
                leadingIcon: BaseAssets.cupIcon),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: TextView(BaseStrings.findEatText,
                  textAlign: TextAlign.start,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: BaseColors.blackColor),
            ),
            // mealHealper.mealCard(
            //   mealTitle: "Breakfast",
            //   mealDesc: "120+ Foods",
            //   mealIcon:BaseAssets.panCakeIcon,
            //   size: size,
            //   cardBackgroudColor: [
            //     BaseColors.secondaryLightBlueColor.withOpacity(0.20),
            //     BaseColors.primaryBlueColor.withOpacity(0.20),
            //   ],
            //   buttonBackgroudColor: [
            //     BaseColors.secondaryLightBlueColor.withOpacity(0.20),
            //     BaseColors.primaryBlueColor.withOpacity(0.20),
            //   ],
            // ),
            SizedBox(
              width: size.width,
              height: size.width * 0.60,
              child: Row(
                children: [
                  Expanded(
                    child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: [
                          InkWell(
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            splashFactory: NoSplash.splashFactory,
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const MealTypeDetails(),
                              ));
                            },
                            child: mealHealper.mealCard(
                              mealTitle: "Breakfast",
                              mealDesc: "120+ Foods",
                              mealIcon: BaseAssets.panCakeIcon,
                              size: size,
                              cardBackgroudColor: [
                                BaseColors.secondaryLightBlueColor
                                    .withOpacity(0.20),
                                BaseColors.primaryBlueColor.withOpacity(0.20),
                              ],
                              buttonBackgroudColor: [
                                BaseColors.secondaryLightBlueColor,
                                BaseColors.primaryBlueColor,
                              ],
                            ),
                          ),
                          mealHealper.mealCard(
                            mealTitle: "Lunch",
                            mealDesc: "130+ Foods",
                            mealIcon: BaseAssets.chikenMealIcon,
                            size: size,
                            cardBackgroudColor: [
                              BaseColors.secondaryPurpleColor.withOpacity(0.20),
                              BaseColors.purpleColor.withOpacity(0.20),
                            ],
                            buttonBackgroudColor: [
                              BaseColors.secondaryPurpleColor,
                              BaseColors.purpleColor,
                            ],
                          ),
                          mealHealper.mealCard(
                            mealTitle: "Dinner",
                            mealDesc: "90+ Foods",
                            mealIcon: BaseAssets.saladIcon,
                            size: size,
                            cardBackgroudColor: [
                              BaseColors.secondaryLightBlueColor
                                  .withOpacity(0.20),
                              BaseColors.primaryBlueColor.withOpacity(0.20),
                            ],
                            buttonBackgroudColor: [
                              BaseColors.secondaryLightBlueColor,
                              BaseColors.primaryBlueColor,
                            ],
                          ),
                        ]),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
