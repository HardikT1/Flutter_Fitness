import 'package:fitness_app/models/basemodel/base_model.dart';

class MealTypePopular extends BaseModel {
  final bool isSelected;

  MealTypePopular(
      {required String super.image,
      required super.title,
      required super.description,
      required this.isSelected});

  bool _isSelected = false;

  set setIsSelected(bool newValue) {
    _isSelected = newValue;
  }

  bool get getIsSelected => _isSelected;

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = super.toJson();
    data['isSelected'] = _isSelected;
    return data;
  }
}
