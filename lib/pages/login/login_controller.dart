import 'package:flutter/material.dart';
import 'package:gestion_entrega_app/models/response_api.dart';
import 'package:gestion_entrega_app/models/user.dart';
import 'package:gestion_entrega_app/provider/usersProvider.dart';
import 'package:gestion_entrega_app/routers/app_routes.dart';
import 'package:gestion_entrega_app/utils/my_utils.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GetxStorageController _getxStorage = GetxStorageController(); // Usa tu clase

  final UsersProvider usersProvider =
      Get.put(UsersProvider(DioClient().instance));

  void goToRegisterPage() {
    Get.toNamed(AppRoutes.REGISTER);
  }

  void login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    ResponseApi? responseApi = await usersProvider.login(email, password);

    if (responseApi == null) {
      MySnackbar.show('no hay respuesta de parte del servidor');
      return;
    } else {
      if (responseApi.success == true) {
        User user = User.fromJson(responseApi.data);
        await _getxStorage.save('user', user.toJson());

        var justSavedUserData = await _getxStorage.read('user');
        print('Just saved user data: $justSavedUserData');

        print('USUARIO LOGEADO: ${user.toJson()}');

        Get.offAllNamed(AppRoutes.ClientProductsCategories);
      } else {
        MySnackbar.show(responseApi.message!);
      }
      print('respuesta object: ${responseApi}');
      print('Respuesta: ${responseApi.toJson()}');
    }
  }
}
