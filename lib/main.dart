
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:messengar/app/routes/app_pages.dart';
import 'package:messengar/app/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Messenger App",
      initialRoute: AppRoutes.HOME,
      getPages: AppPages.routes,
      theme: ThemeData(
        fontFamily: "Markazi",
        scaffoldBackgroundColor: Colors.white
      ),
    );
  }
}

