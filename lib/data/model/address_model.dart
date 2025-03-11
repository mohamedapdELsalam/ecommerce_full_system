class AddressModel {
  int? addressId;
  int? addressUserid;
  String? name;
  String? street;
  double? latitude;
  double? longitude;
  String? goverAr;
  String? goverEn;
  String? cityAr;
  String? cityEn;

  AddressModel(
      {this.addressId,
      this.addressUserid,
      this.name,
      this.street,
      this.latitude,
      this.longitude,
      this.goverAr,
      this.goverEn,
      this.cityAr,
      this.cityEn});

  AddressModel.fromJson(Map<String, dynamic> json) {
    addressId = json['address_id'];
    addressUserid = json['address_userid'];
    name = json['name'];
    street = json['street'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    goverAr = json['gover_ar'];
    goverEn = json['gover_en'];
    cityAr = json['city_ar'];
    cityEn = json['city_en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address_id'] = addressId;
    data['address_userid'] = addressUserid;
    data['name'] = name;
    data['street'] = street;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['gover_ar'] = goverAr;
    data['gover_en'] = goverEn;
    data['city_ar'] = cityAr;
    data['city_en'] = cityEn;
    return data;
  }
}
