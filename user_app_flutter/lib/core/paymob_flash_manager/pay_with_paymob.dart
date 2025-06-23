import 'package:ecommerceapp/core/paymob_flash_manager/open_payment_methods.dart';
import 'package:ecommerceapp/core/paymob_flash_manager/paymob_flash_manager.dart';
import 'package:flutter/material.dart';

Future<void> payWithPaymobFlash(
    {required BuildContext context,
    required double amount,
    List<Map<String, dynamic>>? items}) async {
  try {
    final redirectionUrl =
        await PaymobFlashManager.createIntention(amount: amount, items: items!);
    OpenPaymentMethos().openPaymentInPage(redirectionUrl);
    // OpenPaymentMethos().openPaymentInBrowser(redirectionUrl);
    // OpenPaymentMethos().openPaymentInSheet(context, redirectionUrl);
  } catch (e) {
    print("Failed to start unified checkout: $e");
  }
}
