import 'package:fitness_app/utils/base_constants/base_colors.dart';
import 'package:fitness_app/utils/base_constants/base_strings.dart';
import 'package:fitness_app/utils/base_constants/text_style.dart';
import 'package:fitness_app/utils/common/custom_appbar.dart';
import 'package:fitness_app/utils/common/customserachedittextfield.dart';
import 'package:fitness_app/view/ui/meal/mealtypedetail/constantallmeallists.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utils/base_constants/base_assets.dart';
import 'meal_type_detail_helper.dart';

class MealTypeDetails extends StatefulWidget {
  const MealTypeDetails({super.key});

  @override
  State<MealTypeDetails> createState() => _MealTypeDetailsState();
}

class _MealTypeDetailsState extends State<MealTypeDetails> {
  final MealTypeDetailHelper mealTypeDetailHealper = MealTypeDetailHelper();
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const CustomAppBar(title: BaseStrings.mealTypeDetailAppBar),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomeSearchEditTextField(
                  searchText: BaseStrings.searchText,
                  suffixIcon: SvgPicture.asset(BaseAssets.filtericon)),
              Text(BaseStrings.categoryText,
                  style: BaseTextStyles.textFieldStyle.copyWith(
                      fontSize: 16.sp,
                      color: BaseColors.blackColor,
                      fontWeight: FontWeight.w600)),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: MealTypeDetailHelper.categoryCard(
                    ConstantAllMealLists.categoryList, size),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Text(BaseStrings.recommandetion,
                    style: BaseTextStyles.textFieldStyle.copyWith(
                        fontSize: 16,
                        color: BaseColors.blackColor,
                        fontWeight: FontWeight.w600)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: MealTypeDetailHelper.recommendetionCard(
                    ConstantAllMealLists.recommendationList, size),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Text(BaseStrings.popular,
                    style: BaseTextStyles.textFieldStyle.copyWith(
                        fontSize: 16,
                        color: BaseColors.blackColor,
                        fontWeight: FontWeight.w600)),
              ),
              MealTypeDetailHelper.popularCard(
                  ConstantAllMealLists.popularList, size, selectedIndex,
                  (index) {
                setState(() {
                  selectedIndex = index;
                });
              }),
            ],
          ),
        ),
      ),
    );
  }
}
