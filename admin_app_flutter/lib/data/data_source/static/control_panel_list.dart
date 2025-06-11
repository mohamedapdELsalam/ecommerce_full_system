import 'package:adminapp/core/constants/app_routes.dart';
import 'package:adminapp/core/constants/image_assets.dart';
import 'package:adminapp/data/model/control_panel_model.dart';
import 'package:get/route_manager.dart';

List<ControlPanelCardModel> controlPanelList = [
  ControlPanelCardModel(
    title: "products",
    url: SvgAssets.jacket,
    onTap: () {
      Get.toNamed(AppRoutes.items);
    },
  ),
  ControlPanelCardModel(
    title: "orders",
    url: SvgAssets.boxes,
    onTap: () {
      Get.toNamed(AppRoutes.orderScreen);
    },
  ),
  ControlPanelCardModel(
    title: "coupons",
    url: SvgAssets.coupons,
    onTap: () {
      Get.toNamed(AppRoutes.viewCoupon);
    },
  ),
  ControlPanelCardModel(
    title: "categories",
    url: SvgAssets.yellowCateg,
    onTap: () {
      Get.toNamed(AppRoutes.categories);
    },
  ),
  ControlPanelCardModel(
    title: "notifications",
    url: SvgAssets.purpleNotification,
    onTap: () {},
  ),
  ControlPanelCardModel(title: "users", url: SvgAssets.cash, onTap: () {}),
  ControlPanelCardModel(
    title: "statistics",
    url: SvgAssets.redStatictis,
    onTap: () {},
  ),
];
