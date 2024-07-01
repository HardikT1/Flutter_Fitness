import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../utils/base_constants/base_colors.dart';
import '../../../utils/base_constants/text_style.dart';
import 'activity_tracker_components/activity_latest_card.dart';
import 'activity_tracker_components/activity_progress_card.dart';
import 'activity_tracker_components/todays_target_card.dart';

class ActivityTracker extends StatelessWidget {
  const ActivityTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0.0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          // Status bar brightness (optional)
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
        ),
        title: Center(
          child: Text(
            "Activity Tracker",
            style: BaseTextStyles.textFieldStyle.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: BaseColors.blackColor,
            ),
          ),
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            TodaysTargetCard(),
            ActivityProgressCard(),
            ActivityLatestCard()
          ],
        ),
      ),
    );
  }
}
