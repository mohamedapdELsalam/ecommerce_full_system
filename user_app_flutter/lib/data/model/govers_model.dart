class GoverModel {
  int? governoratesId;
  String? governorateNameAr;
  String? governorateNameEn;

  GoverModel(
      {this.governoratesId, this.governorateNameAr, this.governorateNameEn});

  GoverModel.fromJson(Map<String, dynamic> json) {
    governoratesId = int.parse(json['governorates_id'].toString());
    governorateNameAr = json['governorate_name_ar'];
    governorateNameEn = json['governorate_name_en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['governorates_id'] = governoratesId;
    data['governorate_name_ar'] = governorateNameAr;
    data['governorate_name_en'] = governorateNameEn;
    return data;
  }
}
