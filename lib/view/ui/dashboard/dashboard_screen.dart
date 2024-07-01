import 'package:fitness_app/utils/base_constants/base_assets.dart';
import 'package:fitness_app/utils/base_constants/base_colors.dart';
import 'package:fitness_app/utils/base_constants/base_extensions.dart';
import 'package:fitness_app/utils/base_constants/base_strings.dart';
import 'package:fitness_app/utils/widgets/text_view.dart';
import 'package:fitness_app/view/ui/camera/camera_screen.dart';
import 'package:fitness_app/view/ui/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/widgets/bottom_navigation_bar.dart';
import '../activity_tracker/activity_tracker.dart';
import '../meal/meal_dashboard.dart';
import '../profile/profile_screen.dart';
import '../workout_tracker/workout_tracker.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBody: true,
      body: _buildBody(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Card(
          elevation: 10,
          color: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          borderOnForeground: false,
          shadowColor: Colors.transparent,
          child: Container(
            height: 60.h,
            width: 60.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: BaseColors.floatingShadowColor,
                    blurRadius: 22,
                    offset: Offset(0, 10)),
              ],
              gradient: LinearGradient(
                  colors: BaseColors.brandColorList,
                  begin: Alignment.topLeft,
                  end: Alignment.topRight,
                  tileMode: TileMode.clamp),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: InkWell(
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return SizedBox(
                          height: size.height * 0.19,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                10.toVSB,
                                Flexible(
                                  child: ListTile(
                                    leading: const Icon(Icons.set_meal),
                                    title: const TextView(
                                      BaseStrings.mealPlannerText,
                                      textStyle: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: BaseColors.blackColor),
                                    ),
                                    onTap: () {
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const MealDashboard()));
                                    },
                                  ),
                                ),
                                const Divider(
                                    height: 1,
                                    color: BaseColors.lightGreyColor),
                                Flexible(
                                  child: ListTile(
                                    leading: const Icon(Icons.track_changes),
                                    title: const TextView(
                                      BaseStrings.workoutText,
                                      textStyle: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: BaseColors.blackColor),
                                    ),
                                    onTap: () {
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const WorkoutTracker()));
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                },
                child: Image.asset(
                  BaseAssets.searchIcon,
                  height: 20.h,
                  width: 20.w,
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: size.height * 0.07,
        color: BaseColors.whiteColor,
        child: BottomNavigationBarTab(
          onTap: (index) {
            if (index != 2) {
              setState(() {
                _currentIndex = index;
              });
            }
          },
          currentIndex: _currentIndex,
        ),
      ),
    );
  }

  Widget _buildBody() {
    switch (_currentIndex) {
      case 0:
        return const HomeScreen();
      case 1:
        return const ActivityTracker();
      case 2:
        return Container();
      case 3:
        return const CameraScreen();
      case 4:
        return const ProfileScreen();
      default:
        return Container();
    }
  }
}
