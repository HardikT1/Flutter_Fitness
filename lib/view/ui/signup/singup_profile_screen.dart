import 'package:fitness_app/utils/base_constants/base_assets.dart';
import 'package:fitness_app/utils/base_constants/base_extensions.dart';
import 'package:fitness_app/view/ui/signup/signup_components/singup_profile_painter.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../utils/base_constants/base_colors.dart';
import '../../../utils/base_constants/base_strings.dart';
import 'signup_components/signup_profile_form_fields.dart';

class SignUpProfileScreen extends StatelessWidget {
  SignUpProfileScreen({super.key});

  final genderController = TextEditingController();
  final dateOfBirthController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                color: Colors.white,
                child: Stack(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 104, right: 16, left: 16),
                      child: CustomPaint(
                        size: Size(width, width * 0.584),
                        painter: SignUpProfilePainter(),
                      ),
                    ),
                    Center(
                      child: Lottie.asset(BaseAssets.lottieCompleteProfile),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                child: Column(
                  children: [
                    30.toVSB,
                    const Align(
                      alignment: Alignment.center,
                      child: Text(BaseStrings.letsCompleteProfile,
                          style: TextStyle(
                              color: BaseColors.blackColor,
                              fontFamily: BaseStrings.poppins,
                              fontWeight: FontWeight.w700,
                              fontSize: 24)),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Text(BaseStrings.itWillHelp,
                          style: TextStyle(
                              color: BaseColors.primaryGreyColor,
                              fontFamily: BaseStrings.poppins,
                              fontWeight: FontWeight.w400,
                              fontSize: 14)),
                    ),
                    30.toVSB,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: SignUpProfileFormFields(
                        genderController: genderController,
                        dateOfBirthController: dateOfBirthController,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
