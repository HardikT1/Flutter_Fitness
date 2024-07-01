import 'package:flutter/material.dart';
import '../base_constants/base_strings.dart';

class TextView extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final TextOverflow? textOverflow;
  final int? maxLines;
  final double? height;
  final Color? textColor;
  final Color? color;
  final Color? backgroundColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final double? letterSpacing;
  final double? wordSpacing;
  final List<Shadow>? shadows;
  final TextDecoration? textDecoration;
  final String? fontFamily;
  final bool? softWrap;
  final TextStyle? textStyle;

  const TextView(
    this.text, {
    super.key,
    this.textAlign,
    this.textOverflow,
    this.softWrap,
    this.maxLines,
    this.height,
    this.textColor,
    this.color,
    this.backgroundColor,
    this.fontSize = 14.0,
    this.fontWeight,
    this.fontStyle,
    this.letterSpacing,
    this.wordSpacing,
    this.shadows,
    this.textDecoration,
    this.fontFamily = BaseStrings.poppins,
    this.textStyle,
    this.textDirection,
  });

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: textAlign,
        overflow: textOverflow,
        maxLines: maxLines,
        softWrap: softWrap,
        textDirection: textDirection,
        style: textStyle ??
            Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontStyle: fontStyle ?? FontStyle.normal,
                  color: color,
                  letterSpacing: letterSpacing ?? 0.1,
                  fontWeight: fontWeight,
                  fontFamily: BaseStrings.poppins,
                  height: height,
                  fontSize: fontSize,
                ));
  }
}
