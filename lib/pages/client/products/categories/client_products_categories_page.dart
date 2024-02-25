import 'dart:math';
import 'package:flutter/material.dart';
import 'package:gestion_entrega_app/models/category.dart';
import 'package:gestion_entrega_app/pages/client/drawerClient/client_drawer_page.dart';
import 'package:gestion_entrega_app/pages/client/products/categories/client_products_categories_controller.dart';
import 'package:gestion_entrega_app/widgets/myCustomDrawer.dart';
import 'package:get/get.dart';
import 'package:vector_math/vector_math_64.dart' show Vector2;
import 'package:cubixd/cubixd.dart';

class ClientProductsCategoriesPage extends StatelessWidget {
  const ClientProductsCategoriesPage({Key? key});

  @override
  Widget build(BuildContext context) {
    final _con = Get.put(ClientProductsCategoriesController());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Explore nuestras categorías',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 0, 0, 0),
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 255, 68, 68).withOpacity(0.8),
                Color.fromARGB(255, 255, 0, 0).withOpacity(0.8),
              ],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
              stops: [0.001, 0.8],
            ),
          ),
        ),
      ),
      drawer: ClientDrawerPage(),
      body: Container(
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 252, 67, 67).withOpacity(0.5),
              Color.fromARGB(255, 252, 40, 40).withOpacity(0.8),
            ],
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
            stops: [0.05, 0.9],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.9),
              spreadRadius: 6,
              blurRadius: 10,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 500,
              height: 800,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/img/delivery.png'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    const Color.fromARGB(255, 247, 64, 64).withOpacity(0.7),
                    BlendMode.dstATop,
                  ),
                ),
              ),
            ),
            Obx(
              () => _con.ismincategories.value
                  ? _cubix(
                      con: _con,
                      categorias: _con.categories,
                    )
                  : _cubixPlaceholder(),
            ),
            Positioned(
              bottom: 20,
              child: Text(
                '¡Gira el cubo para explorar!',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _cubix extends StatelessWidget {
  final List<Category?>? categorias;
  _cubix({
    Key? key,
    required ClientProductsCategoriesController con,
    required this.categorias,
  }) : _con = con, super(key: key);

  final ClientProductsCategoriesController _con;

  @override
  Widget build(BuildContext context) {
    return CubixD(
      size: 200.0,
      onSelected: (SelectedSide side, Vector2 delta) {
        switch (side) {
          case SelectedSide.top:
            _con.goToPage(categorias?[0]?.id ?? '-1');
            break;
          case SelectedSide.bottom:
            _con.goToPage(categorias?[1]?.id ?? '-1');
            break;
          case SelectedSide.right:
            _con.goToPage(categorias?[2]?.id ?? '-1');
            break;
          case SelectedSide.left:
            _con.goToPage(categorias?[3]?.id ?? '-1');
            break;
          case SelectedSide.front:
            _con.goToPage(categorias?[4]?.id ?? '-1');
            break;
          case SelectedSide.back:
            _con.goToPage(categorias?[5]?.id ?? '-1');
            break;
          case SelectedSide.none:
            _con.goToPage('-2');
            break;
        }
      },
      delta: Vector2(pi / 4, pi / 4),
      top: Container(
        child: Center(
          child: Text(
            categorias?[0]?.name ?? 'Nombre no disponible',
            style: TextStyle(color: Colors.black),
          ),
        ),
        decoration: const BoxDecoration(color: Color.fromARGB(255, 255, 0, 0)),
      ),
      bottom: Container(
        child: Center(
          child: Text(
            categorias?[1]?.name ?? 'Nombre no disponible',
            style: TextStyle(color: Colors.black),
          ),
        ),
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 72, 156, 46)),
      ),
      right: Container(
        child: Center(
          child: Text(
            categorias?[2]?.name ?? 'Nombre no disponible',
            style: TextStyle(color: Colors.black),
          ),
        ),
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 18, 182, 223)),
      ),
      left: _buildImageFace(
        categorias?[3]?.name ?? 'Nombre no disponible',
        'assets/img/deportes.png',
        const Color.fromARGB(255, 135, 17, 204),
        TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      front: Container(
        child: Center(
          child: Text(
            categorias?[4]?.name ?? 'Nombre no disponible',
            style: TextStyle(color: Colors.black),
          ),
        ),
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 239, 255, 8)),
      ),
      back: Container(
        child: Center(
          child: Text(
            categorias?[5]?.name ?? 'Nombre no disponible',
            style: TextStyle(color: Colors.black),
          ),
        ),
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 161, 66, 66)),
      ),
    );
  }

Widget _buildImageFace(String text, String imagePath, Color backgroundColor, TextStyle textStyle) {
  return Container(
    width: 200,
    height: 200,
    decoration: BoxDecoration(color: backgroundColor),
    child: Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          imagePath,
          fit: BoxFit.cover, // Ajusta la imagen dentro del tamaño 200x200
        ),
        Center(
          child: Text(
            text,
            style: textStyle.copyWith(
              fontFamily: 'Courier New',
              fontSize: 35,
            ),
          ),
        ),
      ],
    ),
  );
}

}

class _cubixPlaceholder extends StatelessWidget {
  _cubixPlaceholder({
    Key? key,
  }) : super(key: key);

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
          child: Text(
            'TOP',
            style: TextStyle(color: Colors.black),
          ),
        ),
        decoration: const BoxDecoration(color: Color.fromARGB(255, 255, 0, 0)),
      ),
      bottom: Container(
        child: Center(
          child: Text(
            'BOTTOM',
            style: TextStyle(color: Colors.black),
          ),
        ),
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 72, 156, 46)),
      ),
      right: Container(
        child: Center(
          child: Text(
            'RIGHT',
            style: TextStyle(color: Colors.black),
          ),
        ),
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 18, 182, 223)),
      ),
      left: Container(
        child: Center(
          child: Text(
            'LEFT',
            style: TextStyle(color: Colors.black),
          ),
        ),
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 135, 17, 204)),
      ),
      front: Container(
        child: Center(
          child: Text(
            'FRONT',
            style: TextStyle(color: Colors.black),
          ),
        ),
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 239, 255, 8)),
      ),
      back: Container(
        child: Center(
          child: Text(
            'BACK',
            style: TextStyle(color: Colors.black),
          ),
        ),
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 161, 66, 66)),
      ),
    );
  }
}
