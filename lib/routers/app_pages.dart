import 'package:gestion_entrega_app/pages/client/products/categories/client_products_categories_page.dart';
import 'package:gestion_entrega_app/pages/client/products/list/client_products_list_page.dart';
import 'package:gestion_entrega_app/pages/delivery/orders/list/delivery_orders_list_page.dart';
import 'package:gestion_entrega_app/pages/login/login_page.dart';

import 'package:gestion_entrega_app/pages/register/register_page.dart';
import 'package:gestion_entrega_app/pages/splashScreen/slashscrren.dart';
import 'package:gestion_entrega_app/pages/splashScreen/splashscreen_name.dart';
import 'package:gestion_entrega_app/pages/store/orders/list/store_orders_list_page.dart';
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
    ),
    GetPage(
      name: AppRoutes.ClientProductsList,
      page: () => ClientProductsListPage(),
    ),
    GetPage(
      name: AppRoutes.ClientProductsCategories,
      page: () => ClientProductsCategoriesPage(),
    ),
    GetPage(
      name: AppRoutes.SPLASHSCREEN,
      page: () => SplashScreenPage(),
    ),
    GetPage(
      name: AppRoutes.StoreOrdersList,
      page: () => StoreOrdersListPage(),
    ),
    GetPage(
      name: AppRoutes.DeliveryOrdersList,
      page: () => DeliveryOrdersListPage(),
    ),
  ];
}
