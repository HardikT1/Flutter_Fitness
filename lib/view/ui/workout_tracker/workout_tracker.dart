import 'package:fitness_app/view/ui/workout_tracker/workout_components/draggable_bottom_container.dart';
import 'package:fitness_app/view/ui/workout_tracker/workout_components/workout_appbar.dart';
import 'package:fitness_app/view/ui/workout_tracker/workout_components/workout_graph.dart';
import 'package:flutter/material.dart';

import '../../../utils/base_constants/base_colors.dart';
import '../../../utils/base_constants/base_strings.dart';

class WorkoutTracker extends StatelessWidget {
  const WorkoutTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: BaseColors.brandColorList),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(80),
            child: WorkoutAppbar(
              title: BaseStrings.workoutText,
            )),
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: BaseColors.brandColorList)),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: WorkoutGraph(),
                  ),
                ],
              ),
            ),
            const DraggableBottomContainer()
          ],
        ),
      ),
    );
  }
}
