import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../utils/base_constants/base_colors.dart';
import '../../../../utils/base_constants/base_strings.dart';
import '../../../../utils/widgets/text_view.dart';
import 'background_card.dart';

class SleepCard extends StatelessWidget {
  const SleepCard({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BackgroundCard(
      //    height: size.height * 0.23,
      width: size.width,
      isGradient: false,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TextView(
                    BaseStrings.sleep,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: BaseColors.blackColor,
                  ),
                  TextView(
                    '8h 20m',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: BaseColors.brandColorList[0],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.16,
              child: SfCartesianChart(
                primaryXAxis: const CategoryAxis(
                  isVisible: false,
                  borderColor: Colors.transparent,
                ),
                primaryYAxis: const CategoryAxis(
                  isVisible: false,
                  borderColor: Colors.transparent,
                ),
                plotAreaBorderWidth: 0.0,
                borderColor: Colors.transparent,
                series: <CartesianSeries>[
                  SplineSeries<SalesData, String>(
                    name: 'Product A',
                    color: BaseColors.secondaryColorList[1],
                    dataSource: <SalesData>[
                      SalesData('Jan', 35),
                      SalesData('Feb', 28),
                      SalesData('Mar', 34),
                      SalesData('Apr', 32),
                      SalesData('May', 40),
                    ],
                    xValueMapper: (SalesData sales, _) => sales.year,
                    yValueMapper: (SalesData sales, _) => sales.sales,
                  ),
                  SplineSeries<SalesData, String>(
                    name: 'Product B',
                    color: BaseColors.brandColorList[0],
                    dataSource: <SalesData>[
                      SalesData('Jan', 25),
                      SalesData('Feb', 32),
                      SalesData('Mar', 20),
                      SalesData('Apr', 10),
                      SalesData('May', 30),
                    ],
                    xValueMapper: (SalesData sales, _) => sales.year,
                    yValueMapper: (SalesData sales, _) => sales.sales,
                  ),
                  SplineSeries<SalesData, String>(
                    name: 'Product C',
                    color: BaseColors.brandColorList[0],
                    dataSource: <SalesData>[
                      SalesData('Jan', 30),
                      SalesData('Feb', 35),
                      SalesData('Mar', 35),
                      SalesData('Apr', 15),
                      SalesData('May', 25),
                    ],
                    xValueMapper: (SalesData sales, _) => sales.year,
                    yValueMapper: (SalesData sales, _) => sales.sales,
                  ),
                  SplineSeries<SalesData, String>(
                    name: 'Product A',
                    color: BaseColors.secondaryColorList[1],
                    dataSource: <SalesData>[
                      SalesData('Jan', 23),
                      SalesData('Feb', 32),
                      SalesData('Mar', 37),
                      SalesData('Apr', 35),
                      SalesData('May', 40),
                    ],
                    xValueMapper: (SalesData sales, _) => sales.year,
                    yValueMapper: (SalesData sales, _) => sales.sales,
                  ),
                  SplineSeries<SalesData, String>(
                    name: 'Product A',
                    color: BaseColors.secondaryColorList[1],
                    dataSource: <SalesData>[
                      SalesData('Jan', 21),
                      SalesData('Feb', 25),
                      SalesData('Mar', 25),
                      SalesData('Apr', 40),
                      SalesData('May', 32),
                    ],
                    xValueMapper: (SalesData sales, _) => sales.year,
                    yValueMapper: (SalesData sales, _) => sales.sales,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
