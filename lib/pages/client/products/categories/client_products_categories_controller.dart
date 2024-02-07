import 'package:flutter/material.dart';
import 'package:gestion_entrega_app/models/user.dart';
import 'package:gestion_entrega_app/routers/app_pages.dart';
import 'package:gestion_entrega_app/routers/app_routes.dart';
import 'package:gestion_entrega_app/utils/getx_storage.dart';
import 'package:get/get.dart';

class ClientProductsCategoriesController extends GetxController {
  RxString onSelect = ''.obs;
  Rx<User?> user = Rx<User?>(null);

  GetxStorageController _getxStorage = GetxStorageController(); // Usa tu clase

  void onInit() async {
    _loadUserData();
    super.onInit();
  }

  Future<void> _loadUserData() async {
    user.value = User.fromJson(await _getxStorage.read('user'));
  }

  void logout() {
    _getxStorage.logout(Get.context!);
  }

  void goToPage(side) {
    String page = '$side';

    if (page == 'none') {
      SnackBar(
          content: Center(
        child: Text('UPS , debe seleccionar bien la opcion'),
      ));
      print('ups $page');
    } else {
      Get.offNamed(AppRoutes.ClientProductsList);
    }
  }
}
