import 'package:flutter/material.dart';
import 'package:gestion_entrega_app/utils/getx_storage.dart';
import 'package:get/get.dart';

class ClientProductsCategoriesController extends GetxController {
  String onSelect = '';
  GetxStorageController _getxStorage = GetxStorageController(); // Usa tu clase

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
      print('esta es la pagina $page');
    }
  }
}
