import 'package:fitness_app/models/notificationmodel/notification_model.dart';
import 'package:fitness_app/utils/base_constants/base_strings.dart';

import '../../../utils/base_constants/base_assets.dart';

class ConstantNotificationList {
  static List<NotificationModel> notificationList = [
    NotificationModel(
        image: BaseAssets.burger,
        notificationTime: BaseStrings.firstSubTitle,
        notificationTitle: BaseStrings.firstTitle),
    NotificationModel(
        image: BaseAssets.excercise,
        notificationTime: BaseStrings.secondSubTitle,
        notificationTitle: BaseStrings.secondTitle),
    NotificationModel(
        image: BaseAssets.cack,
        notificationTime: BaseStrings.thirdSubTitle,
        notificationTitle: BaseStrings.thirdTitle),
    NotificationModel(
        image: BaseAssets.secondexcercise,
        notificationTime: BaseStrings.fourtSubTitle,
        notificationTitle: BaseStrings.fourthTitle),
    NotificationModel(
        image: BaseAssets.sburger,
        notificationTime: BaseStrings.fifthSubTitle,
        notificationTitle: BaseStrings.fifthTitle),
    NotificationModel(
        image: BaseAssets.sexce,
        notificationTime: BaseStrings.sixthSunTitle,
        notificationTitle: BaseStrings.sixthTitle),
  ];
}
