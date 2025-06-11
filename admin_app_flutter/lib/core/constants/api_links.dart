class ApiLinks {
  static const String serverLink = "http://192.168.1.3/ecommerceApi";
  // static const String serverLink = "http://localhost/ecommerceApi";
  static const String role = "$serverLink/admins";
  //auth
  static const String loginLinkApi = "$role/auth/login.php";
  static const String signLinkApi = "$role/auth/signup.php";
  static const String checkEmail = "$role/auth/check_email.php";
  static const String checkVerifyCode = "$role/auth/check_verifycode.php";
  static const String signupVerifyCode = "$role/auth/signup_verifycode.php";
  static const String changePassword = "$role/auth/change_password.php";
  //homepage
  static const String homePageLinkApi = "$serverLink/homepage.php";
  static const String items = "$serverLink/items/view_item.php";
  //images
  static const String imageRoot = "$serverLink/upload";
  static const String categoryRoot = "$imageRoot/categories";
  static const String itemImageRoot = "$imageRoot/items";
  //favorite
  static const String addFav = "$role/favorite/add.php";
  static const String deleteFav = "$role/favorite/delete.php";
  static const String viewFav = "$role/favorite/view.php";
  //cart
  static const String addCart = "$role/cart/add.php";
  static const String subtractCart = "$role/cart/subtract.php";
  static const String viewCart = "$role/cart/view.php";
  static const String removeItemFromCart = "$role/cart/remove.php";
  static const String checkCoupon = "$role/cart/check_coupon.php";
  //search
  static const String searchAllItems = "$role/items/search.php";
  //address
  static const String getGovers = "$role/address/get_governates.php";
  static const String getCities = "$role/address/get_cities.php";
  static const String addAddress = "$role/address/address_add.php";
  static const String editAddress = "$role/address/address_edit.php";
  static const String deleteAddress = "$role/address/address_delete.php";
  static const String viewAddress = "$role/address/address_view.php";
  //orders
  static const String approveOrder = "$role/orders/approve.php";
  static const String prepareOrder = "$role/orders/prepare.php";
  static const String viewOrders = "$role/orders/view.php";
  static const String pendingOrders = "$role//orders/view_pending.php";
  static const String acceptedOrders = "$role/orders/view_accepted.php";
  static const String archiveOrders = "$role/orders/archive.php";
  static const String orderDetails = "$serverLink/users/orders/details.php";

  //offers
  static const String getOffers = "$role/offers.php";
  static const String searchOffers = "$role/offers/search.php";

  static const String viewNotifications = "$serverLink/notifications/view.php";
  //categories
  static const String categoriesView = "$role/categories/view.php";
  static const String addCategory = "$role/categories/add.php";
  static const String editCategory = "$role/categories/update.php";
  static const String deleteCategory = "$role/categories/delete.php";
  //products
  static const String viewProducts = "$role/items/view.php";
  static const String addProduct = "$role/items/add.php";
  static const String editProduct = "$role/items/update.php";
  static const String deleteProduct = "$role/items/delete.php";
  //coupons
  static const String addCoupons = "$role/coupons/add.php";
  static const String editCoupons = "$role/coupons/edit.php";
  static const String viewCoupons = "$role/coupons/view.php";
  static const String deleteCoupon = "$role/coupons/delete.php";

  //test
  static const String addDataLinkApi = "$serverLink/test/addData.php";
  static const String getDataLinkApi = "$serverLink/test/getData.php";
}
