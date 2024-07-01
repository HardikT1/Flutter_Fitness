import 'package:flutter/cupertino.dart';

import '../../../../utils/base_constants/base_colors.dart';

class ImproveSleepPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(0, size.height * 0.3417839);
    path_0.cubicTo(
        0,
        size.height * 0.3417839,
        size.width * 0.03688880,
        size.height * 0.2202850,
        size.width * 0.1139555,
        size.height * 0.2518098);
    path_0.cubicTo(
        size.width * 0.2214221,
        size.height * 0.2956945,
        size.width * 0.4968880,
        size.height * 0.9975735,
        size.width * 0.7859547,
        size.height * 0.9975735);
    path_0.cubicTo(size.width * 0.9341333, size.height * 0.9975735, size.width,
        size.height * 0.8749251, size.width, size.height * 0.8749251);
    path_0.lineTo(size.width, size.height * -0.07780980);
    path_0.lineTo(0, size.height * -0.07780980);
    path_0.lineTo(0, size.height * 0.3417839);
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
