import 'package:fitness_app/utils/base_constants/base_colors.dart';
import 'package:fitness_app/utils/base_constants/base_extensions.dart';
import 'package:fitness_app/utils/common/svg_image.dart';
import 'package:fitness_app/view/ui/home/Home_components/icon_btn_with_background.dart';
import 'package:fitness_app/view/ui/home/Home_components/workout_progress_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../utils/base_constants/base_assets.dart';
import '../../../utils/base_constants/base_strings.dart';
import '../../../utils/widgets/text_view.dart';
import '../notification/notification_screen.dart';
import 'Home_components/activity_status_card.dart';
import 'Home_components/bmi_card.dart';
import 'Home_components/calories_card.dart';
import 'Home_components/latest_activity_card.dart';
import 'Home_components/sleep_card.dart';
import 'Home_components/today_target_card.dart';
import 'Home_components/water_intake_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BaseColors.whiteColor,
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        toolbarHeight: 70,
        // Set this height
        scrolledUnderElevation: 0.0,
        automaticallyImplyLeading: false,
        systemOverlayStyle: const SystemUiOverlayStyle(
          // Status bar brightness (optional)
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
        ),
        foregroundColor: BaseColors.whiteColor,
        flexibleSpace: Container(
          color: BaseColors.whiteColor,
          child: Padding(
            padding: const EdgeInsets.only(left: 25, top: 28, right: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      20.toVSB,
                      const TextView(
                        BaseStrings.welcomeBack,
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        color: BaseColors.secondaryGreyColor,
                      ),
                      3.toVSB,
                      const TextView(
                        BaseStrings.personName,
                        color: BaseColors.blackColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const NotificationScreen(),
                    ));
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: IconBtnWithBackground(
                      icon: SvgImage(
                        image: BaseAssets.notificationSvgImage,
                        boxFits: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(child: _body(context)),
      ),
    );
  }

  Widget _body(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const BmiCard(),
        const TodayTargetCard(),
        30.toVSB,
        const ActivityStatusCard(),
        10.toVSB,
        SizedBox(
          height: size.height * 0.50,
          width: size.width,
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(child: WaterIntakeCard()),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: SleepCard(),
                      ),
                      Expanded(
                        child: CaloriesCard(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        10.toVSB,
        const WorkoutProgressCard(),
        10.toVSB,
        const LatestWorkoutCard(),
        10.toVSB,
      ],
    );
  }
}
