import 'package:flutter/material.dart';
import 'package:gestion_entrega_app/pages/client/update/client_update_controller.dart';
import 'package:gestion_entrega_app/widgets/myButtom.dart';
import 'package:gestion_entrega_app/widgets/myTextField.dart';
import 'package:get/get.dart';

class ClientUpdatePage extends StatelessWidget {
  const ClientUpdatePage({super.key});

  @override
  Widget build(BuildContext context) {
    final _con = Get.put(ClientUpdateController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar perfil'),
      ),
      body: Obx(
        () => _con.isData.value
            ? Container(
                width: double.infinity,
                child: SingleChildScrollView(
                    child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    _imageUser(
                      function: _con.showAlertDialog,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    MyTextField(
                      hintText: 'Nombre',
                      textEditingController: _con.nameController,
                      obscureText: false,
                      icon: Icon(
                        Icons.person,
                        color: Colors.red,
                      ),
                      isPrefixIcon: true,
                      issuffixIcon: false,
                    ),
                    MyTextField(
                      hintText: 'Apellido',
                      textEditingController: _con.lastnameController,
                      obscureText: false,
                      icon: Icon(
                        Icons.person,
                        color: Colors.red,
                      ),
                      isPrefixIcon: true,
                      issuffixIcon: false,
                    ),
                    MyTextField(
                      hintText: 'Telefono',
                      textInputType: TextInputType.phone,
                      textEditingController: _con.phoneController,
                      obscureText: false,
                      icon: Icon(
                        Icons.person,
                        color: Colors.red,
                      ),
                      isPrefixIcon: true,
                      issuffixIcon: false,
                    ),
                  ],
                )),
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
      bottomNavigationBar: MyButtom(
        textButtom: 'ACTUALIZAR PERFIL',
        function: _con.updateClient,
        isEnable: _con.isEnable,
      ),
    );
  }
}

class _imageUser extends StatelessWidget {
  final VoidCallback function;

  _imageUser({super.key, required this.function});

  @override
  Widget build(BuildContext context) {
    final _con = Get.find<ClientUpdateController>();
    return GestureDetector(
        onTap: function,
        child: Obx(() => CircleAvatar(
              backgroundImage: _con.imageFile.value != null
                  ? FileImage(_con.imageFile.value!)
                  : _con.user.value!.image != null
                      ? NetworkImage(_con.user.value!.image ?? '')
                      : const AssetImage('assets/img/user_profile_2.png')
                          as ImageProvider,
              radius: 60,
              backgroundColor: Colors.grey.shade200,
            )));
  }
}
