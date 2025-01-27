import 'dart:io';
import 'package:ecommerceapp/bindings/initial_bindings.dart';
import 'package:ecommerceapp/core/localizatoin/transulation.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:ecommerceapp/core/themes/darkTheme.dart';
import 'package:ecommerceapp/core/themes/lightTheme.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/localizatoin/changeLocal.dart';
import 'routes.dart';

bool testMode = false;

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  print("Handling a background message: ${message.messageId}");
  print("Handling a background message: ${message.notification!.title}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initialServices();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // HttpOverrides.global = MyHttpOverrides();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      locale: controller.language,
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      theme: lightTheme(),
      darkTheme: DarkTheme(),
      themeMode: ThemeMode.light,
      getPages: myPages,
      initialBinding: InitialBindings(),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
