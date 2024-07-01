import 'package:fitness_app/utils/base_constants/base_extensions.dart';
import 'package:flutter/material.dart';

import '../../../../utils/base_constants/base_assets.dart';
import '../../../../utils/base_constants/base_colors.dart';
import '../../../../utils/common/svg_image.dart';
import '../../../../utils/widgets/text_view.dart';

class CommonRow extends StatelessWidget {
  final String? text;
  final String? img;
  final bool? pngImage;
  final GestureTapCallback? onTap;

  const CommonRow(
      {super.key, this.text, this.img, this.pngImage = false, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: onTap,
      child: Row(
        children: [
          pngImage == true
              ? Image.asset(
                  img ?? '',
                  height: 25,
                  width: 25,
                )
              : SvgImage(
                  image: img ?? '',
                  height: 25,
                  width: 25,
                ),
          10.toHSB,
          TextView(text ?? '',
              textStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: BaseColors.primaryGreyColor)),
          const Spacer(),
          Image.asset(
            BaseAssets.forwardIcon,
            height: 20,
          ),
        ],
      ),
    );
  }
}
