import 'package:fitness_app/utils/base_constants/base_strings.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../utils/base_constants/base_colors.dart';
import '../../home/Home_components/sleep_card.dart';

class WorkoutGraph extends StatelessWidget {
  const WorkoutGraph({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.23,
      child: SfCartesianChart(
        primaryXAxis: const CategoryAxis(
            isVisible: true,
            crossesAt: 0,
            majorGridLines: MajorGridLines(width: 0),
            borderColor: Colors.transparent,
            labelStyle: TextStyle(
                color: BaseColors.whiteColor,
                fontFamily: BaseStrings.poppins,
                fontSize: 12,
                fontWeight: FontWeight.w400),
            axisLine: AxisLine(width: 0)),
        primaryYAxis: const NumericAxis(
          isVisible: true,
          borderColor: Colors.transparent,
          labelFormat: '{value}%',
          labelStyle: TextStyle(
              color: BaseColors.whiteColor,
              fontFamily: BaseStrings.poppins,
              fontSize: 12,
              fontWeight: FontWeight.w400),
          axisLine: AxisLine(width: 0),
          opposedPosition: true,
        ),
        borderColor: Colors.transparent,
        enableAxisAnimation: true,
        backgroundColor: Colors.transparent,
        plotAreaBackgroundColor: Colors.transparent,
        plotAreaBorderWidth: 0,
        plotAreaBorderColor: Colors.transparent,
        series: <CartesianSeries>[
          SplineSeries<SalesData, String>(
            name: 'Product A',
            color: BaseColors.whiteColor,
            dataSource: <SalesData>[
              SalesData('Sun', 35),
              SalesData('Mon', 28),
              SalesData('Tues', 34),
              SalesData('Wed', 32),
              SalesData('Thu', 40),
              SalesData('Fri', 33),
              SalesData('Sat', 30),
            ],
            xValueMapper: (SalesData sales, _) => sales.year,
            yValueMapper: (SalesData sales, _) => sales.sales,
          ),
          SplineSeries<SalesData, String>(
            name: 'Product B',
            color: BaseColors.whiteColor.withOpacity(0.6),
            dataSource: <SalesData>[
              SalesData('Sun', 25),
              SalesData('Mon', 30),
              SalesData('Tues', 20),
              SalesData('Wed', 35),
              SalesData('Thu', 30),
              SalesData('Fri', 45),
              SalesData('Sat', 50),
            ],
            xValueMapper: (SalesData sales, _) => sales.year,
            yValueMapper: (SalesData sales, _) => sales.sales,
          ),
          SplineSeries<SalesData, String>(
            name: 'Product C',
            color: BaseColors.whiteColor.withOpacity(0.8),
            dataSource: <SalesData>[
              SalesData('Sun', 30),
              SalesData('Mon', 35),
              SalesData('Tues', 20),
              SalesData('Wed', 25),
              SalesData('Thu', 45),
              SalesData('Fri', 40),
              SalesData('Sat', 15),
            ],
            xValueMapper: (SalesData sales, _) => sales.year,
            yValueMapper: (SalesData sales, _) => sales.sales,
          ),
        ],
      ),
    );
  }
}
