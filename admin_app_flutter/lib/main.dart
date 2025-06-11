import "package:adminapp/binding/initial_bindings.dart";
import "package:adminapp/core/localizatoin/changeLocal.dart";
import "package:adminapp/core/localizatoin/transulation.dart";
import "package:adminapp/core/services/services.dart";
import "package:adminapp/core/themes/darkTheme.dart";
import "package:adminapp/core/themes/lightTheme.dart";
import "package:adminapp/routes.dart";
import "package:firebase_messaging/firebase_messaging.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

bool testMode = false;
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.messageId}");
  print("Handling a background message: ${message.notification!.title}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      theme: lightTheme(),
      darkTheme: DarkTheme(),
      debugShowCheckedModeBanner: false,
      translations: MyTranslation(),
      initialBinding: InitialBindings(),
      locale: controller.language.value,
      getPages: myPages,
    );
  }
}
