import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgImage extends StatelessWidget {
  final String? image;

  final double? width;

  final double? height;

  final BoxFit? boxFits;

  const SvgImage(
      {super.key,
      this.image,
      this.width,
      this.height,
      this.boxFits = BoxFit.cover});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      image ?? '',
      width: width,
      height: height,
      fit: boxFits!,
    );
  }
}
