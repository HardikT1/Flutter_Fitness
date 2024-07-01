/// header title : "BaseStrings.headerTitleSignup"
/// header desc : "BaseStrings.headerDescTitleSignup"
/// images : "BaseAssets.lottieImproveShape"
/// title : "BaseStrings.title1"
/// desc : "BaseStrings.desc1"
library;

class SignupOnBoardingModel {
  SignupOnBoardingModel({
    required String? headertitle,
    required String? headerdesc,
    required String? images,
    required String? title,
    required String? desc,
  }) {
    _headertitle = headertitle;
    _headerdesc = headerdesc;
    _images = images;
    _title = title;
    _desc = desc;
  }

  SignupOnBoardingModel.fromJson(dynamic json) {
    _headertitle = json['header title'];
    _headerdesc = json['header desc'];
    _images = json['images'];
    _title = json['title'];
    _desc = json['desc'];
  }

  String? _headertitle;
  String? _headerdesc;
  String? _images;
  String? _title;
  String? _desc;

  SignupOnBoardingModel copyWith({
    required String headertitle,
    required String headerdesc,
    required String images,
    required String title,
    required String desc,
  }) =>
      SignupOnBoardingModel(
        headertitle: headertitle,
        headerdesc: headerdesc,
        images: images,
        title: title,
        desc: desc,
      );

  String? get headertitle => _headertitle;

  String? get headerdesc => _headerdesc;

  String? get images => _images;

  String? get title => _title;

  String? get desc => _desc;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['header title'] = _headertitle;
    map['header desc'] = _headerdesc;
    map['images'] = _images;
    map['title'] = _title;
    map['desc'] = _desc;
    return map;
  }
}
