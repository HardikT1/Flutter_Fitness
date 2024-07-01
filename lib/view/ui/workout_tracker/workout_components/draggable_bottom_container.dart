import 'package:fitness_app/utils/base_constants/base_extensions.dart';
import 'package:fitness_app/view/ui/workout_tracker/workout_components/upcoming_workout_card.dart';
import 'package:fitness_app/view/ui/workout_tracker/workout_components/workout_types_card.dart';
import 'package:flutter/material.dart';
import 'daily_target_card.dart';

class DraggableBottomContainer extends StatefulWidget {
  const DraggableBottomContainer({super.key});

  @override
  State<DraggableBottomContainer> createState() =>
      _DraggableBottomContainerState();
}

class _DraggableBottomContainerState extends State<DraggableBottomContainer> {
  final DraggableScrollableController sheetController =
      DraggableScrollableController();

  final double _sheetPosition = 0.7;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      controller: sheetController,
      initialChildSize: _sheetPosition,
      minChildSize: 0.7,
      maxChildSize: 0.9,
      builder: (BuildContext context, scrollController) {
        return Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          child: CustomScrollView(
            controller: scrollController,
            slivers: [
              SliverToBoxAdapter(
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).hintColor,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    height: 4,
                    width: 40,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                  ),
                ),
              ),
              SliverList.list(children: [
                const DailyWorkoutScheduleCard(),
                10.toVSB,
                const UpcomingWorkoutCard(),
                10.toVSB,
                WorkoutTypesCard()
              ])
            ],
          ),
        );
      },
    );
  }
}
