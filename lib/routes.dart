import 'package:adminapp/core/constants/app_routes.dart';
import 'package:adminapp/core/middel_ware.dart';
import 'package:adminapp/view/screens/auth/forgetPassword/forgetPassword.dart';
import 'package:adminapp/view/screens/auth/forgetPassword/resetPassword.dart';
import 'package:adminapp/view/screens/auth/forgetPassword/success_resetPassword.dart';
import 'package:adminapp/view/screens/auth/forgetPassword/verifyCode.dart';
import 'package:adminapp/view/screens/auth/language.dart';
import 'package:adminapp/view/screens/auth/login.dart';
import 'package:adminapp/view/screens/auth/signUp.dart';
import 'package:adminapp/view/screens/auth/success_signUp.dart';
import 'package:adminapp/view/screens/auth/verification_email.dart';
import 'package:adminapp/view/screens/categories/add_category.dart';
import 'package:adminapp/view/screens/categories/view_categories.dart';
import 'package:adminapp/view/screens/categories/edit_category.dart';
import 'package:adminapp/view/screens/homePage.dart';
import 'package:adminapp/view/screens/home_screen.dart';
import 'package:adminapp/view/screens/products/add_product_screen.dart';
import 'package:adminapp/view/screens/products/edit_product_screen.dart';
import 'package:adminapp/view/screens/products/view_products_screen.dart';
import 'package:adminapp/view/screens/onboarding.dart';
import 'package:adminapp/view/screens/orders/all_orders.dart';
import 'package:adminapp/view/screens/orders/archives_orders.dart';
import 'package:adminapp/view/screens/orders/orders_details.dart';
import 'package:adminapp/view/screens/orders/pending_orders.dart';
import 'package:adminapp/view/widgets/products/Image_fullscreen.dart';
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
  GetPage(name: AppRoutes.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoutes.verifyCode, page: () => const VerifyCode()),
  GetPage(name: AppRoutes.resetPassword, page: () => const ResetPassword()),
  GetPage(
    name: AppRoutes.successResetPassword,
    page: () => const SuccessResetPassword(),
  ),
  GetPage(name: AppRoutes.successSignUp, page: () => const SuccessSignUp()),
  GetPage(name: AppRoutes.verifyEmail, page: () => const VerifyEmail()),
  //orders
  GetPage(name: AppRoutes.pendingOrders, page: () => const AllOrdersScreen()),
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
  //products
  GetPage(name: AppRoutes.products, page: () => const ItemsScreen()),
  GetPage(name: AppRoutes.addProducts, page: () => const AddItemScreen()),
  GetPage(name: AppRoutes.editProducts, page: () => const EditProductScreen()),
  //fullScreenImage

];
