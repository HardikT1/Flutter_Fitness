import 'package:fitness_app/utils/base_constants/base_assets.dart';
import 'package:fitness_app/utils/base_constants/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../models/fooddetail/food_detail_ingridient.dart';
import '../../../../models/fooddetail/food_detail_nutrition.dart';
import '../../../../utils/base_constants/base_colors.dart';
import '../../../../utils/base_constants/base_strings.dart';
import '../../home/Home_components/stepper/stepper_data.dart';

class ConstantListsFoodDetails {
  static List<FoodDetailNutrition> nutrition = [
    FoodDetailNutrition(
        image: "assets/icons/nutrition1.svg",
        title: "",
        description: BaseStrings.nutritionDesc1),
    FoodDetailNutrition(
        image: "assets/icons/nutrition2.svg",
        title: "",
        description: BaseStrings.nutritionDesc2),
    FoodDetailNutrition(
        image: "assets/icons/nutrition3.svg",
        title: "",
        description: BaseStrings.nutritionDesc3),
    FoodDetailNutrition(
        image: "assets/icons/nutrition4.svg",
        title: "",
        description: BaseStrings.nutritionDesc1),
  ];
  static List<FoodDetailIngridient> ingridientList = [
    FoodDetailIngridient(
        image: BaseAssets.ingridient1,
        title: BaseStrings.ingridientTitle1,
        description: BaseStrings.ingridientDesc1),
    FoodDetailIngridient(
        image: BaseAssets.ingridient2,
        title: BaseStrings.ingridientTitle2,
        description: BaseStrings.ingridientDesc2),
    FoodDetailIngridient(
        image: BaseAssets.ingridient3,
        title: BaseStrings.ingridientTitle3,
        description: BaseStrings.ingridientDesc3),
    FoodDetailIngridient(
        image: BaseAssets.ingridient4,
        title: BaseStrings.ingridientTitle4,
        description: BaseStrings.ingridientDesc4),
    FoodDetailIngridient(
        image: BaseAssets.ingridient1,
        title: BaseStrings.ingridientTitle1,
        description: BaseStrings.ingridientDesc1),
    FoodDetailIngridient(
        image: BaseAssets.ingridient2,
        title: BaseStrings.ingridientTitle2,
        description: BaseStrings.ingridientDesc2)
  ];
  static List<StepperData> stepperData = [
    StepperData(
      title: StepperText(BaseStrings.stepperTitle1,
          textStyle: BaseTextStyles.textFieldStyle
              .copyWith(color: BaseColors.blackColor, fontSize: 14.sp)),
      subtitle: StepperText(BaseStrings.stepperDesc1,
          textStyle: BaseTextStyles.textFieldStyle
              .copyWith(color: BaseColors.primaryGreyColor, fontSize: 12.sp)),
    ),
    StepperData(
      title: StepperText(BaseStrings.stepperTitle2,
          textStyle: BaseTextStyles.textFieldStyle
              .copyWith(color: BaseColors.blackColor, fontSize: 14.sp)),
      subtitle: StepperText(BaseStrings.stepperDesc2,
          textStyle: BaseTextStyles.textFieldStyle
              .copyWith(color: BaseColors.primaryGreyColor, fontSize: 12.sp)),
    ),
    StepperData(
        title: StepperText(BaseStrings.stepperTitle3,
            textStyle: BaseTextStyles.textFieldStyle
                .copyWith(color: BaseColors.blackColor, fontSize: 14.sp)),
        subtitle: StepperText(BaseStrings.stepperDesc3,
            textStyle: BaseTextStyles.textFieldStyle.copyWith(
                color: BaseColors.primaryGreyColor, fontSize: 12.sp))),
    StepperData(
      title: StepperText(BaseStrings.stepperTitle4,
          textStyle: BaseTextStyles.textFieldStyle
              .copyWith(color: BaseColors.blackColor, fontSize: 14.sp)),
      subtitle: StepperText(BaseStrings.stepperDesc1,
          textStyle: BaseTextStyles.textFieldStyle
              .copyWith(color: BaseColors.primaryGreyColor, fontSize: 12.sp)),
    ),
    StepperData(
      title: StepperText(BaseStrings.stepperTitle5,
          textStyle: BaseTextStyles.textFieldStyle
              .copyWith(color: BaseColors.blackColor, fontSize: 14.sp)),
      subtitle: StepperText(BaseStrings.stepperDesc2,
          textStyle: BaseTextStyles.textFieldStyle
              .copyWith(color: BaseColors.primaryGreyColor, fontSize: 12.sp)),
    ),
    StepperData(
      title: StepperText(BaseStrings.stepperTitle6,
          textStyle: BaseTextStyles.textFieldStyle
              .copyWith(color: BaseColors.blackColor, fontSize: 14.sp)),
      subtitle: StepperText(BaseStrings.stepperDesc3,
          textStyle: BaseTextStyles.textFieldStyle
              .copyWith(color: BaseColors.primaryGreyColor, fontSize: 12.sp)),
    ),
    StepperData(
      title: StepperText(BaseStrings.stepperTitle7,
          textStyle: BaseTextStyles.textFieldStyle
              .copyWith(color: BaseColors.blackColor, fontSize: 14.sp)),
      subtitle: StepperText(BaseStrings.stepperDesc1,
          textStyle: BaseTextStyles.textFieldStyle
              .copyWith(color: BaseColors.primaryGreyColor, fontSize: 12.sp)),
    ),
    StepperData(
      title: StepperText(BaseStrings.stepperTitle8,
          textStyle: BaseTextStyles.textFieldStyle
              .copyWith(color: BaseColors.blackColor, fontSize: 14.sp)),
      subtitle: StepperText(BaseStrings.stepperDesc2,
          textStyle: BaseTextStyles.textFieldStyle
              .copyWith(color: BaseColors.primaryGreyColor, fontSize: 12.sp)),
    )
  ];
}
