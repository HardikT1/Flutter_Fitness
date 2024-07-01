import 'package:fitness_app/utils/base_constants/base_assets.dart';
import 'package:fitness_app/utils/base_constants/base_extensions.dart';
import 'package:fitness_app/utils/base_constants/box_style.dart';
import 'package:fitness_app/utils/base_constants/text_style.dart';
import 'package:fitness_app/view/ui/Login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../../bloc/signup_bloc/signup_bloc.dart';
import '../../../../bloc/signup_bloc/signup_event.dart';
import '../../../../bloc/signup_bloc/signup_state.dart';
import '../../../../utils/base_constants/base_colors.dart';
import '../../../../utils/base_constants/base_strings.dart';
import '../../../models/signuponboarding/signuponboarding_model.dart';
import '../../../utils/common/custom_form_button.dart';

class SignupOnBoarding extends StatelessWidget {
  final PageController pageController = PageController();

  SignupOnBoarding({super.key});

  final List<SignupOnBoardingModel> onBoardingSignUpData = [
    SignupOnBoardingModel(
        headertitle: BaseStrings.headerTitleSignup,
        headerdesc: BaseStrings.headerDescTitleSignup,
        images: BaseAssets.lottieImproveShape,
        title: BaseStrings.title1,
        desc: BaseStrings.desc1),
    SignupOnBoardingModel(
        headertitle: BaseStrings.headerTitleSignup,
        headerdesc: BaseStrings.headerDescTitleSignup,
        images: BaseAssets.lottieLeanAndTone,
        title: BaseStrings.title2,
        desc: BaseStrings.desc2),
    SignupOnBoardingModel(
        headertitle: BaseStrings.headerTitleSignup,
        headerdesc: BaseStrings.headerDescTitleSignup,
        images: BaseAssets.lottieLoseaFat,
        title: BaseStrings.title3,
        desc: BaseStrings.desc3),
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width; // Gives the width
    double height = MediaQuery.of(context).size.height;
    FlutterNativeSplash.remove();
    return Scaffold(
      body: BlocProvider(
        create: (context) => SignUpBloc(),
        child: BlocBuilder<SignUpBloc, SignUpInitial>(
          builder: (BuildContext context, SignUpInitial state) {
            return SafeArea(
              child: Container(
                color: BaseColors.whiteColor,
                padding: EdgeInsets.only(top: 40.h),
                child: Stack(
                  children: [
                    PageView.builder(
                      scrollDirection: Axis.horizontal,
                      controller: pageController,
                      itemCount: onBoardingSignUpData.length,
                      onPageChanged: (value) {
                        BlocProvider.of<SignUpBloc>(context)
                            .add(PageChangedEvent(value));
                      },
                      itemBuilder: (context, index) {
                        final data = onBoardingSignUpData[index];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Center(
                              child: Text(data.headertitle!,
                                  style: BaseTextStyles.textFieldStyle.copyWith(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                    color: BaseColors.blackColor,
                                  )),
                            ),
                            5.toVSB,
                            Center(
                              child: Text(
                                data.headerdesc!,
                                textAlign: TextAlign.center,
                                style: BaseTextStyles.textFieldStyle.copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: BaseColors.primaryGreyColor),
                              ),
                            ),
                            50.toVSB,
                            Container(
                              height: height * 0.55,
                              width: width * 0.7,
                              decoration: BaseBoxStyles
                                  .commonGradientBoxDecoration
                                  .copyWith(
                                borderRadius: BorderRadius.circular(22),
                                border: Border.all(
                                    width: 1, color: Colors.transparent),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 250.h,
                                    decoration: const BoxDecoration(
                                        color: Colors.transparent),
                                    child: Center(
                                      child: Lottie.asset(data.images!,
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  20.toVSB,
                                  Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          data.title!,
                                          style: BaseTextStyles.textFieldStyle
                                              .copyWith(
                                                  fontWeight: FontWeight.w600,
                                                  color: BaseColors.whiteColor,
                                                  fontSize: 14),
                                        ),
                                        Container(
                                          // Wrap Divider with Container
                                          width: width * 0.15,
                                          // Set desired width for the divider
                                          height: height * 0.002,
                                          // Set desired height for the divider
                                          color: BaseColors
                                              .whiteColor, // Adjust color as needed
                                        ),
                                        20.toVSB,
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 20, left: 30, right: 30),
                                          child: Text(
                                            data.desc!,
                                            textAlign: TextAlign.center,
                                            style: BaseTextStyles.textFieldStyle
                                                .copyWith(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 12,
                                                    color:
                                                        BaseColors.whiteColor),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                          padding: EdgeInsets.only(bottom: 75.h),
                          child: SizedBox(
                              width: width * 0.8,
                              child: CustomFormButton(
                                buttonText: BaseStrings.cbtn,
                                onPressed: () {
                                  if (state.currentPage ==
                                      onBoardingSignUpData.length - 1) {
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const LoginScreen()),
                                        (route) => false);
                                  }
                                  pageController.nextPage(
                                      duration:
                                          const Duration(microseconds: 500),
                                      curve: Curves.easeInOut);
                                },
                              ))),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
