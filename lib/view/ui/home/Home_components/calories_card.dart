import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../utils/base_constants/base_colors.dart';
import '../../../../utils/base_constants/base_strings.dart';
import '../../../../utils/widgets/text_view.dart';
import 'background_card.dart';

class CaloriesCard extends StatefulWidget {
  const CaloriesCard({super.key});

  @override
  State<CaloriesCard> createState() => _CaloriesCardState();
}

class _CaloriesCardState extends State<CaloriesCard> {
  List<double>? stops = [];
  TooltipBehavior? _tooltipBehavior;

  @override
  void initState() {
    _tooltipBehavior =
        TooltipBehavior(enable: true, format: 'point.x : point.y%');
    stops = <double>[0.3, 0.6];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BackgroundCard(
      width: size.width,
      isGradient: false,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TextView(
                    BaseStrings.calories,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: BaseColors.blackColor,
                  ),
                  TextView(
                    '760 kCal',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: BaseColors.brandColorList[0],
                    maxLines: 1,
                    textOverflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Expanded(
              child: _buildCustomizedRadialBarChart(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomizedRadialBarChart() {
    return SfCircularChart(
      onCreateShader: (ChartShaderDetails chartShaderDetails) {
        return ui.Gradient.sweep(
            chartShaderDetails.outerRect.center,
            BaseColors.brandColorList,
            stops,
            TileMode.clamp,
            _degreeToRadian(0),
            _degreeToRadian(360),
            _resolveTransform(chartShaderDetails.outerRect, TextDirection.ltr));
      },
      series: _getRadialBarGradientSeries(),
      tooltipBehavior: _tooltipBehavior,
      annotations: <CircularChartAnnotation>[
        CircularChartAnnotation(
          height: '110%',
          width: '110%',
          widget: Padding(
            padding: const EdgeInsets.all(0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  gradient:
                      const LinearGradient(colors: BaseColors.brandColorList)),
              child: const Center(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: TextView(
                  '23kCal left',
                  maxLines: 1,
                  textOverflow: TextOverflow.ellipsis,
                  textStyle:
                      TextStyle(fontSize: 13, color: BaseColors.whiteColor),
                ),
              )),
            ),
          ),
        ),
      ],
    );
  }

  List<RadialBarSeries<_ChartShaderData, String>>
      _getRadialBarGradientSeries() {
    return <RadialBarSeries<_ChartShaderData, String>>[
      RadialBarSeries<_ChartShaderData, String>(
          maximumValue: 20,
          innerRadius: '60%',
          enableTooltip: true,
          dataLabelSettings: const DataLabelSettings(
              isVisible: false, textStyle: TextStyle(fontSize: 10.0)),
          dataSource: <_ChartShaderData>[
            _ChartShaderData('Calorie', 12, '100%'),
          ],
          cornerStyle: CornerStyle.bothCurve,
          gap: '50%',
          radius: '110%',
          xValueMapper: (_ChartShaderData data, _) => data.x,
          yValueMapper: (_ChartShaderData data, _) => data.y,
          pointRadiusMapper: (_ChartShaderData data, _) => data.text,
          dataLabelMapper: (_ChartShaderData data, _) => data.x)
    ];
  }

  dynamic _resolveTransform(Rect bounds, TextDirection textDirection) {
    final GradientTransform transform = GradientRotation(_degreeToRadian(-90));
    return transform.transform(bounds, textDirection: textDirection)!.storage;
  }

  // Convert degree to radian
  double _degreeToRadian(int deg) => deg * (3.141592653589793 / 180);
}

class _ChartShaderData {
  _ChartShaderData(this.x, this.y, this.text);

  final String x;

  final num y;

  final String text;
}
