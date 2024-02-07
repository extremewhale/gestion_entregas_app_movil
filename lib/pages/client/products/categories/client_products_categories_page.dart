import 'dart:math';

import 'package:flutter/material.dart';
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
      drawer: MyCustomDrawer(items: [
        DrawerItem(title: 'mi Perfil', icon: Icons.person, onTap: () {}),
        DrawerItem(title: 'mis Pedidos', icon: Icons.list, onTap: () {}),
        DrawerItem(title: 'mis direcciones', icon: Icons.map, onTap: () {}),
        DrawerItem(title: 'mi negocio', icon: Icons.store, onTap: () {}),
        DrawerItem(
            title: 'repartidor', icon: Icons.delivery_dining, onTap: () {}),
        DrawerItem(
            title: 'cerrar sesion',
            icon: Icons.exit_to_app,
            onTap: _con.logout),
      ]),
      body: Container(
        margin: EdgeInsets.all(1),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CubixD(
                size: 200.0,
                onSelected: (SelectedSide opt, Vector2 delta) {
                  print(
                      'On selected callback:\n\topt = ${opt}\n\tdelta = ${delta}');
                },
                // onSelected: (side, delta) {
                //   switch (side) {
                //     case SelectedSide.back:
                //       _con.onSelect = '1';
                //       _con.goToPage(_con.onSelect);

                //     case SelectedSide.top:
                //       _con.onSelect = '2';
                //       _con.goToPage(_con.onSelect);

                //     case SelectedSide.front:
                //       _con.onSelect = '3';
                //       _con.goToPage(_con.onSelect);

                //     case SelectedSide.bottom:
                //       _con.onSelect = '4';
                //       _con.goToPage(_con.onSelect);

                //     case SelectedSide.right:
                //       _con.onSelect = '5';
                //       _con.goToPage(_con.onSelect);

                //     case SelectedSide.left:
                //       _con.onSelect = '6';
                //       _con.goToPage(_con.onSelect);

                //     case SelectedSide.none:
                //       _con.onSelect = 'none';
                //       _con.goToPage(_con.onSelect);

                //     default:
                //       throw Exception("Unimplemented option");
                //   }
                // },
                delta: Vector2(pi / 4, pi / 4),
                top: Container(
                  child: Center(
                    child: Text('TOP'),
                  ),
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 255, 0, 0)),
                ),
                bottom: Container(
                  child: Center(
                    child: Text('BOTTOM'),
                  ),
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 72, 156, 46)),
                ),
                right: Container(
                  child: Center(
                    child: Text('RIGHT'),
                  ),
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 18, 182, 223)),
                ),
                left: Container(
                  child: Center(
                    child: Text('LEFT'),
                  ),
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 135, 17, 204)),
                ),
                front: Container(
                  child: Center(
                    child: Text('FRONT'),
                  ),
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 239, 255, 8)),
                ),
                back: Container(
                  child: Center(
                    child: Text('BACK'),
                  ),
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 161, 66, 66)),
                ),
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
