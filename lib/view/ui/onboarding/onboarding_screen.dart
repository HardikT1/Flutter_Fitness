import 'package:fitness_app/utils/base_constants/base_extensions.dart';
import 'package:fitness_app/utils/base_constants/base_strings.dart';
import 'package:fitness_app/utils/base_constants/box_style.dart';
import 'package:fitness_app/view/ui/onboarding/onboarding_track_goal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import '../../../utils/base_constants/base_colors.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BaseBoxStyles.commonGradientBoxDecoration,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  RichText(
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: BaseStrings.foody,
                          style: TextStyle(
                              color: BaseColors.blackColor,
                              fontSize: 36,
                              fontWeight: FontWeight.w700),
                        ),
                        TextSpan(
                            text: BaseStrings.fit,
                            style: TextStyle(
                                color: BaseColors.whiteColor,
                                fontSize: 36,
                                fontWeight: FontWeight.w700)),
                        TextSpan(
                            text: BaseStrings.ness,
                            style: TextStyle(
                                color: BaseColors.whiteColor,
                                fontSize: 36,
                                fontWeight: FontWeight.w700)),
                      ],
                    ),
                  ),
                  8.toVSB,
                  const Text(
                    BaseStrings.appTagLine,
                    style: TextStyle(
                        color: BaseColors.primaryGreyColor,
                        fontFamily: BaseStrings.poppins,
                        fontWeight: FontWeight.w400,
                        fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 32.0, left: 32, bottom: 40),
              child: ElevatedButton(
                style: ButtonStyle(
                  elevation: MaterialStateProperty.resolveWith<double>(
                    (Set<MaterialState> states) {
                      return 0.0;
                    },
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OnBoardingTrackGoal(),
                    ),
                  );
                },
                child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: ShaderMask(
                      blendMode: BlendMode.srcIn,
                      shaderCallback: (bounds) => const LinearGradient(
                              colors: BaseColors.brandColorList)
                          .createShader(
                        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                      ),
                      child: const Text(
                        BaseStrings.btnTxtGetStarted,
                        style: TextStyle(
                            fontFamily: BaseStrings.poppins,
                            fontWeight: FontWeight.w700),
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
