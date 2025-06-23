import 'package:ecommerceapp/core/paymob_flash_manager/show_payment_sheet.dart';
import 'package:ecommerceapp/core/paymob_flash_manager/paymob_webview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class OpenPaymentMethos {
  void openPaymentInPage(String url) =>
      Get.to(() => PaymobWebViewScreen(paymentUrl: url));

  void openPaymentInSheet(BuildContext context, String url) =>
      showPaymentSheet(context, url);

  Future<void> openPaymentInBrowser(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }
}
