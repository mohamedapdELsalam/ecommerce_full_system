import 'package:ecommerceapp/core/class/crud.dart';
import 'package:ecommerceapp/core/constants/apiLink.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:ecommerceapp/data/model/city_model.dart';
import 'package:ecommerceapp/data/model/govers_model.dart';
import 'package:get/get.dart';

class AddressData {
  Crud crud = Get.find();
  MyServices myServices = Get.find();

  getGoversRequest() async {
    try {
      var response = await crud.getRequest(ApiLinks.getGovers);

      print("response in getcart request : ${response}");

      if (response.isRight()) {
        return response.fold((l) => null, (r) => r);
      } else {
        return response.fold((l) => l, (r) => null);
      }
    } catch (e) {
      print("erorr in getcart request : ${e}");
    }
  }

  getCitiesRequest(String cityId) async {
    try {
      var response =
          await crud.postRequest(ApiLinks.getCities, {"cityId": cityId});

      print("response in getcart request : ${response}");

      if (response.isRight()) {
        return response.fold((l) => null, (r) => r);
      } else {
        return response.fold((l) => l, (r) => null);
      }
    } catch (e) {
      print("erorr in getcart request : ${e}");
    }
  }

  addAddressRequest(GoverModel govermodel, CityModel cityModel, String name,
      String street, double long, double lat) async {
    try {
      var response = await crud.postRequest(ApiLinks.addAddress, {
        "userid": myServices.sharedPref.getInt("user_id").toString(),
        "addressName": name,
        "goverId": govermodel.governoratesId.toString(),
        "cityId": cityModel.citiesId.toString(),
        "street": street,
        "long": long.toString(),
        "lat": lat.toString(),
      });

      print("response in getcart request : ${response}");

      if (response.isRight()) {
        return response.fold((l) => null, (r) => r);
      } else {
        return response.fold((l) => l, (r) => null);
      }
    } catch (e) {
      print("erorr in getcart request : ${e}");
    }
  }

  getAddressesRequest() async {
    try {
      var response = await crud.postRequest(ApiLinks.viewAddress, {
        "userId": myServices.sharedPref.getInt("user_id").toString(),
      });

      print("response in getcart request : ${response}");

      if (response.isRight()) {
        return response.fold((l) => null, (r) => r);
      } else {
        return response.fold((l) => l, (r) => null);
      }
    } catch (e) {
      print("erorr in getcart request : ${e}");
    }
  }

  deleteAddress(int addressId) async {
    try {
      var response = await crud.postRequest(ApiLinks.deleteAddress, {
        "address_id": addressId.toString(),
      });

      print("response in getcart request : ${response}");

      if (response.isRight()) {
        return response.fold((l) => null, (r) => r);
      } else {
        return response.fold((l) => l, (r) => null);
      }
    } catch (e) {
      print("erorr in getcart request : ${e}");
    }
  }
}
