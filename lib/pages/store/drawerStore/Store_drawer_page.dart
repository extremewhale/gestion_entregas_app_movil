import 'package:flutter/material.dart';
import 'package:gestion_entrega_app/pages/client/drawerClient/client_drawer_controller.dart';
import 'package:gestion_entrega_app/pages/store/drawerStore/Store_drawer_controller.dart';
import 'package:gestion_entrega_app/widgets/myCustomDrawer.dart';
import 'package:get/get.dart';

class StoreDrawerPage extends StatelessWidget {
  const StoreDrawerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _con = Get.put(StoreDrawerController());
    return MyCustomDrawer(items: [
      DrawerItem(title: 'mis documentos', icon: Icons.person, onTap: () {}),
      DrawerItem(
          title: 'mi billetera', icon: Icons.list, onTap: _con.goToWallet),
      DrawerItem(title: 'almacen', icon: Icons.map, onTap: _con.goToInventory),
      DrawerItem(
          title: 'repartidores',
          icon: Icons.delivery_dining_sharp,
          onTap: () {}),
      DrawerItem(
          title: 'solicitudes',
          icon: Icons.social_distance_rounded,
          onTap: () {}),
      DrawerItem(
          title: 'entregas',
          icon: Icons.published_with_changes_sharp,
          onTap: () {}),
      DrawerItem(
          title: 'realizar compras',
          icon: Icons.published_with_changes_sharp,
          onTap: _con.goToClient),
      DrawerItem(
          title: 'ir como repartidor',
          icon: Icons.motorcycle,
          onTap: _con.goToDelivery),
      DrawerItem(
          title: 'cerrar sesion', icon: Icons.exit_to_app, onTap: _con.logout),
    ]);
  }
}
