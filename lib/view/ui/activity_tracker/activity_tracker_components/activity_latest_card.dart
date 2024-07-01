import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/base_constants/base_colors.dart';
import '../../../../utils/base_constants/base_strings.dart';
import '../../../../utils/base_constants/text_style.dart';
import 'const_notification_tracker_activity.dart';
import 'custom_notification_list.dart';

class ActivityLatestCard extends StatefulWidget {
  const ActivityLatestCard({super.key});

  @override
  State<ActivityLatestCard> createState() => _ActivityLatestCardState();
}

class _ActivityLatestCardState extends State<ActivityLatestCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(BaseStrings.latestActivity,
                  style: BaseTextStyles.textFieldStyle.copyWith(
                      color: BaseColors.blackColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600)),
              Text(
                BaseStrings.seeMore,
                style: BaseTextStyles.textFieldStyle.copyWith(
                    fontSize: 12.sp, color: BaseColors.secondaryGreyColor),
              )
            ],
          ),
          Padding(
              padding: const EdgeInsets.only(top: 15),
              child: CustomNotificationList(
                  dataList: NotificationActivityTracker.notification))
        ],
      ),
    );
  }
}
