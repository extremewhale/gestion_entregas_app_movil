import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyCustomDrawer extends StatelessWidget {
  final List<DrawerItem> items;

  MyCustomDrawer({required this.items});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              decoration: BoxDecoration(
                color: Colors
                    .blue, // Puedes ajustar el color según tus preferencias
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'user name lastname',
                    style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                    maxLines: 1,
                  ),
                  Text(
                    'correo@gmail.com',
                    style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey.shade300,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                    maxLines: 1,
                  ),
                  Text(
                    'telefono',
                    style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey.shade300,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                    maxLines: 1,
                  ),
                  FadeInImage(
                    height: 60,
                    width: 80,
                    placeholder: const AssetImage('assets/img/no-image.png'),
                    image: AssetImage('assets/img/no-image.png'),
                    fit: BoxFit.cover,
                    fadeInDuration: const Duration(milliseconds: 50),
                  ),
                ],
              )),
          ...items.map((item) {
            return ListTile(
              leading: Icon(item.icon), // Agrega un icono a la izquierda
              title: Text(item.title),
              onTap: () {
                item.onTap();
                Get.back(); // Cierra el Drawer
              },
            );
          }).toList(),
        ],
      ),
    );
  }
}

class DrawerItem {
  final String title;
  final IconData icon;
  final Function onTap;

  DrawerItem({required this.title, required this.icon, required this.onTap});
}
