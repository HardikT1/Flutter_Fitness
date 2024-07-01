import 'package:flutter/material.dart';

import '../../../../utils/base_constants/base_colors.dart';

class SignUpProfilePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.4940344, size.height * 0.9799734);
    path_0.cubicTo(
        size.width * 0.4414241,
        size.height * 0.9674943,
        size.width * 0.3959628,
        size.height * 0.9249240,
        size.width * 0.3428080,
        size.height * 0.9175779);
    path_0.cubicTo(
        size.width * 0.2591140,
        size.height * 0.9060190,
        size.width * 0.1366556,
        size.height * 1.021030,
        size.width * 0.09360172,
        size.height * 0.9246578);
    path_0.cubicTo(
        size.width * 0.04670172,
        size.height * 0.8196768,
        size.width * 0.2155476,
        size.height * 0.7090152,
        size.width * 0.1962682,
        size.height * 0.5895627);
    path_0.cubicTo(
        size.width * 0.1773670,
        size.height * 0.4724487,
        size.width * 0.01227633,
        size.height * 0.4676350,
        size.width * 0.0006694212,
        size.height * 0.3488475);
    path_0.cubicTo(
        size.width * -0.008937335,
        size.height * 0.2505300,
        size.width * 0.08699771,
        size.height * 0.1836981,
        size.width * 0.1518734,
        size.height * 0.1352129);
    path_0.cubicTo(
        size.width * 0.2100140,
        size.height * 0.09176084,
        size.width * 0.2798097,
        size.height * 0.09224297,
        size.width * 0.3464499,
        size.height * 0.09042471);
    path_0.cubicTo(
        size.width * 0.3970602,
        size.height * 0.08904411,
        size.width * 0.4444613,
        size.height * 0.1395490,
        size.width * 0.4940344,
        size.height * 0.1258772);
    path_0.cubicTo(
        size.width * 0.5612980,
        size.height * 0.1073259,
        size.width * 0.6055989,
        size.height * -0.001115179,
        size.width * 0.6742808,
        size.height * 0.000008624487);
    path_0.cubicTo(
        size.width * 0.7392808,
        size.height * 0.001072205,
        size.width * 0.8388395,
        size.height * 0.04488251,
        size.width * 0.8396562,
        size.height * 0.1315323);
    path_0.cubicTo(
        size.width * 0.8408625,
        size.height * 0.2592148,
        size.width * 0.6437765,
        size.height * 0.3238202,
        size.width * 0.6784642,
        size.height * 0.4428479);
    path_0.cubicTo(
        size.width * 0.7211089,
        size.height * 0.5891863,
        size.width * 0.9317163,
        size.height * 0.5142814,
        size.width * 0.9907765,
        size.height * 0.6501027);
    path_0.cubicTo(
        size.width * 1.028742,
        size.height * 0.7374106,
        size.width * 0.9409742,
        size.height * 0.8479125,
        size.width * 0.8823868,
        size.height * 0.9118175);
    path_0.cubicTo(
        size.width * 0.8253983,
        size.height * 0.9739734,
        size.width * 0.7466103,
        size.height * 0.9832357,
        size.width * 0.6736074,
        size.height * 0.9960494);
    path_0.cubicTo(
        size.width * 0.6133725,
        size.height * 1.006624,
        size.width * 0.5538481,
        size.height * 0.9941635,
        size.width * 0.4940344,
        size.height * 0.9799734);
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
