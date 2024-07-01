import 'package:fitness_app/utils/base_constants/base_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:video_player/video_player.dart';

import '../../../utils/base_constants/base_strings.dart';
import '../../../utils/base_constants/text_style.dart';
import '../../../utils/widgets/text_view.dart';

class ExerciseDetailHelper {
  ExerciseDetailHelper._internal();

  static final ExerciseDetailHelper singleton =
      ExerciseDetailHelper._internal();

  Widget videoPlayer({
    required VideoPlayerController controller,
    required bool isPlaying,
    required VoidCallback onTap,
    required bool isImageDisplayed,
  }) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Placeholder image
        controller.value.isPlaying == false
            ? GestureDetector(
                onTap: onTap,
                child: Container(
                  height: 150.h,
                  width: 315.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  // Add your placeholder image here
                  child: SvgPicture.asset(
                    'assets/videos/Video-Section.svg',
                    fit: BoxFit.cover,
                  ),
                ),
              )
            : Container(
                height: 150.h,
                width: 315.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: AspectRatio(
                        aspectRatio: controller.value.aspectRatio,
                        child: VideoPlayer(controller)))),
        // Video player
        VideoControlButtons(controller: controller),
      ],
    );
  }

  static Widget steps = Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      TextView(BaseStrings.howToDo,
          textStyle: BaseTextStyles.textFieldStyle.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 16.sp,
              color: BaseColors.blackColor)),
      TextView(
        BaseStrings.exercisesteps,
        textStyle: BaseTextStyles.textFieldStyle.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 12.sp,
            color: BaseColors.primaryGreyColor),
      )
    ],
  );
}

class VideoControlButtons extends StatelessWidget {
  final VideoPlayerController controller;

  const VideoControlButtons({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        if (controller.value.isPlaying) {
          controller.pause();
        } else {
          controller.play();
        }
        // Update the state of the parent widget (_ExerciseDetailScreenState)
        // to reflect the current state of video playback.
        (context as Element).markNeedsBuild();
      },
      icon: Icon(
        controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        color: BaseColors.whiteColor,
        size: 40.sp,
      ),
    );
  }
}
