import 'package:fitness_app/utils/base_constants/base_assets.dart';
import 'package:fitness_app/utils/base_constants/base_colors.dart';
import 'package:fitness_app/utils/base_constants/base_extensions.dart';
import 'package:flutter/material.dart';

import '../enum/direction.dart';
import '../widgets/text_view.dart';

class CustomFormButton extends StatelessWidget {
  final String? buttonText;
  final VoidCallback? onPressed;
  final bool? iconShow;
  final bool? buttonEnabled;
  final Direction? iconDirection;
  final TextStyle? btnTextStyle;
  final double? height;

  const CustomFormButton(
      {super.key,
      this.buttonText,
      this.onPressed,
      this.iconShow = false,
      this.btnTextStyle = const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: BaseColors.whiteColor),
      this.height,
      this.buttonEnabled = true,
      this.iconDirection = Direction.left});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Material(
        color: Colors.transparent,
        child: InkWell(
          splashFactory: NoSplash.splashFactory,
          highlightColor: Colors.transparent,
          onTap: buttonEnabled == true ? onPressed : null,
          child: Container(
            height: height ?? size.height * 0.07,
            decoration: BoxDecoration(
              gradient: buttonEnabled == true
                  ? const LinearGradient(colors: BaseColors.brandColorList)
                  : LinearGradient(colors: [
                      BaseColors.primaryGreyColor.withOpacity(0.7),
                      BaseColors.primaryGreyColor.withOpacity(0.7)
                    ]),
              borderRadius: BorderRadius.circular(60),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: buttonEnabled == true
                      ? Color.fromRGBO(149, 173, 254, 0.3)
                      : BaseColors.secondaryGreyColor,
                  blurRadius: 22,
                  offset: Offset(0, 10),
                )
              ],
            ),
            child: Align(
              alignment: Alignment.center,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    iconShow == true
                        ? iconDirection == Direction.left
                            ? Image.asset(
                                BaseAssets.loginIcon,
                                color: buttonEnabled == true
                                    ? BaseColors.whiteColor
                                    : BaseColors.whiteColor.withOpacity(0.7),
                                height: 20,
                              )
                            : Container()
                        : Container(),
                    8.toHSB,
                    Center(
                      child: TextView(buttonText ?? '',
                          textStyle: btnTextStyle?.copyWith(
                              color: buttonEnabled == true
                                  ? BaseColors.whiteColor
                                  : BaseColors.whiteColor.withOpacity(0.7))),
                    ),
                    8.toHSB,
                    iconShow == true
                        ? iconDirection == Direction.right
                            ? Icon(
                                Icons.arrow_forward_ios,
                                color: buttonEnabled == true
                                    ? BaseColors.whiteColor
                                    : BaseColors.whiteColor.withOpacity(0.7),
                                size: 20,
                              )
                            : Container()
                        : Container()
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
