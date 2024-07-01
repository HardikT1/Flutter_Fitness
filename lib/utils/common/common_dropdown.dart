import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/base_constants/base_colors.dart';
import '../../../../utils/widgets/text_view.dart';

List<String> list = <String>['Weekly', 'Monthly', 'Yearly'];

class CommonDropdown extends StatefulWidget {
  final double? height;

  const CommonDropdown({super.key, this.height});

  @override
  State<CommonDropdown> createState() => _CommonDropdownState();
}

class _CommonDropdownState extends State<CommonDropdown> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: widget.height ?? size.height * 0.05,
      width: 110.w,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          gradient: const LinearGradient(
              colors: BaseColors.brandColorList,
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              tileMode: TileMode.clamp),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
              onChanged: (value) {
                setState(() {
                  dropdownValue = value!;
                });
              },
              value: dropdownValue,
              isExpanded: true,
              selectedItemBuilder: (BuildContext context) {
                return list.map((String value) {
                  return Center(
                    child: TextView(
                      dropdownValue,
                      textStyle: const TextStyle(
                          color: BaseColors.whiteColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    ),
                  );
                }).toList();
              },
              buttonStyleData: ButtonStyleData(
                height: 50,
                padding: const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    gradient: const LinearGradient(
                        colors: BaseColors.brandColorList,
                        begin: Alignment.topLeft,
                        end: Alignment.topRight,
                        tileMode: TileMode.clamp)),
                elevation: 0,
              ),
              dropdownStyleData: DropdownStyleData(
                maxHeight: 200,
                width: 100.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: Colors.white,
                ),
                offset: const Offset(-20, 0),
                useSafeArea: true,
                scrollbarTheme: ScrollbarThemeData(
                  radius: const Radius.circular(40),
                  thickness: MaterialStateProperty.all(6),
                  thumbVisibility: MaterialStateProperty.all(true),
                ),
              ),
              iconStyleData: const IconStyleData(
                icon: Icon(
                  Icons.arrow_drop_down,
                ),
                iconSize: 20,
                iconEnabledColor: Colors.white,
                iconDisabledColor: Colors.grey,
              ),
              items: list.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  enabled: true,
                  child: Container(
                    height: size.height * 0.05,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                          color: value == dropdownValue
                              ? Colors.transparent
                              : Colors.transparent),
                      gradient: SweepGradient(
                          colors: (value == dropdownValue)
                              ? [
                                  BaseColors.brandColorList[0],
                                  BaseColors.brandColorList[1],
                                  BaseColors.brandColorList[0],
                                  BaseColors.brandColorList[1].withAlpha(90),
                                  BaseColors.brandColorList[0].withAlpha(80),
                                  BaseColors.brandColorList[1],
                                ]
                              : [
                                  Colors.transparent,
                                  Colors.transparent,
                                  Colors.transparent,
                                  Colors.transparent,
                                  Colors.transparent,
                                  Colors.transparent,
                                ]),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(1),
                      child: Container(
                        width: size.width * 0.25,
                        decoration: BoxDecoration(
                          color: BaseColors.whiteColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            value,
                            style: const TextStyle(
                                color: BaseColors.blackColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 14),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }).toList()),
        ),
      ),
    );
  }
}
