import 'package:fitness_app/models/chart_model/chart_model.dart';
import 'package:fitness_app/utils/base_constants/base_assets.dart';
import 'package:fitness_app/utils/base_constants/base_colors.dart';
import 'package:fitness_app/utils/base_constants/base_extensions.dart';
import 'package:fitness_app/utils/base_constants/base_strings.dart';
import 'package:fitness_app/utils/widgets/text_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MealHealper {
  Widget mealListTile(Size size,
      {String? title,
      String? subtitle,
      String? leadingIcon,
      IconData? trailingIcon,
      Color? iconColor}) {
    return Center(
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        shadowColor: BaseColors.lightGreyColor.withOpacity(0.4),
        color: BaseColors.whiteColor,
        elevation: 8.0,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: BaseColors.whiteColor,
          ),
          child: ListTile(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            leading: SvgPicture.asset(
              leadingIcon ?? BaseAssets.bunIcon,
              fit: BoxFit.scaleDown,
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                TextView(
                  title ?? "",
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                TextView(
                  subtitle ?? "",
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: BaseColors.primaryGreyColor,
                ),
              ],
            ),
            trailing: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: LinearGradient(
                    colors: [
                      BaseColors.purpleColor.withOpacity(0.10),
                      BaseColors.secondaryPurpleColor.withOpacity(0.10)
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.topRight,
                    tileMode: TileMode.clamp),
              ),
              child: Icon(
                trailingIcon ?? Icons.notifications_none_outlined,
                color: iconColor ?? BaseColors.purpleColor,
                size: 24,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget mealCard(
      {String? mealTitle,
      String? mealDesc,
      required Size size,
      required String mealIcon,
      required List<Color> cardBackgroudColor,
      required List<Color> buttonBackgroudColor}) {
    return Container(
      height: size.width * 0.50,
      width: size.width * 0.50,
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.only(left: 16),
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: cardBackgroudColor),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(80),
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: SvgPicture.asset(
                mealIcon,
                // width: size.width * 0.20,
                // height: size.width * 0.20,
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
          10.toVSB,
          TextView(
            mealTitle ?? "",
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          TextView(
            mealDesc ?? "",
            fontSize: 12,
            color: BaseColors.primaryGreyColor,
            fontWeight: FontWeight.normal,
          ),
          10.toVSB,
          Container(
            height: size.width * 0.08,
            width: size.width * 0.20,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: buttonBackgroudColor,
                  end: Alignment.bottomCenter,
                  begin: Alignment.topRight),
              borderRadius: BorderRadius.circular(50),
            ),
            child: const Center(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextView(
                BaseStrings.selectText,
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: BaseColors.whiteColor,
              ),
            )),
          )
        ],
      ),
    );
  }

  Widget mealChat() {
    var chartData = <ChartData>[
      ChartData(
        'Sun',
        60,
      ),
      ChartData(
        'Mon',
        30,
      ),
      ChartData(
        'Tue',
        70,
      ),
      ChartData(
        'Wed',
        50,
      ),
      ChartData(
        'Thu',
        20,
      ),
      ChartData(
        'Fri',
        60,
      ),
      ChartData(
        'Sat',
        70,
      )
    ];
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      title: const ChartTitle(text: ''),
      primaryXAxis: const CategoryAxis(
        majorGridLines: MajorGridLines(width: 0),
      ),
      primaryYAxis: const NumericAxis(
        majorGridLines:
            MajorGridLines(width: 1, color: BaseColors.lightGreyColor),
        opposedPosition: true,
        maximum: 100,
        maximumLabels: 4,
        labelFormat: '{value}%',
        axisLine: AxisLine(width: 1),
      ),
      series: _getDefaultSplineSeries(chartData),
      tooltipBehavior: TooltipBehavior(enable: true),
    );
  }

  List<SplineSeries<ChartData, String>> _getDefaultSplineSeries(
      List<ChartData> chartData) {
    return <SplineSeries<ChartData, String>>[
      SplineSeries<ChartData, String>(
        dataSource: chartData,
        xValueMapper: (ChartData sales, _) => sales.x,
        yValueMapper: (ChartData sales, _) => sales.y,
        markerSettings: const MarkerSettings(isVisible: true),
        color: BaseColors.primaryBlueColor,
        name: 'High',
      ),
    ];
  }
}
