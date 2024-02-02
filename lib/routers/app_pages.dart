import 'package:gestion_entrega_app/pages/login/login_page.dart';

import 'package:gestion_entrega_app/pages/register/register_page.dart';
import 'package:gestion_entrega_app/routers/app_routes.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => LoginPage(),
    ),
    GetPage(
      name: AppRoutes.REGISTER,
      page: () => RegisterPage(),
    )
  ];
}
