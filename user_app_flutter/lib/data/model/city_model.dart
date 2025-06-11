class CityModel {
  int? citiesId;
  String? cityNameAr;
  String? cityNameEn;
  int? cityGovId;

  CityModel({this.citiesId, this.cityNameAr, this.cityNameEn, this.cityGovId});

  CityModel.fromJson(Map<String, dynamic> json) {
    citiesId = int.parse(json['cities_id'].toString());
    cityNameAr = json['city_name_ar'];
    cityNameEn = json['city_name_en'];
    cityGovId = json['city_gov_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['cities_id'] = citiesId;
    data['city_name_ar'] = cityNameAr;
    data['city_name_en'] = cityNameEn;
    data['city_gov_id'] = cityGovId;
    return data;
  }
}
