import 'package:fitness_app/models/notificationmodel/notification_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../utils/base_constants/base_assets.dart';
import '../../../../utils/base_constants/base_colors.dart';
import '../../../../utils/base_constants/text_style.dart';

class CustomNotificationList extends StatefulWidget {
  final List<NotificationModel> dataList;

  const CustomNotificationList({super.key, required this.dataList});

  @override
  State<CustomNotificationList> createState() => _CustomNotificationListState();
}

class _CustomNotificationListState extends State<CustomNotificationList> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 315.w,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: widget.dataList.length,
        itemBuilder: (BuildContext context, int index) {
          final data = widget.dataList[index];
          return notificationElements(data, index);
        },
      ),
    );
  }

  Column notificationElements(NotificationModel data, int index) {
    return Column(children: [
      InkWell(
        highlightColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Card(
            elevation: 0,
            /* color: BaseColors.whiteColor,*/
            child: Container(
              decoration: index == selectedIndex
                  ? BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: BaseColors.whiteColor,
                      boxShadow: [
                          BoxShadow(
                            color: BaseColors.lightGreyColor.withOpacity(1.0),
                            offset: const Offset(0.2, 0.2),
                            blurRadius: 10.0,
                          ),
                        ])
                  : ShapeDecoration.fromBoxDecoration(const BoxDecoration(
                      borderRadius: BorderRadius.zero,
                      color: Colors.transparent,
                      boxShadow: null)),
              child: ListTile(
                minVerticalPadding: 15,
                horizontalTitleGap: 8.0,
                leading: Container(
                  height: 60.h,
                  width: 60.w,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                          colors: [
                            BaseColors.brandColorList[0].withOpacity(0.3),
                            BaseColors.brandColorList[1].withOpacity(0.3)
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.topRight,
                          tileMode: TileMode.clamp)),
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: data.image != null
                        ? SvgPicture.asset(data.image!)
                        : const SizedBox(),
                  ),
                ),
                title: Text(
                  data.notificationTitle!,
                  style: BaseTextStyles.textFieldStyle.copyWith(
                    fontSize: 12.sp,
                    color: BaseColors.blackColor,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 3),
                  child: Text(
                    data.notificationTime!,
                    style: BaseTextStyles.textFieldStyle.copyWith(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                      color: BaseColors.primaryGreyColor,
                    ),
                  ),
                ),
                trailing: IconButton(
                    highlightColor: Colors.transparent,
                    padding: const EdgeInsets.only(left: 40, bottom: 20),
                    onPressed: () {},
                    icon: SvgPicture.asset(BaseAssets.moreNotification)),
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}
