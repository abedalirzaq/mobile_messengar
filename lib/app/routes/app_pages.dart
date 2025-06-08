import 'package:get/get.dart';
import 'package:messengar/app/modules/Home/bindings/home_binding.dart';
import 'package:messengar/app/modules/Home/views/Home_screen.dart';
import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.HOME,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
  ];
}

