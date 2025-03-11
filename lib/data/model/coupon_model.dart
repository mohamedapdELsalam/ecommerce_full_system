class CouponModel {
  int? couponId;
  String? couponCode;
  int? couponDiscount;
  String? couponExpiredDate;
  int? couponCount;

  CouponModel(
      {this.couponId,
      this.couponCode,
      this.couponDiscount,
      this.couponExpiredDate,
      this.couponCount});

  CouponModel.fromJson(Map<String, dynamic> json) {
    couponId = json['coupon_id'];
    couponCode = json['coupon_code'];
    couponDiscount = json['coupon_discount'];
    couponExpiredDate = json['coupon_expired_date'];
    couponCount = json['coupon_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['coupon_id'] = couponId;
    data['coupon_code'] = couponCode;
    data['coupon_discount'] = couponDiscount;
    data['coupon_expired_date'] = couponExpiredDate;
    data['coupon_count'] = couponCount;
    return data;
  }
}
