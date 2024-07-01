class BaseModel {
  BaseModel({
    String? image,
    required String title, // Renamed from notificationTitle
    required String description, // Renamed from notificationTime
  }) {
    _image = image;
    _title = title;
    _description = description;
  }

  BaseModel.fromJson(dynamic json) {
    _image = json['image'];
    _title = json['title']; // Updated to match the renamed key
    _description = json['description']; // Updated to match the renamed key
  }

  String? _image;
  String? _title; // Renamed from notificationTitle
  String? _description; // Renamed from notificationTime

  String? get image => _image;

  String? get title => _title; // Renamed from notificationTitle

  String? get description => _description; // Renamed from notificationTime

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['image'] = _image;
    map['title'] = _title; // Renamed from notificationTitle
    map['description'] = _description; // Renamed from notificationTime
    return map;
  }
}
