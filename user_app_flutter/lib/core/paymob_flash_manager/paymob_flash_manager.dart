import 'dart:convert';
import 'package:ecommerceapp/core/constants/api_keys.dart';
import 'package:http/http.dart' as http;

class PaymobFlashManager {
  static Future<String> createIntention({
    required double amount,
    required List<Map<String, dynamic>> items,
  }) async {
    final url = Uri.parse("https://accept.paymob.com/v1/intention/");
    final response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": ApiKeys.paymobSecretKey,
      },
      body: jsonEncode({
        "amount": amount * 100,
        "currency": "EGP",
        "payment_methods": [5142190, 5142859, 5144993],
        "items": items,
        "billing_data": {
          "apartment": "sympl",
          "first_name": "dumy",
          "last_name": "dumy",
          "street": "dumy",
          "building": "dumy",
          "phone_number": "+201125773493",
          "city": "dumy",
          "country": "EG",
          "email": "dumy@dumy.com",
          "floor": "dumy",
          "state": "dumy"
        },
        "customer": {
          "first_name": "dumy",
          "last_name": "dumy",
          "email": "dumy@dsumy.com",
          "extras": {"re": "22"}
        },
        "extras": {"ee": 22}
      }),
    );
    final body = jsonDecode(response.body);

    try {
      final String clientSecret = body["client_secret"];
      final String publicKey = ApiKeys.paymobPublicKey;

      final String unifiedCheckoutUrl =
          "https://accept.paymob.com/unifiedcheckout/?publicKey=$publicKey&clientSecret=$clientSecret";

      return unifiedCheckoutUrl;
    } catch (e) {
      throw Exception(
          "Intention created but unified checkout url failed: $e\n${body.toString()}");
    }
  }

  static Future<Map<String, dynamic>> retrieveIntention(
      String intentionId) async {
    final url = Uri.parse(
        "https://accept.paymob.com/api/acceptance/intention/$intentionId");

    final response = await http.get(
      url,
      headers: {
        "Authorization": ApiKeys.paymobSecretKey,
      },
    );

    return jsonDecode(response.body);
  }
}
