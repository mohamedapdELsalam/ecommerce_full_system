class ApiLinks {
  static const String serverLink = "http://192.168.1.3/ecommerceApi";
  // static const String serverLink = "http://localhost/ecommerceApi";
  //auth
  static const String loginLinkApi = "$serverLink/users/auth/login.php";
  static const String signLinkApi = "$serverLink/users/auth/signup.php";
  //homepage
  static const String homePageLinkApi = "$serverLink/homepage.php";
  static const String items = "$serverLink/users/items/view_item.php";
  //images
  static const String imageRoot = "$serverLink/upload";
  static const String categoryRoot = "$imageRoot/categories";
  static const String itemImageRoot = "$imageRoot/items";
  //favorite
  static const String addFav = "$serverLink/users/favorite/add.php";
  static const String deleteFav = "$serverLink/users/favorite/delete.php";
  static const String viewFav = "$serverLink/users/favorite/view.php";
  //cart
  static const String addCart = "$serverLink/users/cart/add.php";
  static const String subtractCart = "$serverLink/users/cart/subtract.php";
  static const String viewCart = "$serverLink/users/cart/view.php";
  static const String removeItemFromCart = "$serverLink/users/cart/remove.php";
  static const String checkCoupon = "$serverLink/users/cart/check_coupon.php";
  //search
  static const String searchAllItems = "$serverLink/items/search.php";
  //address
  static const String getGovers =
      "$serverLink/users/address/get_governates.php";
  static const String getCities = "$serverLink/users/address/get_cities.php";
  static const String addAddress = "$serverLink/users/address/address_add.php";
  static const String editAddress =
      "$serverLink/users/address/address_edit.php";
  static const String deleteAddress =
      "$serverLink/users/address/address_delete.php";
  static const String viewAddress =
      "$serverLink/users/address/address_view.php";
  //orders
  static const String checkout = "$serverLink/users/orders/checkout.php";
  static const String pendingOrders = "$serverLink/users/orders/pending.php";
  static const String archiveOrders = "$serverLink/users/orders/archive.php";
  static const String orderDetails = "$serverLink/users/orders/details.php";
  static const String deleteOrder = "$serverLink/users/orders/delete.php";
  static const String ratingOrder = "$serverLink/users/orders/rating.php";
  //offers
  static const String getOffers = "$serverLink/users/offers/offers.php";
  static const String searchOffers = "$serverLink/users/offers/search.php";

  static const String viewNotifications = "$serverLink/notifications/view.php";

  //test
  static const String addDataLinkApi = "$serverLink/test/addData.php";
  static const String getDataLinkApi = "$serverLink/test/getData.php";
}
