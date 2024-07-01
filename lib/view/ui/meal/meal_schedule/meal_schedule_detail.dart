import 'package:collection/collection.dart';
import '../../../../models/mealtypemodels/meal_schedule_models.dart';
import '../../../../utils/base_constants/base_assets.dart';
import '../../../../utils/enum/meal_category.dart';

List<MealScheduleModel> mealScheduleList = [
  MealScheduleModel(
      title: "Honey Pancakes",
      mealCalories: 100,
      mealCategory: MealCategory.breakfast,
      image: BaseAssets.panCakeIcon,
      mealTime: "7:00 AM"),
  MealScheduleModel(
      title: "Honey Pancakes",
      mealCalories: 160,
      mealCategory: MealCategory.breakfast,
      image: BaseAssets.panCakeIcon,
      mealTime: "7:00 AM"),
  MealScheduleModel(
      title: "Honey Pancakes",
      mealCalories: 100,
      mealCategory: MealCategory.lunch,
      image: BaseAssets.panCakeIcon,
      mealTime: "7:00 AM"),
  MealScheduleModel(
      title: "Honey Pancakes",
      mealCalories: 110,
      mealCategory: MealCategory.lunch,
      image: BaseAssets.panCakeIcon,
      mealTime: "7:00 AM"),
  MealScheduleModel(
      title: "Honey Pancakes",
      mealCalories: 100,
      mealCategory: MealCategory.snacks,
      image: BaseAssets.panCakeIcon,
      mealTime: "7:00 AM"),
  MealScheduleModel(
      title: "Honey Pancakes",
      mealCalories: 130,
      mealCategory: MealCategory.snacks,
      image: BaseAssets.panCakeIcon,
      mealTime: "7:00 AM"),
  MealScheduleModel(
      title: "Honey Pancakes",
      mealCalories: 120,
      mealCategory: MealCategory.dinner,
      image: BaseAssets.panCakeIcon,
      mealTime: "7:00 AM"),
  MealScheduleModel(
      title: "Honey Pancakes",
      mealCalories: 100,
      mealCategory: MealCategory.dinner,
      image: BaseAssets.panCakeIcon,
      mealTime: "7:00 AM"),
];

List<MealScheduleModel> mealNutritionsList = [
  MealScheduleModel(
      title: "Calories",
      mealCalories: 100,
      description: "320 kCAl",
      mealCategory: MealCategory.breakfast,
      image: BaseAssets.caloriesIcon,
      mealTime: "7:00 AM"),
  MealScheduleModel(
      title: "Proteins",
      mealCalories: 160,
      description: "300g",
      mealCategory: MealCategory.breakfast,
      image: BaseAssets.proteinsIcon,
      mealTime: "7:00 AM"),
  MealScheduleModel(
      title: "Fats",
      mealCalories: 100,
      description: "140g",
      mealCategory: MealCategory.lunch,
      image: BaseAssets.transFatIcon,
      mealTime: "7:00 AM"),
  MealScheduleModel(
      title: "Carbo",
      mealCalories: 110,
      description: "140g",
      mealCategory: MealCategory.lunch,
      image: BaseAssets.carboIcon,
      mealTime: "7:00 AM"),
];

Map<MealCategory, List<MealScheduleModel>> mealScheduleMap =
    mealScheduleList.groupListsBy((element) => element.mealCategory);
