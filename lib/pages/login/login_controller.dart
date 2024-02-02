import 'package:flutter/material.dart';
import 'package:gestion_entrega_app/routers/app_routes.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  void goToRegisterPage() {
    Get.toNamed(AppRoutes.REGISTER);
  }

  void login() {
    print('hola login');
  }
}
