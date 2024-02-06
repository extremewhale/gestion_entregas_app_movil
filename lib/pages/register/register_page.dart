import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gestion_entrega_app/pages/register/register_controller.dart';
import 'package:gestion_entrega_app/widgets/myButtom.dart';
import 'package:gestion_entrega_app/widgets/myTextField.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _con = Get.put(RegisterController());
    return Scaffold(
        body: Container(
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(top: -80, left: -80, child: _circle()),
          Positioned(top: 65, left: 30, child: _TextRegister()),
          Positioned(top: 60, left: 0, child: _iconBack(function: _con.back)),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 150),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _imageUser(
                    function: () {},
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  MyTextField(
                    hintText: 'Correo electronico',
                    textEditingController: _con.emailController,
                    obscureText: false,
                    icon: Icon(
                      Icons.email,
                      color: Colors.red,
                    ),
                    isPrefixIcon: true,
                    issuffixIcon: false,
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
                  MyTextField(
                    hintText: 'contraseña',
                    textEditingController: _con.passwordController,
                    obscureText: true,
                    icon: Icon(
                      Icons.lock,
                      color: Colors.red,
                    ),
                    isPrefixIcon: true,
                    issuffixIcon: false,
                  ),
                  MyTextField(
                    hintText: 'Confirmar Contraseña',
                    textEditingController: _con.confirmpasswordController,
                    obscureText: true,
                    icon: Icon(
                      Icons.lock,
                      color: Colors.red,
                    ),
                    isPrefixIcon: true,
                    issuffixIcon: false,
                  ),
                  MyButtom(textButtom: 'Registrate', function: _con.register),
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}

class _circle extends StatelessWidget {
  const _circle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      height: 240,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100), color: Colors.red),
    );
  }
}

class _TextRegister extends StatelessWidget {
  const _TextRegister({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      'REGISTER',
      style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 22,
          fontFamily: 'NimbusSans'),
    );
  }
}

class _iconBack extends StatelessWidget {
  VoidCallback function;
  _iconBack({super.key, required this.function});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: function,
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ));
  }
}

class _imageUser extends StatelessWidget {
  VoidCallback function;
  File? imageFile;
  _imageUser({super.key, required this.function, this.imageFile});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: CircleAvatar(
        backgroundImage: imageFile != null
            ? FileImage(imageFile!)
            : const AssetImage('assets/img/user_profile_2.png')
                as ImageProvider,
        radius: 60,
        backgroundColor: Colors.grey.shade200,
      ),
    );
  }
}
