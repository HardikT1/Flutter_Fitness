import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../base_constants/base_assets.dart';
import '../base_constants/base_colors.dart';
import '../base_constants/text_style.dart';

class CustomeSearchEditTextField extends StatelessWidget {
  final String searchText;
  final SvgPicture suffixIcon;

  const CustomeSearchEditTextField(
      {super.key, required this.searchText, required this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, bottom: 30),
      child: Container(
        width: 315.w,
        height: 50.h,
        decoration: BoxDecoration(
            color: BaseColors.whiteColor,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: BaseColors.lightGreyColor.withOpacity(1.0),
                offset: const Offset(0.2, 0.2),
                blurRadius: 10.0,
              ),
            ]),
        child: TextField(
          style: BaseTextStyles.textFieldStyle.copyWith(
              fontSize: 12.sp,
              color: BaseColors.lightGreyColor,
              fontWeight: FontWeight.w400),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 16),
            hintText: searchText,
            hintStyle: BaseTextStyles.textFieldStyle.copyWith(
                fontSize: 12.sp,
                color: BaseColors.lightGreyColor,
                fontWeight: FontWeight.w500),
            border: InputBorder.none,
            prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: SvgPicture.asset(BaseAssets.searchicon)),
            suffixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: VerticalDivider(
                    color: BaseColors.lightGreyColor,
                  ),
                ), // Vertical divider
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: suffixIcon), // Adjust padding as needed
              ],
            ), // Adjust padding as needed
          ),
        ),
      ),
    );
  }
}
