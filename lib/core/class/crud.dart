import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:adminapp/core/class/status_request.dart';
import 'package:adminapp/core/functions/check_internet.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:path/path.dart';

class Crud {
  Future<Either<StatusRequest, Map>> postRequest(String url, Map data) async {
    if (await isOnline() == true) {
      try {
        var response = await http.post(Uri.parse(url), body: data);

        if (response.statusCode == 200 || response.statusCode == 201) {
          print("------- responsebody is : ${response.body}");
          Map responsebody = jsonDecode(response.body);

          print("------------------------------- must return right value");
          return Right(responsebody);
        } else {
          print("------fail");
          return const Left(StatusRequest.serverFailure);
        }
      } catch (e) {
        print(" el error :  $e");
        return const Left(StatusRequest.exceptionFailure);
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

  Future<Either<StatusRequest, Map>> postRequestWithFile(
    String url,
    Map data,
    File file,
  ) async {
    http.MultipartRequest request = http.MultipartRequest(
      "POST",
      Uri.parse(url),
    );
    http.ByteStream stream = http.ByteStream(file.openRead());
    int length = await file.length();
    http.MultipartFile fileRequest = http.MultipartFile(
      "image",
      stream,
      length,
      filename: basename(file.path),
    );

    request.files.add(fileRequest);
    data.forEach((key, value) {
      request.fields[key] = value;
    });
    print("----- iam here");
    http.StreamedResponse myRequest = await request.send();

    http.Response response = await http.Response.fromStream(myRequest);
    if (await isOnline() == false) {
      return const Left(StatusRequest.offlineFailure);
    }
    try {
      if (myRequest.statusCode == 200) {
        print("1");
        print(response.body);
        print("2");
        print("jsonDecode response.body : ${jsonDecode(response.body)}");
        print("3");

        print(" -------- success in file request");

        return Right(jsonDecode(response.body));
      } else {
        print(" -------- fail in file request");
        return const Left(StatusRequest.failure);
      }
    } catch (e) {
      print("----------- error in fileRequest : $e");
      return const Left(StatusRequest.serverFailure);
    }
  }
}
