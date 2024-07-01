import 'package:fitness_app/utils/base_constants/base_extensions.dart';
import 'package:fitness_app/view/ui/home/Home_components/pie_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../utils/base_constants/base_assets.dart';
import '../../../../utils/base_constants/base_colors.dart';
import '../../../../utils/base_constants/base_strings.dart';
import '../../../../utils/common/svg_image.dart';
import '../../../../utils/widgets/text_view.dart';
import 'gradient_btn.dart';

class BmiCard extends StatefulWidget {
  const BmiCard({super.key});

  @override
  State<BmiCard> createState() => _BmiCardState();
}

class _BmiCardState extends State<BmiCard> {
  late TooltipBehavior _tooltip;

  late List<PieData>? chartData = [];

  late String _shaderType;
  List<Color>? colors;
  List<double>? stops;

  @override
  void initState() {
    _initializeVariables();
    chartData = [
      PieData('Steve', 25, '75%', BaseColors.purpleColor),
      PieData('David', 75, '60%', BaseColors.whiteColor),
    ];
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  void _initializeVariables() {
    colors = <Color>[
      const Color.fromRGBO(75, 135, 185, 1),
      const Color.fromRGBO(192, 108, 132, 1),
      const Color.fromRGBO(246, 114, 128, 1),
      const Color.fromRGBO(248, 177, 149, 1),
      const Color.fromRGBO(116, 180, 155, 1)
    ];

    stops = <double>[
      0.2,
      0.4,
      0.6,
      0.8,
      1,
    ];
    _shaderType = 'sweep';
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.all(Radius.circular(24)),
            boxShadow: [
              BoxShadow(
                  color: BaseColors.shadowColor.withOpacity(0.1),
                  spreadRadius: 0.5,
                  blurRadius: 10,
                  offset: Offset(0, 10)),
            ],
          ),
          width: size.width,
          margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
          child: SvgImage(
            width: size.width,
            image: BaseAssets.bmiBackgroundImage,
            boxFits: BoxFit.contain,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 56, left: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TextView(
                    BaseStrings.bmiText,
                    fontSize: 14,
                    color: BaseColors.whiteColor,
                    fontWeight: FontWeight.w600,
                  ),
                  const TextView(
                    BaseStrings.bmiDescText,
                    fontSize: 12,
                    color: BaseColors.whiteColor,
                    fontWeight: FontWeight.normal,
                  ),
                  20.toVSB,
                  const GradientBtn(
                    btnText: 'View More',
                    textStyle: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: BaseColors.whiteColor),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: SizedBox(
                height: size.width * 0.4,
                width: size.width * 0.4,
                child: SfCircularChart(
                  series: <CircularSeries>[
                    PieSeries<PieData, String>(
                        pointColorMapper: (PieData data, _) => data.color,
                        dataSource: chartData,
                        pointRenderMode: PointRenderMode.segment,
                        pointRadiusMapper: (PieData data, _) => data.size,
                        xValueMapper: (PieData data, _) => data.x,
                        yValueMapper: (PieData data, _) => data.y,
                        explode: true,
                        explodeIndex: 0,
                        explodeOffset: "2%",
                        dataLabelSettings: const DataLabelSettings(
                            isVisible: true,
                            textStyle: TextStyle(
                                color: BaseColors.whiteColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w500)))
                  ],
                  tooltipBehavior: _tooltip,
                ),
              ),
            )
          ],
        )
      ],
    );
  }

  void onShaderTyeChange(String item) {
    _shaderType = item;
    setState(() {
      if (_shaderType == 'linear') {
        _shaderType = 'linear';
      }

      if (_shaderType == 'radial') {
        _shaderType = 'radial';
      }
      if (_shaderType == 'sweep') {
        _shaderType = 'sweep';
      }
    });
  }
}
