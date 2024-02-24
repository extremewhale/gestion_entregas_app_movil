import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gestion_entrega_app/models/category.dart';
import 'package:gestion_entrega_app/pages/client/drawerClient/client_drawer_page.dart';
import 'package:gestion_entrega_app/pages/client/products/categories/client_products_categories_controller.dart';
import 'package:get/get.dart';
import 'package:vector_math/vector_math_64.dart' show Vector2;
import 'package:cubixd/cubixd.dart';

class ClientProductsCategoriesPage extends StatelessWidget {
  const ClientProductsCategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    final _con = Get.put(ClientProductsCategoriesController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          'Seleccione una categoria',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Anta',
          ),
        ),
      ),
      drawer: const ClientDrawerPage(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/img/fondo.png"),
            fit: BoxFit.fill)
        ),
        margin: const EdgeInsets.all(0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(
                () => _con.ismincategories.value
                    ? _cubix(
                        con: _con,
                        categorias: _con.categories,
                      )
                    : const _cubixPlaceholder(),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class _cubix extends StatelessWidget {
  final List<Category?>? categorias;
  const _cubix(
      // ignore: unused_element
      {super.key,
      required ClientProductsCategoriesController con,
      this.categorias})
      : _con = con;

  final ClientProductsCategoriesController _con;

  @override
  Widget build(BuildContext context) {
    return CubixD(
      size: 200.0,
      // onSelected: (SelectedSide opt, Vector2 delta) {

      //   _con.goToPage(opt);

      //   print('On selected callback:\n\topt = ${opt}\n\tdelta = ${delta}');
      // },
      onSelected: (side, delta) {
        switch (side) {
          case SelectedSide.top:
            _con.goToPage(categorias?[0]?.id ?? '-1');
          case SelectedSide.bottom:
            _con.goToPage(categorias?[1]?.id ?? '-1');
          case SelectedSide.right:
            _con.goToPage(categorias?[2]?.id ?? '-1');
          case SelectedSide.left:
            _con.goToPage(categorias?[3]?.id ?? '-1');
          case SelectedSide.front:
            _con.goToPage(categorias?[4]?.id ?? '-1');
          case SelectedSide.back:
            _con.goToPage(categorias?[5]?.id ?? '-1');
          case SelectedSide.none:
            _con.goToPage('-2');
          default:
            throw Exception("Unimplemented option");
        }
      },
      delta: Vector2(pi / 4, pi / 4),
      top: Container(
        height: 250,
        width: 250,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 1
          ),
          image: const DecorationImage(
            image: AssetImage('assets/img/electronica.png'),
          ),
          color: const Color.fromARGB(255, 255, 0, 0),
        ),
        child: Center(
          child: Stack(
            children: [
              Text(categorias?[0]?.name ?? 'Nombre no disponible', 
                style: TextStyle(
                  fontSize: 35,
                  foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 2
                  ..color = Colors.black,
                  fontFamily: 'Anta'),
              ),
              Text(categorias?[0]?.name ?? 'Nombre no disponible', 
                style: const TextStyle(
                  fontSize: 35,
                  color: Colors.white,
                  fontFamily: 'Anta'),
              ),
            ],
          ),
        ),
      ),
      bottom: Container(
        height: 250,
        width: 250,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 1
          ),
          image: const DecorationImage(
            image: AssetImage('assets/img/ropa.png'),
          ),
          color: const Color.fromARGB(255, 72, 156, 46)),
        child: Center(
          child: Stack(
            children: [
              Text(categorias?[1]?.name ?? 'Nombre no disponible', 
                style: TextStyle(
                  fontSize: 35,
                  foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 2
                  ..color = Colors.black,
                  fontFamily: 'Anta'),
              ),
              Text(categorias?[1]?.name ?? 'Nombre no disponible', 
                style: const TextStyle(
                  fontSize: 35,
                  color: Colors.white,
                  fontFamily: 'Anta'),
              ),
            ],
          ),
        ),
      ),
      right: Container(
        height: 250,
        width: 250,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 1
          ),
          image: const DecorationImage(
            image: AssetImage('assets/img/hogar.png'),
          ),
          color: const Color.fromARGB(255, 18, 182, 223),
        ),
        child: Center(
          child: Stack(
            children: [
              Text(categorias?[2]?.name ?? 'Nombre no disponible', 
                style: TextStyle(
                  fontSize: 35,
                  foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 2
                  ..color = Colors.black,
                  fontFamily: 'Carrington'),
              ),
              Text(categorias?[2]?.name ?? 'Nombre no disponible', 
                style: const TextStyle(
                  fontSize: 35,
                  color: Colors.white,
                  fontFamily: 'Carrington'),
              ),
            ],
          ),
        ),
      ),
      left: Container(
        height: 250,
        width: 250,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 1
          ),
          image: const DecorationImage(
            image: AssetImage('assets/img/deportes.png'),
          ),
          color: const Color.fromARGB(255, 135, 17, 204),
        ),
        child: Center(
          child: Stack(
            children: [
              Text(categorias?[3]?.name ?? 'Nombre no disponible', 
                style: TextStyle(
                  fontSize: 35,
                  foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 2
                  ..color = Colors.black,
                  fontFamily: 'Anta'),
              ),
              Text(categorias?[3]?.name ?? 'Nombre no disponible', 
                style: const TextStyle(
                  fontSize: 35,
                  color: Colors.white,
                  fontFamily: 'Anta'),
              ),
            ],
          ),
        ),
      ),
      front: Container(
        height: 250,
        width: 250,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 1
          ),
          image: const DecorationImage(
            image: AssetImage('assets/img/juguete.png'),
          ),
          color: const Color.fromARGB(255, 239, 255, 8),
        ),
        child: Center(
          child: Stack(
            children: [
              Text(
                categorias?[4]?.name ?? 'Nombre no disponible', 
                style: TextStyle(
                  fontSize: 35,
                  foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 2
                  ..color = Colors.black,
                  fontFamily: 'Garden'),
              ),
              Text(
                categorias?[4]?.name ?? 'Nombre no disponible', 
                style: const TextStyle(
                  fontSize: 35,
                  color: Colors.white,
                  fontFamily: 'Garden'),
              ),
            ],
          ),
        ),
      ),
      back: Container(
        height: 250,
        width: 250,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 1
          ),
          image: const DecorationImage(
            image: AssetImage('assets/img/libros.png'),
          ),
          color: const Color.fromARGB(255, 161, 66, 66),
        ),
        child: Center(
          child: Stack(
            children: [
              Text(
                categorias?[5]?.name ?? 'Nombre no disponible', 
                style: TextStyle(
                  fontSize: 35,
                  foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 2
                  ..color = Colors.black,
                  fontFamily: 'Garden'),
              ),
              Text(
                categorias?[5]?.name ?? 'Nombre no disponible', 
                style: const TextStyle(
                  fontSize: 35,
                  color: Colors.white,
                  fontFamily: 'Garden'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class _cubixPlaceholder extends StatelessWidget {
  const _cubixPlaceholder();

  @override
  Widget build(BuildContext context) {
    return CubixD(
      size: 200.0,
      onSelected: (SelectedSide opt, Vector2 delta) {
        // ignore: avoid_print, unnecessary_brace_in_string_interps
        print('On selected callback:\n\topt = ${opt}\n\tdelta = ${delta}');
      },
      delta: Vector2(pi / 4, pi / 4),
      top: Container(
        decoration: const BoxDecoration(color: Color.fromARGB(255, 255, 0, 0)),
        child: const Center(
          child: Text('TOP'),
        ),
      ),
      bottom: Container(
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 72, 156, 46)),
        child: const Center(
          child: Text('BOTTOM'),
        ),
      ),
      right: Container(
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 18, 182, 223)),
        child: const Center(
          child: Text('RIGHT'),
        ),
      ),
      left: Container(
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 135, 17, 204)),
        child: const Center(
          child: Text('LEFT'),
        ),
      ),
      front: Container(
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 239, 255, 8)),
        child: const Center(
          child: Text('FRONT'),
        ),
      ),
      back: Container(
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 161, 66, 66)),
        child: const Center(
          child: Text('BACK'),
        ),
      ),
    );
  }
}