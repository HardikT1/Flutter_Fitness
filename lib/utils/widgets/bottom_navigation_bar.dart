import 'package:flutter/material.dart';

import '../base_constants/base_assets.dart';
import '../base_constants/base_colors.dart';

class BottomNavigationBarTab extends StatefulWidget {
  const BottomNavigationBarTab({super.key, this.onTap, this.currentIndex});

  final void Function(int)? onTap;
  final int? currentIndex;

  @override
  State<BottomNavigationBarTab> createState() => _BottomNavigationBarTabState();
}

class _BottomNavigationBarTabState extends State<BottomNavigationBarTab> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        splashFactory: NoSplash.splashFactory,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        canvasColor: BaseColors.whiteColor,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(),
        textTheme: Theme.of(context)
            .textTheme
            .copyWith(bodySmall: const TextStyle(color: Colors.transparent)),
      ),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
              top: BorderSide(color: BaseColors.borderColor, width: 1.5),
              right: BorderSide.none),
          color: BaseColors.whiteColor,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: BaseColors.blackColor.withAlpha(10),
                blurRadius: 40,
                offset: Offset(0, 10)),
          ],
        ),
        child: BottomNavigationBar(
          selectedFontSize: 0,
          unselectedFontSize: 0,
          elevation: 10,
          onTap: widget.onTap,
          currentIndex: widget.currentIndex ?? 0,
          type: BottomNavigationBarType.fixed,
          selectedIconTheme: const IconThemeData(color: Colors.white),
          showUnselectedLabels: true,
          items: [
            BottomNavigationBarItem(
                activeIcon: navigationCommonItem(
                  image: widget.currentIndex == 0
                      ? BaseAssets.homeActiveIcon
                      : BaseAssets.homeActiveIcon,
                ),
                icon: Image.asset(
                  widget.currentIndex == 0
                      ? BaseAssets.homeGreyIcon
                      : BaseAssets.homeGreyIcon,
                  width: 19,
                  height: 20,
                ),
                label: ''),
            BottomNavigationBarItem(
                activeIcon: navigationCommonItem(
                  image: BaseAssets.activityActive,
                ),
                icon:
                    Image.asset(BaseAssets.activityGrey, width: 19, height: 20),
                label: ''),
            const BottomNavigationBarItem(
                label: '',
                icon: Icon(
                  Icons.search,
                  color: Colors.transparent,
                )),
            BottomNavigationBarItem(
                activeIcon: navigationCommonItem(
                  image: BaseAssets.cameraActive,
                ),
                icon: Image.asset(BaseAssets.cameraGrey, width: 19, height: 20),
                label: ''),
            BottomNavigationBarItem(
                icon:
                    Image.asset(BaseAssets.profileGrey, width: 19, height: 20),
                activeIcon: navigationCommonItem(
                  image: BaseAssets.profileActive,
                ),
                label: ''),
          ],
        ),
      ),
    );
  }

  Widget navigationCommonItem(
      {String? image, Color? colors, bool? isSelected}) {
    return Center(
        child: Image.asset(
      image ?? '',
      width: 19,
      height: 27,
    ));
  }
}
