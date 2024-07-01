import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../base_constants/base_assets.dart';
import '../base_constants/base_colors.dart';
import '../base_constants/text_style.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final LinearGradient? gradient;
  final bool isCross;

  const CustomAppBar(
      {super.key, required this.title, this.gradient, this.isCross = true});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
      child: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
        ),
        scrolledUnderElevation: 0.0,
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: BoxDecoration(gradient: gradient),
          child: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 32.w,
                  width: 32.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: BaseColors.borderColor,
                  ),
                  child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: isCross
                          ? SvgPicture.asset(
                              BaseAssets.appBarBackBtn,
                              colorFilter: const ColorFilter.mode(
                                  BaseColors.blackColor, BlendMode.srcIn),
                            )
                          : SvgPicture.asset(BaseAssets.crossBtn)),
                ),
                Text(
                  title,
                  style: BaseTextStyles.textFieldStyle.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: BaseColors.blackColor,
                  ),
                ),
                Container(
                  height: 32.w,
                  width: 32.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: BaseColors.borderColor),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    icon: SvgPicture.asset(BaseAssets.moreBtn),
                  ),
                )
              ],
            ),
          ),
        ),
        automaticallyImplyLeading: false,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
