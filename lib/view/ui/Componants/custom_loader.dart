import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../utils/base_constants/base_colors.dart';

class CustomLoader extends StatelessWidget {
  final double size;

  const CustomLoader({
    super.key,
    this.size = 50.0,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const ModalBarrier(
          dismissible: false,
        ),
        Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Center(
            child: SizedBox(
              width: size,
              height: size,
              child: Lottie.asset("assets/images/Loader1.json"),
            ),
          ),
          const Text(
            "Loading",
            style: TextStyle(
                decoration: TextDecoration.none,
                fontSize: 12,
                color: BaseColors.blackColor),
          ),
        ]),
      ],
    );
  }
}
