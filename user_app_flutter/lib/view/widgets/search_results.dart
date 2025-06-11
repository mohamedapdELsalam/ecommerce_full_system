import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceapp/core/constants/api_links.dart';
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
                            height: 80,
                            width: 40,
                            fit: BoxFit.cover,
                            imageUrl:
                                "${ApiLinks.itemImageRoot}/${itemModel.itemsImage}")),
                    Expanded(
                      flex: 2,
                      child: ListTile(
                        subtitle: Text("${itemModel.itemsPrice}"),
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
