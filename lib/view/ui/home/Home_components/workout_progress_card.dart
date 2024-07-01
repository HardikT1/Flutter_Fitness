import 'package:fitness_app/utils/base_constants/base_extensions.dart';
import 'package:fitness_app/view/ui/home/Home_components/sleep_card.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../../../utils/base_constants/base_colors.dart';
import '../../../../utils/base_constants/base_strings.dart';
import '../../../../utils/common/common_dropdown.dart';
import '../../../../utils/widgets/text_view.dart';

class WorkoutProgressCard extends StatefulWidget {
  const WorkoutProgressCard({super.key});

  @override
  State<WorkoutProgressCard> createState() => _WorkoutProgressCardState();
}

class _WorkoutProgressCardState extends State<WorkoutProgressCard> {
  bool showBarChart = false;
  int selectedPointIndex = -1;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const TextView(
                BaseStrings.workoutProgress,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              CommonDropdown(
                height: size.height * 0.04,
              )
            ],
          ),
          8.toVSB,
          SizedBox(
            height: size.height * 0.23,
            child: SfCartesianChart(
              primaryXAxis: const CategoryAxis(
                isVisible: true,
                borderColor: Colors.transparent,
              ),
              primaryYAxis: const NumericAxis(
                isVisible: true,
                borderColor: Colors.transparent,
                labelFormat: '{value}%',
                opposedPosition: true,
              ),
              onDataLabelTapped: (args) {
                if (args.seriesIndex == 0) {
                  setState(() {
                    selectedPointIndex = args.pointIndex;
                  });
                }
              },
              plotAreaBorderWidth: 0.0,
              borderColor: Colors.transparent,
              series: <CartesianSeries>[
                SplineSeries<SalesData, String>(
                  name: 'Product A',
                  color: BaseColors.brandColorList[1].withOpacity(0.2),
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
                  color: BaseColors.brandColorList[0].withOpacity(0.6),
                  dataSource: <SalesData>[
                    SalesData('Sun', 25),
                    SalesData('Mon', 32),
                    SalesData('Tues', 20),
                    SalesData('Wed', 10),
                    SalesData('Thu', 30),
                    SalesData('Fri', 30),
                    SalesData('Sat', 30),
                  ],
                  xValueMapper: (SalesData sales, _) => sales.year,
                  yValueMapper: (SalesData sales, _) => sales.sales,
                ),
                SplineSeries<SalesData, String>(
                  name: 'Product C',
                  color: BaseColors.brandColorList[0],
                  dataSource: <SalesData>[
                    SalesData('Sun', 30),
                    SalesData('Mon', 32),
                    SalesData('Tues', 23),
                    SalesData('Wed', 25),
                    SalesData('Thu', 28),
                    SalesData('Fri', 40),
                    SalesData('Sat', 10),
                  ],
                  xValueMapper: (SalesData sales, _) => sales.year,
                  yValueMapper: (SalesData sales, _) => sales.sales,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
