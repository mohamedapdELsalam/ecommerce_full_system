import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceapp/core/constants/api_links.dart';
import 'package:ecommerceapp/core/screen_dimensions.dart';
import 'package:ecommerceapp/data/model/items_model.dart';
import 'package:flutter/material.dart';

class SearchResults extends StatelessWidget {
  final List itemsList;
  const SearchResults({
    required this.itemsList,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: itemsList.length,
          itemBuilder: (context, index) {
            ItemsModel itemModel = itemsList[index];
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Card(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                        flex: 1,
                        child: CachedNetworkImage(
                            height: Responsible.isMobile(context)
                                ? 80
                                : Responsible.isDesktop(context)
                                    ? 120
                                    : 130,
                            fit: BoxFit.cover,
                            imageUrl:
                                "${ApiLinks.itemImageRoot}/${itemModel.itemsImage}")),
                    Expanded(
                      flex: Responsible.isMobile(context)
                          ? 2
                          : Responsible.isDesktop(context)
                              ? 3
                              : 4,
                      child: ListTile(
                        trailing: Text("${itemModel.finalPrice.toString()} \$"),
                        subtitle: Row(
                          children: [
                            Text("${itemModel.itemsPrice}"),
                            SizedBox(width: 5),
                            if (itemModel.itemsDiscount != 0)
                              Text(
                                " ${itemModel.itemsPrice} LE",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        decoration: TextDecoration.lineThrough,
                                        color: Colors.blueGrey),
                              ),
                          ],
                        ),
                        title: Text("${itemModel.itemsNameEn}"),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
