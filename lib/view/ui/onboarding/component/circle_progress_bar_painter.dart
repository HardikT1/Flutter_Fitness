import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../../utils/base_constants/base_colors.dart';

// Draws the progress bar.
class CircleProgressBarPainter extends CustomPainter {
  final double percentage;
  final double strokeWidth;

  CircleProgressBarPainter({
    required this.percentage,
    this.strokeWidth = 2,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Offset center = size.center(Offset.zero);
    final Size constrainedSize = size;
    final shortestSide =
        math.min(constrainedSize.width, constrainedSize.height);
    final foregroundPaint = Paint()
      ..color = Colors.red
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    foregroundPaint.shader =
        const LinearGradient(colors: BaseColors.brandColorList).createShader(
      Rect.fromLTWH(0, 0, size.width, size.height),
    );
    final radius = (shortestSide / 2);

    // Start at the top. 0 radians represents the right edge
    const double startAngle = -(2 * math.pi * 0.25);
    final double sweepAngle = (2 * math.pi * (percentage));
    final backgroundPaint = Paint()
      ..color = BaseColors.borderColor
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;
    canvas.drawCircle(center, radius, backgroundPaint);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      foregroundPaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    final oldPainter = (oldDelegate as CircleProgressBarPainter);
    return oldPainter.percentage != percentage ||
        oldPainter.strokeWidth != strokeWidth;
  }
}
