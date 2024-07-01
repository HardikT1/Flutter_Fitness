import 'dart:ui';

import 'package:fitness_app/utils/base_constants/base_colors.dart';
import 'package:fitness_app/utils/base_constants/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../models/activity_tracker/activity_tracker_model_chart.dart';
import '../../../../utils/base_constants/base_strings.dart';
import '../../../../utils/common/common_dropdown.dart';

class ActivityProgressCard extends StatelessWidget {
  const ActivityProgressCard({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final List<ActivityTrackerModelChart> chartData = [
      ActivityTrackerModelChart(x: "Sun", y: 80),
      ActivityTrackerModelChart(x: "Mon", y: 20),
      ActivityTrackerModelChart(x: "Tue", y: 30),
      ActivityTrackerModelChart(x: "wed", y: 40),
      ActivityTrackerModelChart(x: "thu", y: 50),
      ActivityTrackerModelChart(x: "fri", y: 60),
      ActivityTrackerModelChart(x: "sat", y: 85),
    ];

    return Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(BaseStrings.progress,
                    style: BaseTextStyles.textFieldStyle.copyWith(
                        color: BaseColors.blackColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600)),
                CommonDropdown(
                  height: size.height * 0.04,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Card(
                elevation: 5,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: BaseColors.whiteColor,
                  ),
                  child: SfCartesianChart(
                    backgroundColor: Colors.transparent,
                    primaryXAxis: CategoryAxis(
                      majorTickLines: const MajorTickLines(size: 0),
                      majorGridLines: const MajorGridLines(width: 0),
                      axisLine: const AxisLine(color: Colors.transparent),
                      labelStyle: BaseTextStyles.textFieldStyle.copyWith(
                          color: BaseColors.primaryGreyColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400),
                    ),
                    primaryYAxis: const NumericAxis(
                      isVisible: false,
                    ),
                    plotAreaBorderColor: Colors.transparent,
                    borderWidth: 0,
                    series: <CartesianSeries<ActivityTrackerModelChart,
                        String>>[
                      ColumnSeries<ActivityTrackerModelChart, String>(
                        dataSource: chartData,
                        onCreateRenderer:
                            (ChartSeries<ActivityTrackerModelChart, String>
                                series) {
                          return _CustomColumnSeriesRenderer();
                        },
                        isTrackVisible: true,
                        trackColor: BaseColors.borderColor,
                        xValueMapper: (ActivityTrackerModelChart data, _) =>
                            data.x,
                        yValueMapper: (ActivityTrackerModelChart data, _) =>
                            data.y,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                        gradient: const LinearGradient(
                            colors: BaseColors.brandColorList),
                        /*pointColorMapper: (ActivityTrackerModelChart data, _) {
                          var i = chartData.indexOf(data);
                          return i % 2 == 0 ? Colors.red : Colors.blue;
                        },*/
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}

class _CustomColumnSeriesRenderer<T, D> extends ColumnSeriesRenderer<T, D> {
  _CustomColumnSeriesRenderer();

  @override
  ColumnSegment<T, D> createSegment() {
    return _ColumnCustomPainter();
  }
}

class _ColumnCustomPainter<T, D> extends ColumnSegment<T, D> {
  @override
  void onPaint(Canvas canvas) {
    Paint? myPaint = fillPaint;
    if (currentSegmentIndex % 2 == 0) {
      myPaint = fillPaint;
    } else {
      myPaint = fillPaint
        ..shader = LinearGradient(colors: BaseColors.secondaryColorList)
            .createShader(Rect.fromLTRB(segmentRect!.left, segmentRect!.top,
                segmentRect!.right, segmentRect!.bottom));
    }
    final backgroundPaint = Paint()
      ..color = BaseColors.borderColor
      ..strokeWidth = 1
      ..style = PaintingStyle.fill;
    canvas.drawRRect(
        RRect.fromLTRBAndCorners(segmentRect!.left, animationFactor,
            segmentRect!.right, segmentRect!.bottom,
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20)),
        backgroundPaint);
    if (segmentRect != null) {
      final top =
          lerpDouble(segmentRect!.bottom, segmentRect!.top, animationFactor)!;
      final RRect rect = RRect.fromLTRBAndCorners(
          segmentRect!.left, top, segmentRect!.right, segmentRect!.bottom,
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20));
      canvas.drawRRect(rect, myPaint);
    }
  }
}
