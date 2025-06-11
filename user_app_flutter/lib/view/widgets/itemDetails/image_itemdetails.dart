import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceapp/controller/items/item_details_controller.dart';
import 'package:ecommerceapp/core/constants/api_links.dart';
import 'package:flutter/material.dart';

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
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(5)),
        child: Hero(
          tag: controller.item.itemsId!,
          child: CachedNetworkImage(
            imageUrl: "${ApiLinks.itemImageRoot}/${controller.item.itemsImage}",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
