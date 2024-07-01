import 'package:flutter/material.dart';

import '../../../../utils/base_constants/base_colors.dart';

class TrackGoalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width, size.height * 0.5835000);
    path_0.cubicTo(
        size.width,
        size.height * 0.5835000,
        size.width * 0.8078213,
        size.height * 0.9849606,
        size.width * 0.5096000,
        size.height * 0.9987685);
    path_0.cubicTo(size.width * 0.2113779, size.height * 1.012574, 0,
        size.height * 0.8633300, 0, size.height * 0.8633300);
    path_0.lineTo(0, size.height * -0.09113300);
    path_0.lineTo(size.width, size.height * -0.09113300);
    path_0.lineTo(size.width, size.height * 0.5835000);
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
