import 'package:flutter/material.dart';

import '../../../../utils/base_constants/base_colors.dart';

class GetBurnPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(0, size.height * 0.9773653);
    path_0.cubicTo(
        0,
        size.height * 0.9773653,
        size.width * 0.1584888,
        size.height * 0.4129562,
        size.width * 0.3254213,
        size.height * 0.4129562);
    path_0.cubicTo(
        size.width * 0.4923547,
        size.height * 0.4129562,
        size.width * 0.6092453,
        size.height * 0.9988219,
        size.width * 0.7761787,
        size.height * 0.9988219);
    path_0.cubicTo(
        size.width * 0.9431120,
        size.height * 0.9988219,
        size.width * 0.9246213,
        size.height * 0.6938676,
        size.width,
        size.height * 0.6938676);
    path_0.lineTo(size.width, size.height * -0.1826484);
    path_0.lineTo(0, size.height * -0.1826484);
    path_0.lineTo(0, size.height * 0.9773653);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.shader =
        const LinearGradient(colors: BaseColors.brandColorList).createShader(
      Rect.fromLTWH(0, 0, size.width, size.height),
    );
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
