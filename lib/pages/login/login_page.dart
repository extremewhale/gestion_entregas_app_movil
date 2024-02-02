import 'package:flutter/material.dart';
import 'package:gestion_entrega_app/pages/login/login_controller.dart';
import 'package:gestion_entrega_app/widgets/myButtom.dart';
import 'package:gestion_entrega_app/widgets/myTextField.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _con = Get.put(LoginController());
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.infinity,
          child: Stack(
            children: [
              Positioned(top: -80, left: -100, child: _circleLogin()),
              Positioned(top: 60, left: 25, child: _TextLogin()),
              SingleChildScrollView(
                child: Column(
                  children: [
                    _lottieAnimation(),
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
                    MyButtom(
                        textButtom: 'Ingresar',
                        color: Colors.red,
                        function: () {}),
                    _textDontHaveAccount(
                      function: _con.login,
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

class _circleLogin extends StatelessWidget {
  const _circleLogin({
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

class _TextLogin extends StatelessWidget {
  const _TextLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      'LOGIN',
      style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 22,
          fontFamily: 'NimbusSans'),
    );
  }
}

class _lottieAnimation extends StatelessWidget {
  const _lottieAnimation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: 180, bottom: MediaQuery.of(context).size.height * 0.17),
      child: Lottie.asset('assets/json/delivery.json',
          width: 350, height: 200, fit: BoxFit.fill),
    );
  }
}

class _textDontHaveAccount extends StatelessWidget {
  Function function;
  _textDontHaveAccount({super.key, required this.function});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('¿No tienes cuenta?',
            style: TextStyle(
                color: const Color.fromARGB(255, 255, 255, 255), fontSize: 17)),
        const SizedBox(
          width: 7,
        ),
        GestureDetector(
          onTap: function(),
          child: Text(
            'Registrate',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 255, 255, 254),
                fontSize: 17),
          ),
        )
      ],
    );
  }
}
