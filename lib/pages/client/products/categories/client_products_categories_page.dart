import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gestion_entrega_app/models/category.dart';
import 'package:gestion_entrega_app/pages/client/drawerClient/client_drawer_page.dart';
import 'package:gestion_entrega_app/pages/client/products/categories/client_products_categories_controller.dart';
import 'package:gestion_entrega_app/widgets/myCustomDrawer.dart';
import 'package:get/get.dart';
import 'package:vector_math/vector_math_64.dart' show Vector2;
import 'package:cubixd/cubixd.dart';
import 'package:flutter/material.dart';

class ClientProductsCategoriesPage extends StatelessWidget {
  const ClientProductsCategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _con = Get.put(ClientProductsCategoriesController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Seleccione una categoria'),
      ),
      drawer: ClientDrawerPage(),
      body: Container(
        margin: EdgeInsets.all(1),
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
                    : _cubixPlaceholder(),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _cubix extends StatelessWidget {
  final List<Category?>? categorias;
  _cubix(
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
        child: Center(
          child: Text(categorias?[0]?.name ?? 'Nombre no disponible'),
        ),
        decoration: const BoxDecoration(color: Color.fromARGB(255, 255, 0, 0)),
      ),
      bottom: Container(
        child: Center(
          child: Text(categorias?[1]?.name ?? 'Nombre no disponible'),
        ),
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 72, 156, 46)),
      ),
      right: Container(
        child: Center(
          child: Text(categorias?[2]?.name ?? 'Nombre no disponible'),
        ),
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 18, 182, 223)),
      ),
      left: Container(
        child: Center(
          child: Text(categorias?[3]?.name ?? 'Nombre no disponible'),
        ),
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 135, 17, 204)),
      ),
      front: Container(
        child: Center(
          child: Text(categorias?[4]?.name ?? 'Nombre no disponible'),
        ),
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 239, 255, 8)),
      ),
      back: Container(
        child: Center(
          child: Text(categorias?[5]?.name ?? 'Nombre no disponible'),
        ),
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 161, 66, 66)),
      ),
    );
  }
}

class _cubixPlaceholder extends StatelessWidget {
  _cubixPlaceholder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CubixD(
      size: 200.0,
      onSelected: (SelectedSide opt, Vector2 delta) {
        print('On selected callback:\n\topt = ${opt}\n\tdelta = ${delta}');
      },
      delta: Vector2(pi / 4, pi / 4),
      top: Container(
        child: Center(
          child: Text('TOP'),
        ),
        decoration: const BoxDecoration(color: Color.fromARGB(255, 255, 0, 0)),
      ),
      bottom: Container(
        child: Center(
          child: Text('BOTTOM'),
        ),
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 72, 156, 46)),
      ),
      right: Container(
        child: Center(
          child: Text('RIGHT'),
        ),
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 18, 182, 223)),
      ),
      left: Container(
        child: Center(
          child: Text('LEFT'),
        ),
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 135, 17, 204)),
      ),
      front: Container(
        child: Center(
          child: Text('FRONT'),
        ),
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 239, 255, 8)),
      ),
      back: Container(
        child: Center(
          child: Text('BACK'),
        ),
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 161, 66, 66)),
      ),
    );
  }
}
