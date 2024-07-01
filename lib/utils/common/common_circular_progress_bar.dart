import 'package:flutter/material.dart';

import '../../view/ui/onboarding/component/circle_progress_bar_painter.dart';

/// Draws a circular animated progress bar.
class CircleProgressBar extends StatefulWidget {
  final Duration animationDuration;
  final double value;

  const CircleProgressBar({
    super.key,
    required this.animationDuration,
    required this.value,
  });

  @override
  CircleProgressBarState createState() {
    return CircleProgressBarState();
  }
}

class CircleProgressBarState extends State<CircleProgressBar>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;

  Animation<double>? curve;
  Tween<double>? valueTween;
  ColorTween? backgroundColorTween;
  ColorTween? foregroundColorTween;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );

    curve = CurvedAnimation(
      parent: _controller!,
      curve: Curves.easeInOut,
    );

    valueTween = Tween<double>(
      begin: 0,
      end: widget.value,
    );

    _controller?.forward();
  }

  @override
  void didUpdateWidget(CircleProgressBar oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.value != oldWidget.value) {
      double beginValue = valueTween?.evaluate(curve!) ?? oldWidget.value;

      valueTween = Tween<double>(
        begin: beginValue,
        end: widget.value,
      );

      _controller
        ?..value = 0
        ..forward();
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: AnimatedBuilder(
        animation: curve!,
        child: Container(),
        builder: (context, child) {
          return CustomPaint(
            foregroundPainter: CircleProgressBarPainter(
              percentage: valueTween!.evaluate(curve!),
              strokeWidth: 4,
            ),
            child: child,
          );
        },
      ),
    );
  }
}
