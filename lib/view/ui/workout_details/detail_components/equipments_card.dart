import 'package:fitness_app/utils/base_constants/base_assets.dart';
import 'package:fitness_app/utils/base_constants/base_extensions.dart';
import 'package:fitness_app/utils/base_constants/base_strings.dart';
import 'package:fitness_app/utils/common/svg_image.dart';
import 'package:flutter/material.dart';

import '../../../../utils/base_constants/base_colors.dart';
import '../../../../utils/widgets/text_view.dart';

class EquipmentsCard extends StatelessWidget {
  EquipmentsCard({super.key});

  final List<String> images = [
    BaseAssets.skippingRopeImg,
    BaseAssets.barbelImg,
    BaseAssets.skippingRopeImg,
    BaseAssets.barbelImg,
  ];

  final List<String> equipmentTexts = [
    'Barbell',
    'Skipping Rope',
    'Barbell',
    'Skipping Rope',
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextView(
                BaseStrings.needText,
                textStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: BaseColors.blackColor),
              ),
              TextView(
                '4 items',
                textStyle: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: BaseColors.secondaryGreyColor),
              ),
            ],
          ),
        ),
        8.toVSB,
        Padding(
          padding: const EdgeInsets.only(right: 15),
          child: SizedBox(
            height: size.height * 0.2,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: images.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: size.height * 0.12,
                        width: size.width * 0.26,
                        decoration: BoxDecoration(
                            color: BaseColors.borderColor,
                            borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Center(
                            child: SvgImage(
                              height: 50,
                              image: images[index],
                            ),
                          ),
                        ),
                      ),
                      8.toVSB,
                      TextView(
                        equipmentTexts[index],
                        textStyle: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: BaseColors.blackColor),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
