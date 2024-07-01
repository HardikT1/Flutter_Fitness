import 'package:fitness_app/utils/base_constants/base_assets.dart';
import 'package:fitness_app/utils/common/svg_image.dart';
import 'package:flutter/material.dart';

class BackgroundComponent extends StatelessWidget {
  const BackgroundComponent({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SvgImage(
      image: BaseAssets.menExerciseImg,
      height: size.height * 0.5,
    );
  }
}
