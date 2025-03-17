class ApiLinks {
  static const String serverLink = "http://192.168.1.3/ecommerceApi";
  // static const String serverLink = "http://localhost/ecommerceApi";
  //auth
  static const String loginLinkApi = "$serverLink/auth/login.php";
  static const String signLinkApi = "$serverLink/auth/signup.php";
  //homepage
  static const String homePageLinkApi = "$serverLink/homepage.php";
  static const String items = "$serverLink/items/view_item.php";
  //images
  static const String imageRoot = "$serverLink/upload";
  static const String categoryRoot = "$imageRoot/categories";
  static const String itemImageRoot = "$imageRoot/items";
  //favorite
  static const String addFav = "$serverLink/favorite/add.php";
  static const String deleteFav = "$serverLink/favorite/delete.php";
  static const String viewFav = "$serverLink/favorite/view.php";
  //cart
  static const String addCart = "$serverLink/cart/add.php";
  static const String subtractCart = "$serverLink/cart/subtract.php";
  static const String viewCart = "$serverLink/cart/view.php";
  static const String removeItemFromCart = "$serverLink/cart/remove.php";
  static const String checkCoupon = "$serverLink/cart/check_coupon.php";
  //search
  static const String search = "$serverLink/items/search.php";
  //address
  static const String getGovers = "$serverLink/address/get_governates.php";
  static const String getCities = "$serverLink/address/get_cities.php";
  static const String addAddress = "$serverLink/address/address_add.php";
  static const String editAddress = "$serverLink/address/address_edit.php";
  static const String deleteAddress = "$serverLink/address/address_delete.php";
  static const String viewAddress = "$serverLink/address/address_view.php";
  //orders
  static const String checkout = "$serverLink/orders/checkout.php";

  //test
  static const String addDataLinkApi = "$serverLink/test/addData.php";
  static const String getDataLinkApi = "$serverLink/test/getData.php";
}
