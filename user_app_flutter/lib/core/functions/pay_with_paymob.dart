import 'package:ecommerceapp/core/paymob_manager/paymob_manager.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> payWithPaymob() async {
  PaymobManager().getPaymentKey(50, "EGP").then((String paymentKey) {
    launchUrl(Uri.parse(
        "https://accept.paymob.com/api/acceptance/iframes/931903?payment_token=$paymentKey"));
  });
}
