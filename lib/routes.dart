import 'package:ecommerceapp/core/middel_ware.dart';
import 'package:ecommerceapp/view/screens/favorite_screen.dart';
import 'package:ecommerceapp/view/screens/cart_screen.dart';
import 'package:ecommerceapp/view/screens/home_screen.dart';
import 'package:ecommerceapp/view/screens/homepage.dart';
import 'package:ecommerceapp/view/screens/auth/forgetPassword/forgetPassword.dart';
import 'package:ecommerceapp/view/screens/auth/forgetPassword/success_resetPassword.dart';
import 'package:ecommerceapp/view/screens/auth/login.dart';
import 'package:ecommerceapp/view/screens/auth/forgetPassword/verifyCode.dart';
import 'package:ecommerceapp/view/screens/auth/success_signUp.dart';
import 'package:ecommerceapp/view/screens/auth/verification_email.dart';
import 'package:ecommerceapp/view/screens/item_detail.dart';
import 'package:ecommerceapp/view/screens/items_screen.dart';
import 'package:ecommerceapp/view/screens/onboarding.dart';
import 'package:ecommerceapp/core/constants/app_routes.dart';
import 'package:ecommerceapp/view/screens/profile_screen.dart';
import 'package:ecommerceapp/view/screens/test_view.dart';
import 'package:ecommerceapp/view/screens/settings_screen.dart';
import 'package:get/get.dart';
import 'view/screens/auth/language.dart';
import 'view/screens/auth/forgetPassword/resetPassword.dart';
import 'view/screens/auth/signUp.dart';

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
  GetPage(name: AppRoutes.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoutes.verifyCode, page: () => const VerifyCode()),
  GetPage(name: AppRoutes.resetPassword, page: () => const ResetPassword()),
  GetPage(
      name: AppRoutes.successResetPassword,
      page: () => const SuccessResetPassword()),
  GetPage(name: AppRoutes.successSignUp, page: () => const SuccessSignUp()),
  GetPage(name: AppRoutes.verifyEmail, page: () => const VerifyEmail()),

  GetPage(name: AppRoutes.homePage, page: () => const HomePage()),
  GetPage(name: AppRoutes.homeScreen, page: () => const HomeScreen()),
  GetPage(name: AppRoutes.favoriteScreen, page: () => const FavoriteScreen()),
  GetPage(name: AppRoutes.settingsScreen, page: () => const SettingsScreen()),
  GetPage(name: AppRoutes.profileScreen, page: () => const ProfileScreen()),
  GetPage(name: AppRoutes.cartScreen, page: () => const CartScreen()),
  GetPage(name: AppRoutes.items, page: () => const ItemsScreen()),
  GetPage(name: AppRoutes.itemDetails, page: () => const itemDetails()),
  GetPage(name: AppRoutes.test, page: () => const Test()),
];
