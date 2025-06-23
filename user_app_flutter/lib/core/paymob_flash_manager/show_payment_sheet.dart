import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void showPaymentSheet(BuildContext context, String paymentUrl) {
  final controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(Uri.parse(paymentUrl));

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.9,
        child: WebViewWidget(
          controller: controller,
        ),
      );
    },
  );
}
