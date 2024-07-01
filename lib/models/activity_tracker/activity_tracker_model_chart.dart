class ActivityTrackerModelChart {
  /// x : "abc"
  /// y : 2
  ActivityTrackerModelChart({
    String? x,
    num? y,
  }) {
    _x = x;
    _y = y;
  }

  ActivityTrackerModelChart.fromJson(dynamic json) {
    _x = json['x'];
    _y = json['y'];
  }

  String? _x;
  num? _y;

  ActivityTrackerModelChart copyWith({
    String? x,
    num? y,
  }) =>
      ActivityTrackerModelChart(
        x: x ?? _x,
        y: y ?? _y,
      );

  String? get x => _x;

  num? get y => _y;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['x'] = _x;
    map['y'] = _y;
    return map;
  }
}
