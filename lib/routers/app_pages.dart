import 'package:gestion_entrega_app/pages/client/products/categories/client_products_categories_page.dart';
import 'package:gestion_entrega_app/pages/client/products/list/client_products_list_page.dart';
import 'package:gestion_entrega_app/pages/client/update/client_update_page.dart';
import 'package:gestion_entrega_app/pages/delivery/documents/list/delivery_documents_list_page.dart';
import 'package:gestion_entrega_app/pages/delivery/orders/list/delivery_orders_list_page.dart';
import 'package:gestion_entrega_app/pages/login/login_page.dart';

import 'package:gestion_entrega_app/pages/register/register_page.dart';
import 'package:gestion_entrega_app/pages/splashScreen/slashscrren.dart';
import 'package:gestion_entrega_app/pages/splashScreen/splashscreen_name.dart';
import 'package:gestion_entrega_app/pages/store/inventory/list/store_inventory_list_page.dart';
import 'package:gestion_entrega_app/pages/store/orders/list/store_orders_list_page.dart';
import 'package:gestion_entrega_app/pages/store/wallet/createCard/store_wallet_createCard_page.dart';
import 'package:gestion_entrega_app/pages/store/wallet/dashboard/store_wallet_dashboard_page.dart';
import 'package:gestion_entrega_app/routers/app_routes.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.SPLASHSCREEN,
      page: () => SplashScreenPage(),
    ),
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => LoginPage(),
    ),
    GetPage(
      name: AppRoutes.REGISTER,
      page: () => RegisterPage(),
    ),
    // CLIENT PRODUCTS
    GetPage(
      name: AppRoutes.ClientProductsList,
      page: () => ClientProductsListPage(),
    ),
    GetPage(
      name: AppRoutes.ClientProductsCategories,
      page: () => ClientProductsCategoriesPage(),
    ),
    GetPage(
      name: AppRoutes.ClientUpdate,
      page: () => ClientUpdatePage(),
    ),

    // DELIVERY
    GetPage(
      name: AppRoutes.DeliveryOrdersList,
      page: () => DeliveryOrdersListPage(),
    ),
    GetPage(
      name: AppRoutes.DeliveryDocumentList,
      page: () => DeliveryDocumentsListPage(),
    ),

    // STORE
    GetPage(
      name: AppRoutes.StoreOrdersList,
      page: () => StoreOrdersListPage(),
    ),
    GetPage(
      name: AppRoutes.StoreInventoryList,
      page: () => StoreInventoryListPage(),
    ),
    GetPage(
      name: AppRoutes.StoreWalletCreateCard,
      page: () => StoreWalletCreateCardPage(),
    ),
    GetPage(
      name: AppRoutes.StoreWalletDashboard,
      page: () => StoreWalletDashboardPage(),
    ),
  ];
}
