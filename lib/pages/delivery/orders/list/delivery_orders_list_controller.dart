import 'package:gestion_entrega_app/models/user.dart';
import 'package:gestion_entrega_app/routers/app_routes.dart';
import 'package:gestion_entrega_app/utils/getx_storage.dart';
import 'package:get/get.dart';

class DeliveryOrdersListController extends GetxController {
  GetxStorageController _getxStorage = GetxStorageController(); // Usa tu clase
  Rx<User?> user = Rx<User?>(null);
  void logout() {
    _getxStorage.logout(Get.context!);
  }

  void gotoDocument() {}
  void goToClient() {
    Get.toNamed(AppRoutes.ClientProductsCategories);
  }

  void goToStore() {
    Get.toNamed(AppRoutes.StoreOrdersList);
  }

  void gotoDelivery() {
    Get.toNamed(AppRoutes.DeliveryOrdersList);
  }
}
