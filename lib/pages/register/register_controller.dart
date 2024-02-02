import 'package:gestion_entrega_app/models/user.dart';
import 'package:gestion_entrega_app/provider/usersProvider.dart';
import 'package:gestion_entrega_app/routers/app_routes.dart';
import 'package:gestion_entrega_app/utils/dio_client.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final UsersProvider _usersProvider =
      Get.put(UsersProvider(DioClient().instance));

  List<User>? user;

  void getAll() async {
    try {
      // Intenta obtener todos los usuarios
      user = await _usersProvider.getAll();
      if (user!.isNotEmpty) {
        // Si hay usuarios, imprime la cantidad
        print('Se encontraron ${user!.length} usuarios');
        user!.forEach((user) => print(user.toJson()));
      } else {
       
        print('No se encontraron usuarios');
      }
    } catch (e) {
      // Si hay un error al obtener los usuarios, imprime el error
      print('Error al obtener usuarios: $e');
    }
  }

  void goToLoginPage() {
    Get.toNamed(AppRoutes.LOGIN);
  }
}
