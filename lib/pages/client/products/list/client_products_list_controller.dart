import 'package:gestion_entrega_app/utils/getx_storage.dart';
import 'package:get/get.dart';

class ClientProductsListController extends GetxController {
  GetxStorageController _getxStorage = GetxStorageController(); // Usa tu clase
  void logout() {
    _getxStorage.logout(Get.context!);
  }
}
