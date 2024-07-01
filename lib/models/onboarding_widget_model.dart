import 'package:flutter/material.dart';

class OnboardingWidgetModel {
  final int pageIndex;
  final String title;
  final String desc;
  final CustomPainter decoration;

  OnboardingWidgetModel(
      {required this.pageIndex,
      required this.title,
      required this.desc,
      required this.decoration});
}
