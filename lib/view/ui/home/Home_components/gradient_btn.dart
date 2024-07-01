import 'package:flutter/material.dart';
import '../../../../utils/base_constants/base_colors.dart';
import '../../../../utils/widgets/text_view.dart';

class GradientBtn extends StatelessWidget {
  final String? btnText;
  final TextStyle? textStyle;
  final LinearGradient? colorGradient;
  final double? height;
  final double? width;
  final VoidCallback? onPressed;

  const GradientBtn(
      {super.key,
      this.btnText,
      this.textStyle,
      this.colorGradient,
      this.height,
      this.width,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height ?? size.height * 0.05,
        width: width,
        decoration: BoxDecoration(
          gradient: colorGradient ??
              const LinearGradient(
                  colors: BaseColors.secondaryColorList,
                  end: Alignment.bottomCenter,
                  begin: Alignment.topRight),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Center(
            child: TextView(btnText ?? '', textStyle: textStyle),
          ),
        ),
      ),
    );
  }
}
