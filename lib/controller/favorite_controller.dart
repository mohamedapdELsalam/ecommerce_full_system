import 'package:ecommerceapp/data/data_source/remote/favorite_data.dart';
import 'package:get/get.dart';

class FavoriteController extends GetxController {
  Map isFavorite = {};
  FavoriteData favoriteData = FavoriteData();

  addtoFavorite(itemId) {
    favoriteData.addFavorite(itemId);
  }

  deleteFromFavorite(itemId) {
    favoriteData.deleteFavorite(itemId);
  }

  setFavorite(id, val) {
    isFavorite[id] = val;
    update();
  }
}
