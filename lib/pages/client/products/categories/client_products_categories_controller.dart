import 'package:flutter/material.dart';
import 'package:gestion_entrega_app/models/category.dart';
import 'package:gestion_entrega_app/models/user.dart';
import 'package:gestion_entrega_app/provider/categoriesProvider.dart';
import 'package:gestion_entrega_app/provider/subcategoriesProvider.dart';
import 'package:gestion_entrega_app/routers/app_pages.dart';
import 'package:gestion_entrega_app/routers/app_routes.dart';
import 'package:gestion_entrega_app/utils/dio_client.dart';
import 'package:gestion_entrega_app/utils/getx_storage.dart';
import 'package:get/get.dart';

class ClientProductsCategoriesController extends GetxController {
  RxString onSelect = ''.obs;
  Rx<User?> user = Rx<User?>(null);
  SubcategoriesProvider? _subcategoriesProvider;
  List<Category>? categories = [];
  CategoriesProvider? _categoriesProvider;
  GetxStorageController _getxStorage = GetxStorageController(); // Usa tu clase
  RxBool ismincategories = false.obs;

  void onInit() async {
    _loadUserData();
    super.onInit();
  }

  Future<void> _loadUserData() async {
    user.value = User.fromJson(await _getxStorage.read('user'));
    _categoriesProvider = CategoriesProvider(DioClient().instance,
        sessionToken: user.value!.sessionToken!);
    _subcategoriesProvider = SubcategoriesProvider(DioClient().instance,
        sessionToken: user.value!.sessionToken!);
    getCategories();
  }

  void getCategories() async {
    categories = await _categoriesProvider!.getAll();
    if (categories != null) {
      print('Esta es la categoría ${categories!.length}');
      if (categories!.length <= 6) {
        ismincategories.value = true;
      }
    } else {
      // Manejar el caso en el que la lista de categorías sea nula
      print('Error al obtener las categorías');
    }
  }

  void logout() {
    _getxStorage.logout(Get.context!);
  }

  void gotoUpdate() {
    Get.toNamed(AppRoutes.ClientUpdate);
  }

  void goToPage(String idCategory) {
    print('esta es el id de la categoria : $idCategory');
    if (idCategory == '-1') {
      SnackBar(
          content: Center(
        child: Text('UPS , hubo un error'),
      ));
    } else if (idCategory == '-2') {
      SnackBar(
          content: Center(
        child: Text('UPS , debe seleccionar bien la opcion'),
      ));
    } else {
      Get.toNamed(AppRoutes.ClientProductsList,
          arguments: {'idCategory': idCategory});
    }
  }
}
