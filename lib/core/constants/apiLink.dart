class ApiLinks {
  static const String serverLink = "http://192.168.1.3/ecommerceApi";
  //auth
  static const String loginLinkApi = "$serverLink/auth/login.php";
  static const String signLinkApi = "$serverLink/auth/signup.php";
  //homepage
  static const String homePageLinkApi = "$serverLink/homepage.php";
  //images
  static const String imageRoot = "$serverLink/upload";
  static const String categoryRoot = "$imageRoot/categories";
  static const String itemRoot = "$imageRoot/items";

  //test
  static const String addDataLinkApi = "$serverLink/test/addData.php";
  static const String getDataLinkApi = "$serverLink/test/getData.php";
}
