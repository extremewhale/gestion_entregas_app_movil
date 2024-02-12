import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gestion_entrega_app/models/response_api.dart';
import 'package:gestion_entrega_app/models/user.dart';
import 'package:gestion_entrega_app/provider/usersProvider.dart';
import 'package:gestion_entrega_app/routers/app_routes.dart';
import 'package:gestion_entrega_app/utils/dio_client.dart';
import 'package:gestion_entrega_app/utils/getx_storage.dart';
import 'package:gestion_entrega_app/utils/my_snackbar.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

class ClientUpdateController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  UsersProvider? usersProvider;
  Rx<File?> imageFile = Rx<File?>(null);
  ProgressDialog? _progressDialog;
  bool isEnable = true;
  Rx<User?> user = Rx<User?>(null);
  PickedFile? pickedFile;
  GetxStorageController getxStorageController = GetxStorageController();
  RxBool isData = false.obs;

  @override
  void onInit() async {
    _progressDialog = ProgressDialog(context: Get.context);

    user.value = User.fromJson(await getxStorageController.read('user'));
    usersProvider = Get.put(UsersProvider(DioClient().instance,
        sessionToken: user.value!.sessionToken));

    nameController.text = user.value!.name!;
    lastnameController.text = user.value!.lastname!;
    phoneController.text = user.value!.phone!;
    isData.value = true;
    super.onInit();
  }

  void updateClient() async {
    String name = nameController.text;
    String lastname = lastnameController.text;
    String phone = phoneController.text.trim();

    if (name.isEmpty || lastname.isEmpty || phone.isEmpty) {
      MySnackbar.show('debes ingresar todos los campos');
      return;
    }
    _progressDialog!.show(max: 100, msg: 'Espere un momento ...');
    isEnable = false;
    User myuser = User(
        id: user.value!.id,
        name: name,
        lastname: lastname,
        phone: phone,
        image: user.value!.image);
    try {
      Stream? stream = await usersProvider!.update(myuser, imageFile.value);
      StringBuffer completeResponse = StringBuffer();

      await for (var value in stream!) {
        completeResponse.write(value);
      }

      try {
        ResponseApi responseApi =
            ResponseApi.fromJson(json.decode(completeResponse.toString()));
        print('Este es el mensaje: ${responseApi}');

        Fluttertoast.showToast(msg: responseApi.message!);
        if (responseApi.success == true) {
          user.value = await usersProvider!
              .getById(myuser.id!); // OBTENIENDO EL USUARIO DE LA BD
          print('Usuario obtenido: ${user.toJson()}');
          await getxStorageController.save('user', user.toJson());

          var justSavedUserData = await getxStorageController.read('user');
          print('data guardarda: $justSavedUserData');
          Get.offAllNamed(AppRoutes.ClientProductsCategories);
        } else {
          isEnable = true;
        }
      } catch (e) {
        // Handle JSON decoding error
        print('Error decoding JSON response: $e');
        _progressDialog!.close();
        MySnackbar.show('Error al procesar los datos: $e');
        isEnable = true;
      }
    } catch (e) {
      _progressDialog!.close();
      MySnackbar.show('Error al procesar los datos: $e');
      isEnable = true;
    }
  }

  Future selectImage(ImageSource imageSource) async {
    XFile? pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      imageFile.value = File(pickedFile.path);
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
