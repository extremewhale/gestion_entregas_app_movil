import 'package:gestion_entrega_app/routers/app_routes.dart';
import 'package:gestion_entrega_app/utils/getx_storage.dart';
import 'package:get/get.dart';

class DeliveryDrawerController extends GetxController {
  GetxStorageController _getxStorage = GetxStorageController(); // Usa tu clase

  void logout() {
    _getxStorage.logout(Get.context!);
  }

  void gotoDocument() {
    Get.toNamed(AppRoutes.DeliveryDocumentList);
  }

  void goToOrders() {
    Get.toNamed(AppRoutes.DeliveryOrdersList);
  }

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
