import 'package:fitness_app/utils/base_constants/base_extensions.dart';
import 'package:fitness_app/utils/base_constants/base_strings.dart';
import 'package:fitness_app/utils/base_constants/text_style.dart';
import 'package:fitness_app/view/ui/Dashboard/dashboard_screen.dart';
import 'package:fitness_app/view/ui/signup/painter/welcomecustompainter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:lottie/lottie.dart';

import '../../../utils/base_constants/base_colors.dart';
import '../../../utils/common/custom_form_button.dart';

class WelcomeUserScreen extends StatefulWidget {
  const WelcomeUserScreen({super.key});

  @override
  State<WelcomeUserScreen> createState() => _WelcomeUserScreenState();
}

class _WelcomeUserScreenState extends State<WelcomeUserScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width; // Gives the width
    double height = MediaQuery.of(context).size.height;
    FlutterNativeSplash.remove();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Color(0x00000000)),
    );
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                height: height * 0.6,
                width: width,
                child: Stack(
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: height * 0.5,
                          width: width * 0.8,
                          child: CustomPaint(
                            painter: WelcomeCustomePainter(),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      // Adjust position as needed
                      child: Lottie.asset(
                        'assets/jsons/welcomeback.json',
                        width: width * 0.7, // Adjust size as needed
                        height: height * 0.5, // Adjust size as needed
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Text(BaseStrings.welcomeback,
              style: BaseTextStyles.textFieldStyle
                  .copyWith(fontSize: 30, fontWeight: FontWeight.w700)),
          5.toVSB,
          Text(
              textAlign: TextAlign.center,
              BaseStrings.subwelcome,
              style: BaseTextStyles.textFieldStyle.copyWith(
                  color: BaseColors.primaryGreyColor,
                  fontWeight: FontWeight.w400)),
          102.toVSB,
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
                width: width * 0.8,
                child: CustomFormButton(
                  buttonText: BaseStrings.homebtn,
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const DashboardScreen()));
                  },
                )),
          )
        ],
      ),
    );
  }
}
