class NotificationModel {
  NotificationModel({
    String? image,
    String? notificationTitle,
    String? notificationTime,
    bool isSelected =
        false, // Adding the new optional parameter with a default value
  }) {
    _image = image;
    _notificationTitle = notificationTitle;
    _notificationTime = notificationTime;
    _isSelected = isSelected;
  }

  NotificationModel.fromJson(dynamic json) {
    _image = json['image'];
    _notificationTitle = json['notificationTitle'];
    _notificationTime = json['notificationTime'];
    _isSelected =
        json['isSelected'] ?? false; // Assuming isSelected is present in JSON
  }

  String? _image;
  String? _notificationTitle;
  String? _notificationTime;
  bool _isSelected =
      false; // Adding the member variable to hold isSelected state

  NotificationModel copyWith({
    String? image,
    String? notificationTitle,
    String? notificationTime,
    bool?
        isSelected, // Making isSelected parameter nullable to allow it to be optional
  }) =>
      NotificationModel(
        image: image ?? _image,
        notificationTitle: notificationTitle ?? _notificationTitle,
        notificationTime: notificationTime ?? _notificationTime,
        isSelected:
            isSelected ?? _isSelected, // Using default value if not provided
      );

  String? get image => _image;

  String? get notificationTitle => _notificationTitle;

  String? get notificationTime => _notificationTime;

  bool get isSelected => _isSelected; // Adding getter for isSelected

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['image'] = _image;
    map['notificationTitle'] = _notificationTitle;
    map['notificationTime'] = _notificationTime;
    map['isSelected'] = _isSelected; // Adding isSelected to JSON
    return map;
  }
}
