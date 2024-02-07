import 'package:flutter/material.dart';
import 'package:gestion_entrega_app/controllers/UserController.dart';
import 'package:gestion_entrega_app/models/user.dart';
import 'package:get/get.dart';

class MyCustomDrawer extends StatelessWidget {
  final UserController _con = Get.find<UserController>();
  final List<DrawerItem> items;

  MyCustomDrawer({required this.items});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Obx(() => DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.red,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${_con.user()?.name ?? ''} ${_con.user()?.lastname ?? ''}',
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                    ),
                    Text(
                      _con.user()?.email ?? '',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey.shade300,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                    ),
                    Text(
                      _con.user()?.phone ?? '',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey.shade300,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                    ),
                    Container(
                      width: 65,
                      height: 65,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: FadeInImage(
                          height: 80,
                          width: 80,
                          placeholder: const AssetImage('assets/img/no-image.png'),
                          image: _con.user()?.image != null
                              ? NetworkImage(_con.user()!.image ?? '') as ImageProvider
                              : const AssetImage('assets/img/no-image.png'),
                          fit: BoxFit.fill,
                          fadeInDuration: const Duration(milliseconds: 50),
                        ),
                      ),
                    )
                  ],
                ),
              )),
          ...items.map((item) {
            return ListTile(
              leading: Icon(item.icon),
              title: Text(item.title),
              onTap: () {
                item.onTap();
                Get.back();
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
