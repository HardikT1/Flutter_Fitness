import 'package:flutter/material.dart';

import '../../../utils/base_constants/base_colors.dart';
import '../../../utils/widgets/text_view.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: TextView(
        'Activity Screen',
        color: BaseColors.blackColor,
      ),
    );
  }
}
