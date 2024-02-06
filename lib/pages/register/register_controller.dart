import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gestion_entrega_app/models/response_api.dart';
import 'package:gestion_entrega_app/models/user.dart';
import 'package:gestion_entrega_app/provider/usersProvider.dart';
import 'package:gestion_entrega_app/routers/app_routes.dart';
import 'package:gestion_entrega_app/utils/my_utils.dart';

import 'package:get/get.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';
import 'package:image_picker/image_picker.dart';

class RegisterController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  final UsersProvider usersProvider =
      Get.put(UsersProvider(DioClient().instance));
  File? imageFile;
  ProgressDialog? _progressDialog;
  bool isEnable = true;
  @override
  void onInit() {
    _progressDialog = ProgressDialog(context: Get.context);
    super.onInit();
  }

  List<User>? user;

  void register() async {
    String email = emailController.text.trim();
    String name = nameController.text;
    String lastname = lastnameController.text;
    String phone = phoneController.text.trim();
    String password = passwordController.text.trim();
    String confirmpassword = confirmpasswordController.text.trim();
    if (email.isEmpty ||
        name.isEmpty ||
        lastname.isEmpty ||
        phone.isEmpty ||
        password.isEmpty ||
        confirmpassword.isEmpty) {
      MySnackbar.show('debes ingresar todos los campos');
      return;
    }
    if (confirmpassword != password) {
      MySnackbar.show('Las contraseñas no coinciden');
      return;
    }
    if (password.length < 6) {
      MySnackbar.show('La contraseña debe tener al menos 6 caracteres');
      return;
    }
    _progressDialog!.show(max: 100, msg: 'Espere un momento ...');
    isEnable = false;
    User user = new User(
        email: email,
        name: name,
        lastname: lastname,
        phone: phone,
        password: password);

    try {
      ResponseApi? responseApi = await usersProvider.create(user);
      if (responseApi == null) {
        MySnackbar.show('Respuesta nula del servidor');
        return;
      }
      print('Respuesta: ${responseApi!.toJson()}');
      _progressDialog!.close();
      MySnackbar.show(responseApi.message!);
      if (responseApi.success!) {
        Future.delayed(const Duration(seconds: 3), () {
          Get.offNamed(AppRoutes.LOGIN);
        });
      } else {
        isEnable = true;
      }
    } catch (e) {
      _progressDialog!.close();
      MySnackbar.show('Error al procesar los datos: $e');
      isEnable = true;
    }
  }

  void goToLoginPage() {
    Get.toNamed(AppRoutes.LOGIN);
  }

  void back() {
    Get.back();
  }

  Future selectImage(ImageSource imageSource) async {
    XFile? pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
    }
    Get.back();
  }

  void showAlertDialog() {
    Widget galleryButton = ElevatedButton(
        onPressed: () {
          selectImage(ImageSource.gallery);
        },
        child: const Text('GALERIA'));
    Widget cameraButton = ElevatedButton(
        onPressed: () {
          selectImage(ImageSource.camera);
        },
        child: const Text('CAMARA'));
    AlertDialog alertDialog = AlertDialog(
      title: const Text('Selecciona tu imagen'),
      actions: [galleryButton, cameraButton],
    );
    Get.dialog(alertDialog);
  }
}
