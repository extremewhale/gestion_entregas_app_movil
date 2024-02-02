import 'package:gestion_entrega_app/routers/app_routes.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  void goToRegisterPage() {
    Get.toNamed(AppRoutes.REGISTER);
  }
  
}
