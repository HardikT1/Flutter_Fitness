import 'package:flutter/cupertino.dart';

import '../base_constants/base_colors.dart';

class BaseBoxStyles {
  static const BoxDecoration commonGradientBoxDecoration = BoxDecoration(
    shape: BoxShape.rectangle,
    gradient: LinearGradient(
        colors: BaseColors.brandColorList,
        begin: Alignment.topLeft,
        end: Alignment.topRight,
        tileMode: TileMode.clamp),
    borderRadius: null,
  );
}
