import 'package:flutter/material.dart';
import 'package:gestion_entrega_app/models/order.dart';
import 'package:gestion_entrega_app/models/product.dart';
import 'package:gestion_entrega_app/models/subcategory.dart';
import 'package:gestion_entrega_app/models/user.dart';
import 'package:gestion_entrega_app/pages/client/products/detail/client_products_detail_page.dart';
import 'package:gestion_entrega_app/provider/productsProvider.dart';
import 'package:gestion_entrega_app/provider/subcategoriesProvider.dart';
import 'package:gestion_entrega_app/routers/app_routes.dart';
import 'package:gestion_entrega_app/utils/dio_client.dart';
import 'package:gestion_entrega_app/utils/getx_storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class ClientProductsListController extends GetxController {
  GetxStorageController _getxStorage = GetxStorageController(); // Usa tu clase
  GlobalKey<ScaffoldState> key = new GlobalKey<ScaffoldState>();
  SubcategoriesProvider? _subcategoriesProvider;
  ProductsProvider? _productsProvider;
  Order? order;
  RxString idCat = ''.obs;
  Rx<User?> user = Rx<User?>(null);
  RxList<SubCategory> subcategories = <SubCategory>[].obs;
  RxBool isData = false.obs;

  void onInit() async {
    _loadUserData();
    super.onInit();
  }

  Future<void> _loadUserData() async {
    user.value = User.fromJson(await _getxStorage.read('user'));
    _subcategoriesProvider = SubcategoriesProvider(DioClient().instance,
        sessionToken: user.value!.sessionToken!);
    _productsProvider = ProductsProvider(DioClient().instance,
        sessionToken: user.value!.sessionToken!);

    getsubCategories();
    isData.value = true;
  }
  void getsubCategories() async {
    subcategories.value =
        (await   _subcategoriesProvider!.findByCategory(idCat.value))!;
  }

  void openDrawer() {
    key.currentState!.openDrawer();
  }
 

  Future<List<Product?>?> getProducts(String idSubCategory) async {
    return await _productsProvider!.findBySubCategory(idSubCategory);
  }

 
  void logout() {
    _getxStorage.logout(Get.context!);
  }

  void gotoUpdate() {
    Get.toNamed(AppRoutes.ClientUpdate);
  }

  void goToStore() {
    Get.toNamed(AppRoutes.StoreOrdersList);
  }

  void gotoDelivery() {
    Get.toNamed(AppRoutes.DeliveryOrdersList);
  }

  void openBottomSheet(Product product) {
    showMaterialModalBottomSheet(
        context: Get.context!,
        builder: (context) => ClientProductsDetailPage(product: product));
  }
}
