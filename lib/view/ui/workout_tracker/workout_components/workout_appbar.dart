import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../utils/base_constants/base_assets.dart';
import '../../../../utils/base_constants/base_colors.dart';
import '../../../../utils/base_constants/text_style.dart';

class WorkoutAppbar extends StatelessWidget {
  final String? title;

  const WorkoutAppbar({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: AppBar(
        scrolledUnderElevation: 0.0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          // Status bar brightness (optional)
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: BaseColors.brandColorList),
          ),
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
                      icon: SvgPicture.asset(
                        BaseAssets.appBarBackBtn,
                        colorFilter: const ColorFilter.mode(
                            BaseColors.blackColor, BlendMode.srcIn),
                      )),
                ),
                Text(
                  title ?? '',
                  style: BaseTextStyles.textFieldStyle.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: BaseColors.whiteColor,
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
        centerTitle: true,
      ),
    );
  }
}
