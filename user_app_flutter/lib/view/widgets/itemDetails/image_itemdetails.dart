import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceapp/controller/items/item_details_controller.dart';
import 'package:ecommerceapp/core/class/image_full_screen.dart';
import 'package:ecommerceapp/core/constants/api_links.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageItemDetails extends StatelessWidget {
  const ImageItemDetails({
    super.key,
    required this.controller,
  });

  final ItemsDetailsController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: InkWell(
        onTap: () {
          Get.to(ImageFullScreen(
              path: "${ApiLinks.itemImageRoot}/${controller.item.itemsImage}",
              network: true));
        },
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(5)),
          child: Hero(
            placeholderBuilder: (context, heroSize, child) {
              return SizedBox(
                width: heroSize.width,
                height: heroSize.height,
                child: Center(child: CircularProgressIndicator()),
              );
            },
            flightShuttleBuilder: (context, animation, direction, from, to) {
              return ScaleTransition(
                scale: Tween<double>(begin: 0.95, end: 1.0).animate(
                  CurvedAnimation(parent: animation, curve: Curves.easeInOut),
                ),
                child: FadeTransition(
                  opacity: animation,
                  child: to.widget,
                ),
              );
            },
            tag: controller.item.itemsId!,
            child: CachedNetworkImage(
              filterQuality: FilterQuality.medium,
              imageUrl:
                  "${ApiLinks.itemImageRoot}/${controller.item.itemsImage}",
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
