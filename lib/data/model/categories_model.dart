class CategoriesModel {
  int? categoriesId;
  String? categoriesNameAr;
  String? categoriesNameEn;
  String? categoriesNameDe;
  String? categoriesNameSp;
  String? categoriesImage;
  String? categoriesCreateTime;

  CategoriesModel(
      {this.categoriesId,
      this.categoriesNameAr,
      this.categoriesNameEn,
      this.categoriesNameDe,
      this.categoriesNameSp,
      this.categoriesImage,
      this.categoriesCreateTime});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    categoriesId = json['categories_id'];
    categoriesNameAr = json['categories_name_ar'];
    categoriesNameEn = json['categories_name_en'];
    categoriesNameDe = json['categories_name_de'];
    categoriesNameSp = json['categories_name_sp'];
    categoriesImage = json['categories_image'];
    categoriesCreateTime = json['categories_createTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categories_id'] = this.categoriesId;
    data['categories_name_ar'] = this.categoriesNameAr;
    data['categories_name_en'] = this.categoriesNameEn;
    data['categories_name_de'] = this.categoriesNameDe;
    data['categories_name_sp'] = this.categoriesNameSp;
    data['categories_image'] = this.categoriesImage;
    data['categories_createTime'] = this.categoriesCreateTime;
    return data;
  }
}
