import 'package:fitness_app/utils/base_constants/base_colors.dart';
import 'package:fitness_app/utils/base_constants/base_extensions.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../utils/base_constants/base_strings.dart';
import '../../../../utils/widgets/text_view.dart';
import 'background_card.dart';

class ActivityStatusCard extends StatefulWidget {
  const ActivityStatusCard({super.key});

  @override
  State<ActivityStatusCard> createState() => _ActivityStatusCardState();
}

class _ActivityStatusCardState extends State<ActivityStatusCard> {
  late List<double>? data = [];
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    data = [
      5.45,
      2.14,
      1.88,
      4.02,
      2.25,
      2.20,
      2.18,
      2.49,
      5.87,
      3.06,
      3.00,
      2.35,
      2.08,
      4.14,
      2.25,
      2.29,
      2.31,
      5.01,
      5.51,
      2.90,
      1.16,
      3.61,
      1.23,
      5.19,
      6,
      4.19,
      3.72,
      3.10,
      2.97,
      2.18,
      2.45,
      2.33,
      2.29,
      2.31,
      2.31,
      3.02,
      5.38,
      5.70,
      6.33,
      3.26,
      5.92,
      5.41,
      5.15,
      6.34,
      6.16,
      6.58,
      5.41,
      2.68,
      1.08,
      3.25,
      5.66,
      1.74,
      3.67,
      5.82,
      5.24,
      4.51,
      3.95,
      3.5,
      4.13,
      4.79,
      4.41,
      4.05,
      3.89,
      3.56,
      3.24,
      3.16,
      2.66,
      2.50,
      2.16,
      1.94,
      2.43,
      2.45,
      2.95,
      2.83,
      4.04,
      3.83,
      3.62,
      3.43,
      3.62,
      3.68,
      3.64,
      4.24,
      4.70,
      3,
      4.90,
      4.66,
      4.58,
      4.58,
      4.04,
      3.91,
      3.10,
      3.14,
      2.97,
      2.97,
      2.89,
    ];
    _tooltipBehavior = TooltipBehavior(
      enable: true,
      tooltipPosition: TooltipPosition.auto,
      color: Colors.transparent,
      activationMode: ActivationMode.singleTap,
      builder: (data, point, series, pointIndex, seriesIndex) {
        return Container(
          height: 30,
          width: 60,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
                colors: BaseColors.secondaryColorList,
                end: Alignment.bottomCenter,
                begin: Alignment.topRight),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Center(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextView(point.x.toString(),
                textStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: BaseColors.whiteColor)),
          )),
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextView(
            BaseStrings.activityStatus,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          5.toVSB,
          BackgroundCard(
            height: size.height * 0.23,
            isGradient: true,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15, top: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TextView(
                          BaseStrings.heartRate,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: BaseColors.blackColor,
                        ),
                        TextView(
                          '78 BPM',
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: BaseColors.brandColorList[0],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SfCartesianChart(
                      enableAxisAnimation: true,
                      enableSideBySideSeriesPlacement: true,
                      tooltipBehavior: _tooltipBehavior,
                      primaryXAxis: const CategoryAxis(
                          majorTickLines: MajorTickLines(width: 0.0),
                          isVisible: false,
                          majorGridLines: MajorGridLines(width: 0.0)),
                      primaryYAxis: const NumericAxis(
                        majorTickLines: MajorTickLines(width: 0.0),
                        minorTickLines: MinorTickLines(width: 0.0),
                        isVisible: false,
                        minimum: 0,
                        anchorRangeToVisiblePoints: true,
                        axisBorderType: AxisBorderType.withoutTopAndBottom,
                        majorGridLines: MajorGridLines(
                          width: 0,
                        ),
                      ),
                      plotAreaBorderWidth: 0.0,
                      zoomPanBehavior: ZoomPanBehavior(
                        enablePanning: true,
                      ),
                      series: <CartesianSeries>[
                        SplineAreaSeries<PulseData, int>(
                          dataSource: data!.asMap().entries.map((entry) {
                            return PulseData(entry.key, entry.value);
                          }).toList(),
                          xValueMapper: (entry, _) => entry.index,
                          yValueMapper: (entry, _) => entry.rate,
                          name: 'Pulse Rate',
                          enableTooltip: true,
                          isVisibleInLegend: false,
                          color: BaseColors.brandColorList[0].withOpacity(0.2),
                          borderColor: BaseColors.brandColorList[1],
                          borderWidth: 2,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PulseData {
  final int index;
  final double rate;

  PulseData(this.index, this.rate);
}
