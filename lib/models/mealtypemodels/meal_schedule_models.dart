import 'package:fitness_app/utils/base_constants/base_assets.dart';

import '../../utils/base_constants/base_strings.dart';
import '../../utils/enum/meal_category.dart';
import '../basemodel/base_model.dart';

class MealScheduleModel extends BaseModel {
  String? mealTime;
  MealCategory mealCategory;
  int? mealCalories;

  MealScheduleModel({
    super.image = BaseAssets.panCakeIcon,
    super.title = BaseStrings.recommendationTitle1,
    super.description = "",
    this.mealTime,
    this.mealCategory = MealCategory.breakfast,
    this.mealCalories,
  });

  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = super.toJson();
    data["mealTime"] = mealTime;
    data["mealCategory"] = mealCategory;
    data["mealCalories"] = mealCalories;
    return data;
  }
}
