import 'package:ecommerceapp/core/middel_ware.dart';
import 'package:ecommerceapp/view/screens/auth/forgetPassword/verify_code.dart';
import 'package:ecommerceapp/view/screens/auth/signup/signup_check_email.dart';
import 'package:ecommerceapp/view/screens/contact_screen.dart';
import 'package:ecommerceapp/view/screens/address/address_add_location.dart';
import 'package:ecommerceapp/view/screens/address/address_add_step2.dart';
import 'package:ecommerceapp/view/screens/address/address_view.dart';
import 'package:ecommerceapp/view/screens/checkout_screen.dart';
import 'package:ecommerceapp/view/screens/favorite_screen.dart';
import 'package:ecommerceapp/view/screens/cart_screen.dart';
import 'package:ecommerceapp/view/screens/home_screen.dart';
import 'package:ecommerceapp/view/screens/homepage.dart';
import 'package:ecommerceapp/view/screens/auth/forgetPassword/check_email.dart';
import 'package:ecommerceapp/view/screens/auth/forgetPassword/success_resetPassword.dart';
import 'package:ecommerceapp/view/screens/auth/login.dart';
import 'package:ecommerceapp/view/screens/auth/signup/success_signUp.dart';
import 'package:ecommerceapp/view/screens/auth/signup/check_verifycode_signup.dart';
import 'package:ecommerceapp/view/screens/item_detail.dart';
import 'package:ecommerceapp/view/screens/items_screen.dart';
import 'package:ecommerceapp/view/screens/notification_screen.dart';
import 'package:ecommerceapp/view/screens/onboarding.dart';
import 'package:ecommerceapp/core/constants/app_routes.dart';
import 'package:ecommerceapp/view/screens/orders/order_tracking.dart';
import 'package:ecommerceapp/view/screens/orders/ordersScreen.dart';
import 'package:ecommerceapp/view/screens/orders/orders_archive.dart';
import 'package:ecommerceapp/view/screens/orders/orders_details.dart';
import 'package:ecommerceapp/view/screens/profile_screen.dart';
import 'package:ecommerceapp/view/screens/settings/language_settings.dart';
import 'package:ecommerceapp/view/screens/test_view.dart';
import 'package:ecommerceapp/view/screens/settings_screen.dart';
import 'package:get/get.dart';
import 'view/screens/auth/language.dart';
import 'view/screens/auth/forgetPassword/change_password.dart';
import 'view/screens/auth/signup/signUp.dart';

List<GetPage<dynamic>>? myPages = [
  //onboarding
  GetPage(
      name: "/",
      page: () => const LanguageScreen(),
      middlewares: [MyMiddleWare(), AuthMiddleWare()]),
  GetPage(name: AppRoutes.onboarding, page: () => const OnBoarding()),
  //auth
  GetPage(name: AppRoutes.login, page: () => const Login()),
  GetPage(name: AppRoutes.signUp, page: () => const SignUp()),
  GetPage(name: AppRoutes.forgetPassword, page: () => const CheckEmail()),
  // GetPage(name: AppRoutes.verifyCode, page: () => const VerifyCodeMaghola()),
  GetPage(name: AppRoutes.resetPassword, page: () => const ResetPassword()),
  GetPage(
      name: AppRoutes.successResetPassword,
      page: () => const SuccessResetPassword()),
  GetPage(name: AppRoutes.successSignUp, page: () => const SuccessSignUp()),
  GetPage(name: AppRoutes.verifyCode, page: () => const CheckVerifyCode()),
  GetPage(
      name: AppRoutes.signupVerifyEmail, page: () => const SignupCheckEmail()),
  GetPage(
      name: AppRoutes.verifyCodeSignup,
      page: () => const CheckVerifyCodeSignup()),
//homepage
  GetPage(name: AppRoutes.homePage, page: () => const HomePage()),
  GetPage(name: AppRoutes.homeScreen, page: () => const HomeScreen()),
  GetPage(name: AppRoutes.favoriteScreen, page: () => const FavoriteScreen()),
  GetPage(name: AppRoutes.settingsScreen, page: () => const SettingsScreen()),
  GetPage(name: AppRoutes.profileScreen, page: () => const ProfileScreen()),
  GetPage(name: AppRoutes.cartScreen, page: () => const CartScreen()),
  GetPage(name: AppRoutes.items, page: () => const ItemsScreen()),
  GetPage(name: AppRoutes.itemDetails, page: () => const ItemDetails()),
  //address
  GetPage(name: AppRoutes.addressView, page: () => const AddressView()),
  GetPage(
      name: AppRoutes.addAddressLocation,
      page: () => const AddressAddLocation()),
  GetPage(name: AppRoutes.addAddressStep2, page: () => const AddAddressStep2()),
  //checkout
  GetPage(name: AppRoutes.checkout, page: () => const CheckoutScreen()),
  //orders
  GetPage(name: AppRoutes.orders, page: () => const OrdersScreen()),
  GetPage(name: AppRoutes.archiveOrders, page: () => const OrdersArchive()),
  GetPage(name: AppRoutes.ordersDetails, page: () => const OrdersDetails()),
  GetPage(name: AppRoutes.orderTracking, page: () => const OrderTracking()),

  //contact
  GetPage(name: AppRoutes.contact, page: () => const ContactScreen()),
  //settings
  GetPage(
      name: AppRoutes.languageSettings, page: () => const LanguageSettings()),

  GetPage(name: AppRoutes.notification, page: () => const NotificationScreen()),

  GetPage(name: AppRoutes.test, page: () => const Test()),
];
