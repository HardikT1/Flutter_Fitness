import 'package:fitness_app/utils/base_constants/base_colors.dart';
import 'package:fitness_app/utils/widgets/text_view.dart';
import 'package:flutter/material.dart';

class CameraScreen extends StatelessWidget {
  const CameraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: TextView(
        'Camera Screen',
        color: BaseColors.blackColor,
      ),
    );
  }
}
