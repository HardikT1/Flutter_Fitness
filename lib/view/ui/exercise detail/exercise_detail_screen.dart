import 'package:fitness_app/utils/base_constants/text_style.dart';
import 'package:fitness_app/utils/common/custom_appbar.dart';
import 'package:fitness_app/utils/widgets/text_view.dart';
import 'package:fitness_app/view/ui/exercise%20detail/exercise_detail_helper.dart';
import 'package:fitness_app/view/ui/exercise%20detail/stepper_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

import '../../../utils/base_constants/base_colors.dart';
import '../../../utils/base_constants/base_strings.dart';
import '../home/Home_components/stepper/another_stepper.dart';

class ExerciseDetailScreen extends StatefulWidget {
  const ExerciseDetailScreen({super.key});

  @override
  State<ExerciseDetailScreen> createState() => _ExerciseDetailScreenState();
}

class _ExerciseDetailScreenState extends State<ExerciseDetailScreen> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;
  final bool _isImageDisplayed = true;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset("assets/videos/video1.mp4")
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "", isCross: false),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 30.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ExerciseDetailHelper.singleton.videoPlayer(
                  controller: _controller,
                  isPlaying: _isPlaying,
                  isImageDisplayed: _isImageDisplayed,
                  onTap: () {
                    setState(() {
                      _isPlaying = true;
                      _controller.play();
                    });
                  }),
              Padding(
                padding: EdgeInsets.only(top: 20.h),
                child: TextView(
                  BaseStrings.jumping,
                  textStyle: BaseTextStyles.textFieldStyle.copyWith(
                    color: BaseColors.blackColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5.h),
                child: TextView(
                  BaseStrings.jumpingSubTitle,
                  textStyle: BaseTextStyles.textFieldStyle.copyWith(
                    color: BaseColors.primaryGreyColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30.h),
                child: TextView(
                  BaseStrings.exercisedescription,
                  textStyle: BaseTextStyles.textFieldStyle.copyWith(
                    color: BaseColors.blackColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.h),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isExpanded = !isExpanded;
                    });
                  },
                  child: RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: isExpanded
                              ? BaseStrings.exercisedescriptionDetails
                              : (BaseStrings.exercisedescriptionDetails.length >
                                      100
                                  ? BaseStrings.exercisedescriptionDetails
                                      .substring(0, 100)
                                  : BaseStrings.exercisedescriptionDetails),
                          style: BaseTextStyles.textFieldStyle.copyWith(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: BaseColors.secondaryGreyColor,
                          ),
                        ),
                        if (!isExpanded &&
                            BaseStrings.exercisedescriptionDetails.length > 100)
                          TextSpan(
                            text: '... ', // Ellipsis to indicate truncated text
                            style: BaseTextStyles.textFieldStyle.copyWith(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: BaseColors.secondaryGreyColor,
                            ),
                          ),
                        if (!isExpanded &&
                            BaseStrings.exercisedescriptionDetails.length > 100)
                          TextSpan(
                            text: BaseStrings.descReadMore,
                            style: BaseTextStyles.textFieldStyle.copyWith(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xff9DCEFF),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                /*  child: TextView(
                    BaseStrings.exercisedescriptionDetails,
                    textStyle: BaseTextStyles.textFieldStyle.copyWith(
                      color: BaseColors.primaryGreyColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),*/
              ),
              Padding(
                padding: EdgeInsets.only(top: 30.h),
                child: ExerciseDetailHelper.steps,
              ),
              AnotherStepper(
                showGradient: true,
                stepperList: StepperDetails.stepperData,
                stepperDirection: Axis.vertical,
                iconHeight: 24.h,
                iconWidth: 24.w,
                activeIndex: 1,
                verticalGap: 50.h,
                activeBarColor: Colors.transparent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
