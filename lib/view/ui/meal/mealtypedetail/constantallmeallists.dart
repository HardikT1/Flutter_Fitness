import 'package:fitness_app/models/mealtypemodels/mealtypecategorymodel.dart';
import 'package:fitness_app/utils/base_constants/base_assets.dart';

import '../../../../models/mealtypemodels/meal_type_popular_model.dart';
import '../../../../models/mealtypemodels/meal_type_recommendation_model.dart';
import '../../../../utils/base_constants/base_strings.dart';

class ConstantAllMealLists {
  static List<MealTypeCategoryModel> categoryList = [
    MealTypeCategoryModel(
        image: BaseAssets.category1,
        title: BaseStrings.category1,
        description: ""),
    MealTypeCategoryModel(
        image: BaseAssets.category2,
        title: BaseStrings.category2,
        description: ""),
    MealTypeCategoryModel(
        image: BaseAssets.category3,
        title: BaseStrings.category3,
        description: ""),
    MealTypeCategoryModel(
        image: BaseAssets.category4,
        title: BaseStrings.category4,
        description: ""),
  ];

  static List<MealTypeRecommendationModel> recommendationList = [
    MealTypeRecommendationModel(
        image: BaseAssets.recommendation1,
        title: BaseStrings.recommendationTitle1,
        description: BaseStrings.recommendationDesc1),
    MealTypeRecommendationModel(
        image: BaseAssets.chikenMealIcon,
        title: BaseStrings.recommendationTitle2,
        description: BaseStrings.recommendationDesc2)
  ];

  static List<MealTypePopular> popularList = [
    MealTypePopular(
        image: BaseAssets.popular1,
        title: BaseStrings.popularTitle1,
        description: BaseStrings.popularDesc1,
        isSelected: false),
    MealTypePopular(
        image: BaseAssets.bunIcon,
        title: BaseStrings.popularTitle2,
        description: BaseStrings.popularDesc2,
        isSelected: false)
  ];
}
