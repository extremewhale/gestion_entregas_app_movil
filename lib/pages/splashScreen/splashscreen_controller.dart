import 'package:gestion_entrega_app/models/user.dart';
import 'package:gestion_entrega_app/provider/usersProvider.dart';
import 'package:gestion_entrega_app/routers/app_routes.dart';
import 'package:gestion_entrega_app/utils/dio_client.dart';
import 'package:gestion_entrega_app/utils/getx_storage.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  GetxStorageController _getxStorage = GetxStorageController(); // Usa tu clase

  final UsersProvider usersProvider =
      Get.put(UsersProvider(DioClient().instance));

  void onInit() async {
    var userData = await _getxStorage.read('user');
    if (userData == null) {
      Get.offAllNamed(AppRoutes.LOGIN);
      print("No user data in shared preferences.");
    } else {
      User user = User.fromJson(await _getxStorage.read('user') ?? {});
      print('Usuario : ${user.toString()}');

      if (user.sessionToken != null) {
        Get.offAllNamed(AppRoutes.ClientProductsCategories);
      } else {
        Get.offAllNamed(AppRoutes.LOGIN);
      }
    }
    super.onInit();
  }
}
