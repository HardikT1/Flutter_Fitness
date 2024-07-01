import 'package:fitness_app/utils/base_constants/base_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/base_constants/base_assets.dart';
import '../../../../utils/base_constants/base_colors.dart';
import '../../../../utils/base_constants/base_strings.dart';
import '../../../../utils/base_constants/text_style.dart';
import '../../../../utils/common/common_switch.dart';
import '../../../../utils/widgets/text_view.dart';

class NotificationCard extends StatefulWidget {
  const NotificationCard({super.key});

  @override
  State<NotificationCard> createState() => _NotificationCardState();
}

class _NotificationCardState extends State<NotificationCard> {
  @override
  Widget build(BuildContext context) {
    bool switchValue = false;
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Card(
        elevation: 0,
        child: Container(
          decoration: BoxDecoration(
              color: BaseColors.whiteColor,
              boxShadow: [
                BoxShadow(
                  color: BaseColors.lightGreyColor.withOpacity(1.0),
                  offset: const Offset(0.2, 0.2),
                  blurRadius: 10.0,
                ),
              ],
              borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                15.toVSB,
                const TextView(BaseStrings.notification,
                    textStyle: BaseTextStyles.profileTitle),
                15.toVSB,
                Row(
                  children: [
                    Image.asset(
                      BaseAssets.notificationIcon,
                      height: 25,
                      width: 25,
                    ),
                    10.toHSB,
                    const TextView(BaseStrings.popUpNotification,
                        textStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: BaseColors.primaryGreyColor)),
                    const Spacer(),
                    CommonGradientSwitch(
                      isSwitchOn: switchValue,
                      height: 24.h,
                      width: 44.w,
                    ),
                  ],
                ),
                10.toVSB,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
