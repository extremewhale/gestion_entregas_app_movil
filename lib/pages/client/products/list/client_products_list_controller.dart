import 'package:gestion_entrega_app/models/user.dart';
import 'package:gestion_entrega_app/utils/getx_storage.dart';
import 'package:get/get.dart';

class ClientProductsListController extends GetxController {
  GetxStorageController _getxStorage = GetxStorageController(); // Usa tu clase
  Rx<User?> user = Rx<User?>(null);
  void logout() {
    _getxStorage.logout(Get.context!);
  }

  void onInit() async {
    _loadUserData();
    super.onInit();
  }

  Future<void> _loadUserData() async {
    user.value = User.fromJson(await _getxStorage.read('user'));
  }
}
