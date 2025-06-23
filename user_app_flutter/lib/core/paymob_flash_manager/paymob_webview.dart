import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymobWebViewScreen extends StatefulWidget {
  final String paymentUrl;
  const PaymobWebViewScreen({super.key, required this.paymentUrl});

  @override
  State<PaymobWebViewScreen> createState() => _PaymobWebViewScreenState();
}

class _PaymobWebViewScreenState extends State<PaymobWebViewScreen> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.white)
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (url) {
          print("🔄 Loading: $url");
        },
        onPageFinished: (url) {
          print("✅ Loaded: $url");
        },
        onWebResourceError: (error) {
          print("❌ WebView error: $error");
        },
      ))
      ..loadRequest(Uri.parse(widget.paymentUrl));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        'إتمام الدفع',
        style: TextStyle(color: Colors.blueAccent),
      )),
      body: SafeArea(
        child: WebViewWidget(controller: _controller),
      ),
    );
  }
}
