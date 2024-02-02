import 'package:flutter/material.dart';
import 'package:gestion_entrega_app/pages/register/register_controller.dart';
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
          // Positioned(top: -80, left: -80, child: _circle()),
          // Positioned(top: 65, left: 30, child: _textRegister()),
          // Positioned(top: 60, left: 0, child: _iconBack()),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 150),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // _imageUser(),
                  SizedBox(
                    height: 30,
                  ),
                  MyTextField(
                    hintText: 'Correo electronico',
                    textEditingController: _con.emailController,
                    obscureText: false,
                    color: Colors.red,
                    icon: Icon(
                      Icons.email,
                      color: Colors.red,
                    ),
                    isPrefixIcon: true,
                    issuffixIcon: false,
                  ),
                  // _textFieldName(),
                  // _textFieldLastName(),
                  MyTextField(
                    hintText: 'contraseña',
                    textEditingController: _con.passwordController,
                    obscureText: true,
                    color: Colors.red,
                    icon: Icon(
                      Icons.lock,
                      color: Colors.red,
                    ),
                    isPrefixIcon: true,
                    issuffixIcon: false,
                  ),
                  MyTextField(
                    hintText: 'contraseña',
                    textEditingController: _con.passwordController,
                    obscureText: true,
                    color: Colors.red,
                    icon: Icon(
                      Icons.lock,
                      color: Colors.red,
                    ),
                    isPrefixIcon: true,
                    issuffixIcon: false,
                  ),
                  // _textFieldConfirmPassword(),
                  // _buttonRegister()
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
