import 'package:adminapp/core/constants/app_routes.dart';
import 'package:adminapp/core/middel_ware.dart';
import 'package:adminapp/view/screens/auth/forgetPassword/change_password.dart';
import 'package:adminapp/view/screens/auth/forgetPassword/check_email.dart';
import 'package:adminapp/view/screens/auth/forgetPassword/success_resetPassword.dart';
import 'package:adminapp/view/screens/auth/forgetPassword/verify_code.dart';
import 'package:adminapp/view/screens/auth/language.dart';
import 'package:adminapp/view/screens/auth/login.dart';
import 'package:adminapp/view/screens/auth/signup/check_verifycode_signup.dart';
import 'package:adminapp/view/screens/auth/signup/sign_up.dart';
import 'package:adminapp/view/screens/auth/signup/signup_check_email.dart';
import 'package:adminapp/view/screens/auth/signup/success_signUp.dart';
import 'package:adminapp/view/screens/categories/add_category.dart';
import 'package:adminapp/view/screens/categories/view_categories.dart';
import 'package:adminapp/view/screens/categories/edit_category.dart';
import 'package:adminapp/view/screens/coupon/add_coupon.dart';
import 'package:adminapp/view/screens/coupon/view_coupons.dart';
import 'package:adminapp/view/screens/homePage.dart';
import 'package:adminapp/view/screens/home_screen.dart';
import 'package:adminapp/view/screens/items/add_item_screen.dart';
import 'package:adminapp/view/screens/items/edit_item_screen.dart';
import 'package:adminapp/view/screens/items/view_items_screen.dart';
import 'package:adminapp/view/screens/onboarding.dart';
import 'package:adminapp/view/screens/orders/archives_orders.dart';
import 'package:adminapp/view/screens/orders/order_screen.dart';
import 'package:adminapp/view/screens/orders/orders_details.dart';
import 'package:adminapp/view/screens/orders/pending_orders.dart';
import 'package:adminapp/view/screens/settings/language_settings.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? myPages = [
  //onboarding
  GetPage(
    name: "/",
    page: () => const LanguageScreen(),
    middlewares: [MyMiddleWare(), AuthMiddleWare()],
  ),
  GetPage(name: AppRoutes.onboarding, page: () => const OnBoarding()),
  //auth
  GetPage(name: AppRoutes.login, page: () => const Login()),
  GetPage(name: AppRoutes.signUp, page: () => const SignUp()),
  GetPage(name: AppRoutes.forgetPassword, page: () => const CheckEmail()),
  // GetPage(name: AppRoutes.verifyCode, page: () => const VerifyCodeMaghola()),
  GetPage(name: AppRoutes.resetPassword, page: () => const ResetPassword()),
  GetPage(
    name: AppRoutes.successResetPassword,
    page: () => const SuccessResetPassword(),
  ),
  GetPage(name: AppRoutes.successSignUp, page: () => const SuccessSignUp()),
  GetPage(name: AppRoutes.verifyCode, page: () => const CheckVerifyCode()),
  GetPage(
    name: AppRoutes.signupVerifyEmail,
    page: () => const SignupCheckEmail(),
  ),
  GetPage(
    name: AppRoutes.verifyCodeSignup,
    page: () => const CheckVerifyCodeSignup(),
  ),
  //orders
  GetPage(name: AppRoutes.orderScreen, page: () => const OrdersScreen()),
  // GetPage(name: AppRoutes.pendingOrders, page: () => const AllOrdersScreen()),
  GetPage(
    name: AppRoutes.pendingOrders,
    page: () => const PendingOrdersScreen(),
  ),
  GetPage(name: AppRoutes.archiveOrders, page: () => const OrdersArchive()),
  GetPage(name: AppRoutes.ordersDetails, page: () => const OrdersDetails()),
  GetPage(name: AppRoutes.homePage, page: () => const HomePage()),
  GetPage(name: AppRoutes.homeScreen, page: () => const HomeScreen()),
  //categories
  GetPage(name: AppRoutes.categories, page: () => const CategoriesScreen()),
  GetPage(name: AppRoutes.addCategory, page: () => const AddCategory()),
  GetPage(name: AppRoutes.editCategory, page: () => const EditCategory()),
  //items
  GetPage(name: AppRoutes.items, page: () => const ItemsScreen()),
  GetPage(name: AppRoutes.addItem, page: () => const AddItemScreen()),
  GetPage(name: AppRoutes.editItem, page: () => const EditItemScreen()),
  //settings
  GetPage(
    name: AppRoutes.languageSettings,
    page: () => const LanguageSettings(),
  ),
  //coupons
  GetPage(name: AppRoutes.viewCoupon, page: () => const ViewCoupons()),
  GetPage(name: AppRoutes.addCoupon, page: () => const AddCoupon()),
  // GetPage(name: AppRoutes.editCoupon, page: () => const ()),

  //fullScreenImage
];
