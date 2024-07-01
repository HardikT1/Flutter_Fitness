import 'package:fitness_app/utils/base_constants/box_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../base_constants/base_colors.dart';

class CommonGradientSwitch extends StatefulWidget {
  final bool? isSwitchOn;

  final double? height;
  final double? width;

  const CommonGradientSwitch({
    super.key,
    this.isSwitchOn,
    this.width,
    this.height,
  });

  @override
  State<CommonGradientSwitch> createState() => _CommonGradientSwitchState();
}

class _CommonGradientSwitchState extends State<CommonGradientSwitch> {
  bool _isSwitchOn = false;

  @override
  void initState() {
    super.initState();
    _isSwitchOn = widget.isSwitchOn ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleSwitch,
      child: Stack(
        alignment: _isSwitchOn ? Alignment.centerRight : Alignment.centerLeft,
        children: [
          Container(
            width: widget.width ?? 63,
            height: widget.height ?? 31,
            alignment: Alignment.center, // Alignment as center
            decoration: BaseBoxStyles.commonGradientBoxDecoration.copyWith(
                gradient: LinearGradient(
                    colors: _isSwitchOn
                        ? BaseColors.secondaryColorList
                        : [
                            BaseColors.lightGreyColor,
                            BaseColors.lightGreyColor
                          ],
                    begin:
                        _isSwitchOn ? Alignment.topRight : Alignment.centerLeft,
                    end: _isSwitchOn
                        ? Alignment.topLeft
                        : Alignment.centerRight),
                borderRadius: const BorderRadius.all(Radius.circular(50))),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            child: Container(
              height: 14.h,
              width: 14.w,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  void _toggleSwitch() {
    setState(() {
      _isSwitchOn = !_isSwitchOn;
    });
  }
}
