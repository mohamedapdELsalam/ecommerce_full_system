import 'dart:io';

import 'package:adminapp/controller/items/add_item_controller.dart';
import 'package:adminapp/core/constants/image_assets.dart';
import 'package:adminapp/view/screens/categories/edit_category.dart';
import 'package:adminapp/view/widgets/items/Image_fullscreen.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AddImageBlock extends StatelessWidget {
  const AddImageBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GetBuilder<AddItemController>(
        builder:
            (controller) =>
                controller.productImage == null
                    ? InkWell(
                      onTap: () async {
                        await controller.pickImage();
                      },
                      child: DottedBorder(
                        // color: ColorScheme.of(context).primary,
                        child: Container(
                          height: 100,
                          width: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                SvgAssets.addPhoto2,
                                height: 50,
                                color: ColorScheme.of(context).primary,
                              ),
                              Text(
                                "add photo",
                                style: TextTheme.of(
                                  context,
                                ).titleSmall!.copyWith(
                                  color: ColorScheme.of(context).primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                    : Stack(
                      clipBehavior: Clip.none,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.to(
                              () => ImageFullScreen(
                                path: controller.productImage!.path,
                                network: false,
                              ),
                            );
                          },
                          child: SizedBox(
                            height: 200,
                            width: 180,
                            child: Image.file(
                              fit: BoxFit.cover,
                              File(controller.productImage!.path),
                              height: 200,
                            ),
                          ),
                        ),
                        ChangeImageIcon(
                          onPressed: () {
                            controller.pickImage();
                          },
                        ),
                      ],
                    ),
      ),
    );
  }
}
