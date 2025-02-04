import 'package:dartz/dartz.dart';
import 'package:ecommerceapp/core/class/status_request.dart';
import 'package:ecommerceapp/core/functions/check_internet.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Crud {
  Future<Either<StatusRequest, Map>> postRequest(String url, Map data) async {
    if (/*await isOnline() ==*/ true) {
      try {
        var response = await http.post(Uri.parse(url), body: data);
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responsebody = jsonDecode(response.body);

          print(
              "mohamed mooooooooooooooo ====== responsebody is : $responsebody");
          print(
              "=========================================== must return right value");
          return Right(responsebody);
        } else {
          print("fail");
          return const Left(StatusRequest.serverFailure);
        }
      } catch (e) {
        print(" el error :  $e");
        print("في خطأ ما");
        return const Left(StatusRequest.serverFailure);
      }
    } else {
      print("you are offline dont cry");
      return const Left(StatusRequest.offlineFailure);
    }
  }

  Future<Either<StatusRequest, Map>> getRequest(String url) async {
    var response = await http.get(Uri.parse(url));
    try {
      if (await isOnline()) {
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responsebody = jsonDecode(response.body);
          return Right(responsebody);
        } else {
          return const Left(StatusRequest.serverFailure);
        }
      } else {
        return const Left(StatusRequest.offlineFailure);
      }
    } catch (e) {
      return const Left(StatusRequest.serverFailure);
    }
  }
}

class OldCrud {
  postRequest(String url, Map data) async {
    try {
      var response = await http.post(Uri.parse(url), body: data);

      if (response.statusCode == 200 || response.statusCode == 201) {
        var responsebody = response.body;
        return jsonDecode(responsebody);
      } else {
        print("error");
      }
    } catch (e) {
      print("===== e: $e");
    }
  }
}
