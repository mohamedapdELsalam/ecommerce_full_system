class ItemsModel {
  int? itemsId;
  String? itemsNameAr;
  String? itemsNameEn;
  String? itemsNameDe;
  String? itemsNameSp;
  String? itemsDescAr;
  String? itemsDescEn;
  String? itemsDescDe;
  String? itemsDescSp;
  int? itemsPrice;
  int? itemsDiscount;
  int? itemsCount;
  int? itemsActive;
  String? itemsImage;
  String? itemsCreateTime;
  int? itemsCategories;
  int? categoriesId;
  String? categoriesNameAr;
  String? categoriesNameEn;
  String? categoriesNameDe;
  String? categoriesNameSp;
  String? categoriesImage;
  String? categoriesCreateTime;
  int? favorite;

  ItemsModel(
      {this.itemsId,
      this.itemsNameAr,
      this.itemsNameEn,
      this.itemsNameDe,
      this.itemsNameSp,
      this.itemsDescAr,
      this.itemsDescEn,
      this.itemsDescDe,
      this.itemsDescSp,
      this.itemsPrice,
      this.itemsDiscount,
      this.itemsCount,
      this.itemsActive,
      this.itemsImage,
      this.itemsCreateTime,
      this.itemsCategories,
      this.categoriesId,
      this.categoriesNameAr,
      this.categoriesNameEn,
      this.categoriesNameDe,
      this.categoriesNameSp,
      this.categoriesImage,
      this.categoriesCreateTime,
      this.favorite});

  ItemsModel.fromJson(Map<String, dynamic> json) {
    itemsId = json['items_id'];
    itemsNameAr = json['items_name_ar'];
    itemsNameEn = json['items_name_en'];
    itemsNameDe = json['items_name_de'];
    itemsNameSp = json['items_name_sp'];
    itemsDescAr = json['items_desc_ar'];
    itemsDescEn = json['items_desc_en'];
    itemsDescDe = json['items_desc_de'];
    itemsDescSp = json['items_desc_sp'];
    itemsPrice = json['items_price'];
    itemsDiscount = json['items_discount'];
    itemsCount = json['items_count'];
    itemsActive = json['items_active'];
    itemsImage = json['items_image'];
    itemsCreateTime = json['items_createTime'];
    itemsCategories = json['items_categories'];
    categoriesId = json['categories_id'];
    categoriesNameAr = json['categories_name_ar'];
    categoriesNameEn = json['categories_name_en'];
    categoriesNameDe = json['categories_name_de'];
    categoriesNameSp = json['categories_name_sp'];
    categoriesImage = json['categories_image'];
    categoriesCreateTime = json['categories_createTime'];
    favorite = json['favorite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['items_id'] = this.itemsId;
    data['items_name_ar'] = this.itemsNameAr;
    data['items_name_en'] = this.itemsNameEn;
    data['items_name_de'] = this.itemsNameDe;
    data['items_name_sp'] = this.itemsNameSp;
    data['items_desc_ar'] = this.itemsDescAr;
    data['items_desc_en'] = this.itemsDescEn;
    data['items_desc_de'] = this.itemsDescDe;
    data['items_desc_sp'] = this.itemsDescSp;
    data['items_price'] = this.itemsPrice;
    data['items_discount'] = this.itemsDiscount;
    data['items_count'] = this.itemsCount;
    data['items_active'] = this.itemsActive;
    data['items_image'] = this.itemsImage;
    data['items_createTime'] = this.itemsCreateTime;
    data['items_categories'] = this.itemsCategories;
    data['categories_id'] = this.categoriesId;
    data['categories_name_ar'] = this.categoriesNameAr;
    data['categories_name_en'] = this.categoriesNameEn;
    data['categories_name_de'] = this.categoriesNameDe;
    data['categories_name_sp'] = this.categoriesNameSp;
    data['categories_image'] = this.categoriesImage;
    data['categories_createTime'] = this.categoriesCreateTime;
    data['favorite'] = this.favorite;
    return data;
  }
}
