import 'package:flutter/material.dart';

import '../../../../utils/base_constants/base_colors.dart';

class EatWellPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(0, size.height * 0.4762059);
    path_0.cubicTo(
        0,
        size.height * 0.4762059,
        size.width * 0.05973333,
        size.height * 0.4843043,
        size.width * 0.1202667,
        size.height * 0.6726293);
    path_0.cubicTo(
        size.width * 0.1808000,
        size.height * 0.8609519,
        size.width * 0.3488000,
        size.height,
        size.width * 0.5679120,
        size.height);
    path_0.cubicTo(size.width * 0.7870213, size.height, size.width,
        size.height * 0.7380252, size.width, size.height * 0.5676545);
    path_0.lineTo(size.width, size.height * -0.004576659);
    path_0.lineTo(0, size.height * -0.004576659);
    path_0.lineTo(0, size.height * 0.4762059);
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
