import 'dart:convert';

import 'package:ecommerceapp/core/constants/api_keys.dart';
import 'package:http/http.dart' as http;

class PaymobManager {
  Future<String> getPaymentKey(int amount, String currency) async {
    try {
      String authToken = await _getAuthToken();
      int orderId = await _getOrderId(
          amount: (amount * 100).toString(),
          authToken: authToken,
          currency: currency);
      String paymentKey = await _getPaymentKey(
          amount: (amount * 100).toString(),
          authToken: authToken,
          currency: currency,
          integrationId: ApiKeys.integrationId,
          orderId: orderId.toString());
      return paymentKey;
    } catch (e) {
      print("paymob exeption ==============");
      print("============== : $e");
      return "";
    }
  }

  Future<String> _getAuthToken() async {
    try {
      final http.Response response = await http.post(
          headers: {"Content-Type": "application/json"},
          Uri.parse("https://accept.paymob.com/api/auth/tokens"),
          body: jsonEncode({"api_key": ApiKeys.paymobKey}));
      Map responseBody = jsonDecode(response.body);
      return responseBody["token"];
    } catch (e) {
      print(" get auth token exeption ============");
      print(" exeption : $e");
      return "";
    }
  }

  Future<int> _getOrderId({
    required String authToken,
    required String amount,
    required String currency,
  }) async {
    try {
      final http.Response response = await http.post(
          headers: {"Content-Type": "application/json"},
          Uri.parse("https://accept.paymob.com/api/ecommerce/orders"),
          body: jsonEncode({
            "auth_token": authToken,
            "amount_cents": amount,
            "currency": currency,
            "delivery_needed": "false",
            "items": [],
          }));

      Map responseBody = jsonDecode(response.body);
      return responseBody["id"];
    } catch (e) {
      print(" get order exeption ============");
      print(" exeption : $e");
      return 0;
    }
  }

  Future<String> _getPaymentKey({
    required String authToken,
    required String amount,
    required String currency,
    required String orderId,
    required String integrationId,
  }) async {
    try {
      final http.Response response = await http.post(
          headers: {"Content-Type": "application/json"},
          Uri.parse("https://accept.paymob.com/api/acceptance/payment_keys"),
          body: jsonEncode({
            "auth_token": authToken,
            "amount_cents": amount,
            "currency": currency,
            "order_id": orderId,
            "integration_id": integrationId,
            "expiration": 3600,
            "billing_data": {
              //must be value
              "first_name": "mohamed",
              "last_name": "ahmed",
              "email": "mohammad@gmail.com",
              "phone_number": "01060324571",
              //can set "NA"
              "apartment": "NA",
              "floor": "NA",
              "street": "NA",
              "building": "NA",
              "shipping_method": "NA",
              "postal_code": "NA",
              "city": "NA",
              "country": "NA",
              "state": "NA",
            },
          }));

      Map responseBody = jsonDecode(response.body);
      return responseBody["token"];
    } catch (e) {
      print(" get payment key exeption ============");
      print(" exeption : $e");
      return "";
    }
  }
}
