import 'package:flutter/cupertino.dart';

class WelcomeCustomePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.4763561, size.height * 0.9992287);
    path_0.cubicTo(
        size.width * 0.7389209,
        size.height * 0.9992287,
        size.width * 0.9528058,
        size.height * 0.9087099,
        size.width * 0.9950036,
        size.height * 0.6561809);
    path_0.cubicTo(
        size.width * 1.037201,
        size.height * 0.4036519,
        size.width * 0.6722806,
        size.height * 0.5212526,
        size.width * 0.6790647,
        size.height * 0.2922990);
    path_0.cubicTo(
        size.width * 0.6858489,
        size.height * 0.06344164,
        size.width * 0.6054424,
        size.height * -0.06959317,
        size.width * 0.3852734,
        size.height * 0.03778157);
    path_0.cubicTo(
        size.width * 0.1651061,
        size.height * 0.1451563,
        size.width * 0.1984255,
        size.height * 0.3712662,
        size.width * 0.1659040,
        size.height * 0.4761809);
    path_0.cubicTo(
        size.width * 0.1026568,
        size.height * 0.6797577,
        size.width * -0.2460018,
        size.height * 0.9992287,
        size.width * 0.4763561,
        size.height * 0.9992287);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = const Color(0xff98BFFD).withOpacity(1.0);
    canvas.drawPath(path_0, paint0Fill);

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.1388655, size.height * 0.4979659);
    path_1.cubicTo(
        size.width * 0.1619626,
        size.height * 0.4371092,
        size.width * 0.1589622,
        size.height * 0.3803447,
        size.width * 0.1321640,
        size.height * 0.3711809);
    path_1.cubicTo(
        size.width * 0.1053662,
        size.height * 0.3620205,
        size.width * 0.06491799,
        size.height * 0.4039283,
        size.width * 0.04182086,
        size.height * 0.4647850);
    path_1.cubicTo(
        size.width * 0.01872388,
        size.height * 0.5256451,
        size.width * 0.02172414,
        size.height * 0.5824061,
        size.width * 0.04852230,
        size.height * 0.5915700);
    path_1.cubicTo(
        size.width * 0.07532014,
        size.height * 0.6007304,
        size.width * 0.1157683,
        size.height * 0.5588225,
        size.width * 0.1388655,
        size.height * 0.4979659);
    path_1.close();

    Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.color = const Color(0xff98BFFD).withOpacity(1.0);
    canvas.drawPath(path_1, paint1Fill);

    Path path_2 = Path();
    path_2.moveTo(size.width * 0.9056799, size.height * 0.3766928);
    path_2.cubicTo(
        size.width * 0.9400324,
        size.height * 0.3481980,
        size.width * 0.9347842,
        size.height * 0.2891549,
        size.width * 0.8939568,
        size.height * 0.2448160);
    path_2.cubicTo(
        size.width * 0.8531295,
        size.height * 0.2004771,
        size.width * 0.7921871,
        size.height * 0.1876331,
        size.width * 0.7578345,
        size.height * 0.2161287);
    path_2.cubicTo(
        size.width * 0.7234820,
        size.height * 0.2446239,
        size.width * 0.7287338,
        size.height * 0.3036676,
        size.width * 0.7695612,
        size.height * 0.3480068);
    path_2.cubicTo(
        size.width * 0.8103849,
        size.height * 0.3923447,
        size.width * 0.8713309,
        size.height * 0.4051877,
        size.width * 0.9056799,
        size.height * 0.3766928);
    path_2.close();

    Paint paint2Fill = Paint()..style = PaintingStyle.fill;
    paint2Fill.color = const Color(0xff98BFFD).withOpacity(1.0);
    canvas.drawPath(path_2, paint2Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
