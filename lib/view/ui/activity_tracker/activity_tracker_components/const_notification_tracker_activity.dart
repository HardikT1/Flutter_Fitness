import 'package:fitness_app/models/notificationmodel/notification_model.dart';

import '../../../../utils/base_constants/base_assets.dart';

class NotificationActivityTracker {
  static List<NotificationModel> notification = [
    NotificationModel(
        image: BaseAssets.burger,
        notificationTitle: "Drinking 300ml Water",
        notificationTime: "About 3 minutes ago",
        isSelected: false),
    NotificationModel(
        image: BaseAssets.burger,
        notificationTitle: "Eat Snack (Fitbar)",
        notificationTime: "About 10 minutes ago",
        isSelected: false)
  ];
}
