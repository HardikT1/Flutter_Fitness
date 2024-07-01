import 'package:fitness_app/utils/base_constants/base_assets.dart';
import 'package:fitness_app/utils/base_constants/base_colors.dart';
import 'package:fitness_app/utils/base_constants/text_style.dart';
import 'package:fitness_app/utils/common/custom_appbar.dart';
import 'package:fitness_app/utils/widgets/text_view.dart';
import 'package:fitness_app/view/ui/notification/constatnt_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/base_constants/base_strings.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: BaseStrings.appBarNotificationTitle),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView.builder(
          itemCount: ConstantNotificationList.notificationList.length,
          itemBuilder: (BuildContext context, int index) {
            final data = ConstantNotificationList.notificationList[index];
            return Column(children: [
              ListTile(
                leading: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                              colors: [
                                BaseColors.brandColorList[0].withOpacity(0.3),
                                BaseColors.brandColorList[1].withOpacity(0.3)
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.topRight,
                              tileMode: TileMode.clamp))
                      .copyWith(shape: BoxShape.circle),
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: data.image != null
                        ? SvgPicture.asset(data.image!, height: 18, width: 27)
                        : const SizedBox(),
                  ),
                ),
                title: TextView(
                  data.notificationTitle!,
                  textStyle: BaseTextStyles.textFieldStyle
                      .copyWith(fontSize: 12, color: BaseColors.blackColor),
                ),
                subtitle: TextView(
                  data.notificationTime!,
                  textStyle: BaseTextStyles.textFieldStyle.copyWith(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: BaseColors.primaryGreyColor),
                ),
                trailing: IconButton(
                    highlightColor: Colors.transparent,
                    onPressed: () {},
                    icon: SvgPicture.asset(BaseAssets.moreNotification)),
                contentPadding: const EdgeInsets.all(3),
              ),
              const Divider(height: 1, color: BaseColors.lightGreyColor)
            ]);
          },
        ),
      ),
    );
  }
}
