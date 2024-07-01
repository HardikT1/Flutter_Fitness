import 'package:fitness_app/bloc/onboarding/onboarding_bloc.dart';
import 'package:fitness_app/bloc/onboarding/onboarding_events.dart';
import 'package:fitness_app/utils/base_constants/base_assets.dart';
import 'package:fitness_app/view/ui/onboarding/onboarding_screen.dart';
import 'package:fitness_app/view/ui/signup/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/onboarding/onboarding_states.dart';
import '../../../models/onboarding_widget_model.dart';
import '../../../utils/base_constants/base_strings.dart';
import '../../../utils/base_constants/box_style.dart';
import '../../../utils/common/common_circular_progress_bar.dart';
import 'component/eat_well_painter.dart';
import 'component/get_burn_painter.dart';
import 'component/improve_sleep_painter.dart';
import 'component/onboarding_item.dart';
import 'component/track_goal_painter.dart';

class OnBoardingTrackGoal extends StatefulWidget {
  const OnBoardingTrackGoal({super.key});

  @override
  State<OnBoardingTrackGoal> createState() => _OnBoardingTrackGoalState();
}

class _OnBoardingTrackGoalState extends State<OnBoardingTrackGoal> {
  final PageController controller = PageController(initialPage: 0);
  double progressPercent = 0.25;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (controller.page == 0.0) {
          Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (context) {
            return OnBoardingScreen();
          }));
        } else {
          controller.animateToPage((controller.page! - 1).toInt(),
              duration: const Duration(milliseconds: 500),
              curve: Curves.decelerate);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: BlocProvider(
          create: (context) => OnboardingBloc(),
          child: BlocBuilder<OnboardingBloc, OnboardingStates>(
            builder: (context, state) {
              return Stack(
                children: [
                  PageView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: controller,
                    onPageChanged: (value) {
                      final updated = ((value == 0
                                  ? 0.25
                                  : value == 1
                                      ? 0.5
                                      : value == 2
                                          ? 0.75
                                          : 1.0)
                              .clamp(0.0, 1.0) *
                          100);
                      setState(() {
                        progressPercent = updated.round() / 100;
                      });
                      BlocProvider.of<OnboardingBloc>(context)
                          .add(OnBoardingPageChangeEvent(value));
                    },
                    children: [
                      onboardingItem(
                          context: context,
                          onboardingPage: OnboardingWidgetModel(
                            pageIndex: 0,
                            title: BaseStrings.txtTrackYourGoalTitle,
                            desc: BaseStrings.txtTrackYourGoalContent,
                            decoration: TrackGoalPainter(),
                          ),
                          heightCalculation: 0.98,
                          animationAssets: BaseAssets.lottieTrackYourGoal,
                          controller: controller),
                      onboardingItem(
                          context: context,
                          onboardingPage: OnboardingWidgetModel(
                            pageIndex: 1,
                            title: BaseStrings.txtGetBurnTitle,
                            desc: BaseStrings.txtGetBurnContent,
                            decoration: GetBurnPainter(),
                          ),
                          heightCalculation: 0.584,
                          animationAssets: BaseAssets.lottieGetBurn,
                          controller: controller),
                      onboardingItem(
                          context: context,
                          onboardingPage: OnboardingWidgetModel(
                            pageIndex: 2,
                            title: BaseStrings.txtEatWellTitle,
                            desc: BaseStrings.txtEatWellContent,
                            decoration: EatWellPainter(),
                          ),
                          heightCalculation: 0.85,
                          animationAssets: BaseAssets.lottieEatWell,
                          controller: controller),
                      onboardingItem(
                          context: context,
                          onboardingPage: OnboardingWidgetModel(
                            pageIndex: 3,
                            title: BaseStrings.txtImproveSleepTitle,
                            desc: BaseStrings.txtImproveSleepContent,
                            decoration: ImproveSleepPainter(),
                          ),
                          heightCalculation: 0.9253333333333333,
                          animationAssets: BaseAssets.lottieImproveSleep,
                          controller: controller),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 32.0, bottom: 40.0),
                      child: GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        child: Stack(
                          children: [
                            Positioned.fill(
                                child: CircleProgressBar(
                              value: progressPercent,
                              animationDuration: const Duration(seconds: 1),
                            )),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: BaseBoxStyles
                                    .commonGradientBoxDecoration
                                    .copyWith(
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                child: const Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        onTap: () {
                          final updated =
                              ((progressPercent + 0.25).clamp(0.0, 1.0) * 100);
                          setState(() {
                            progressPercent = updated.round() / 100;
                          });
                          state.pageIndex == 3
                              ? Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(builder: (context) {
                                  return SignUpScreen();
                                }))
                              : controller.animateToPage(state.pageIndex! + 1,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.decelerate);
                        },
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
