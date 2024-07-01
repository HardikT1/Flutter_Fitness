import 'package:flutter/material.dart';

import '../../../utils/base_constants/base_colors.dart';
import '../workout_tracker/workout_components/workout_appbar.dart';
import 'detail_components/background_component.dart';
import 'detail_components/draggable_bottom_detail_container.dart';

class WorkoutDetailScreen extends StatelessWidget {
  const WorkoutDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: BaseColors.brandColorList),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(50), child: WorkoutAppbar()),
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: BaseColors.brandColorList)),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: BackgroundComponent()),
                ],
              ),
            ),
            const DraggableBottomDetailContainer()
          ],
        ),
      ),
    );
  }
}
