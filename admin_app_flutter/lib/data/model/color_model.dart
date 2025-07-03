class ColorModel {
  int? colorsId;
  String? colorsName;
  String? colorsHexcode;

  ColorModel({this.colorsId, this.colorsName, this.colorsHexcode});

  ColorModel.fromJson(Map<String, dynamic> json) {
    colorsId = json['colors_id'];
    colorsName = json['colors_name'];
    colorsHexcode = json['colors_hexcode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['colors_id'] = colorsId;
    data['colors_name'] = colorsName;
    data['colors_hexcode'] = colorsHexcode;
    return data;
  }
}
