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
  static const String DeleteCart = "$serverLink/cart/delete.php";
  static const String ViewCart = "$serverLink/cart/view.php";
  //test
  static const String addDataLinkApi = "$serverLink/test/addData.php";
  static const String getDataLinkApi = "$serverLink/test/getData.php";
}
