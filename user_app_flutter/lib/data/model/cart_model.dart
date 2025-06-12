class CartModel {
  double? totalPrice;
  int? count;
  int? cartId;
  int? cartItemid;
  int? cartUserid;
  int? cartSelectedVariant;
  int? cartOrders;
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
  double? finalPrice;
  int? favorite;
  int? stockId;
  int? colorsId;
  String? colorsName;
  String? colorsHexcode;
  int? sizesId;
  String? sizesLabel;
  int? stockPrice;

  CartModel(
      {this.totalPrice,
      this.count,
      this.cartId,
      this.cartItemid,
      this.cartUserid,
      this.cartSelectedVariant,
      this.cartOrders,
      this.itemsId,
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
      this.finalPrice,
      this.favorite,
      this.stockId,
      this.colorsId,
      this.colorsName,
      this.colorsHexcode,
      this.sizesId,
      this.sizesLabel,
      this.stockPrice});

  CartModel.fromJson(Map<String, dynamic> json) {
    totalPrice = json['totalPrice'] + 0.0;
    count = json['count'];
    cartId = json['cart_id'];
    cartItemid = json['cart_itemid'];
    cartUserid = json['cart_userid'];
    cartSelectedVariant = json['cart_selected_variant'];
    cartOrders = json['cart_orders'];
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
    finalPrice = json['finalPrice'] + 0.0;
    favorite = json['favorite'];
    stockId = json['stock_id'];
    colorsId = json['colors_id'];
    colorsName = json['colors_name'];
    colorsHexcode = json['colors_hexcode'];
    sizesId = json['sizes_id'];
    sizesLabel = json['sizes_label'];
    stockPrice = json['stock_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalPrice'] = totalPrice;
    data['count'] = count;
    data['cart_id'] = cartId;
    data['cart_itemid'] = cartItemid;
    data['cart_userid'] = cartUserid;
    data['cart_selected_variant'] = cartSelectedVariant;
    data['cart_orders'] = cartOrders;
    data['items_id'] = itemsId;
    data['items_name_ar'] = itemsNameAr;
    data['items_name_en'] = itemsNameEn;
    data['items_name_de'] = itemsNameDe;
    data['items_name_sp'] = itemsNameSp;
    data['items_desc_ar'] = itemsDescAr;
    data['items_desc_en'] = itemsDescEn;
    data['items_desc_de'] = itemsDescDe;
    data['items_desc_sp'] = itemsDescSp;
    data['items_price'] = itemsPrice;
    data['items_discount'] = itemsDiscount;
    data['items_count'] = itemsCount;
    data['items_active'] = itemsActive;
    data['items_image'] = itemsImage;
    data['items_createTime'] = itemsCreateTime;
    data['items_categories'] = itemsCategories;
    data['categories_id'] = categoriesId;
    data['categories_name_ar'] = categoriesNameAr;
    data['categories_name_en'] = categoriesNameEn;
    data['categories_name_de'] = categoriesNameDe;
    data['categories_name_sp'] = categoriesNameSp;
    data['categories_image'] = categoriesImage;
    data['categories_createTime'] = categoriesCreateTime;
    data['finalPrice'] = finalPrice;
    data['favorite'] = favorite;
    data['stock_id'] = stockId;
    data['colors_id'] = colorsId;
    data['colors_name'] = colorsName;
    data['colors_hexcode'] = colorsHexcode;
    data['sizes_id'] = sizesId;
    data['sizes_label'] = sizesLabel;
    data['stock_price'] = stockPrice;
    return data;
  }
}
