import 'package:flutter/material.dart';
import 'package:gestion_entrega_app/pages/client/drawerClient/client_drawer_controller.dart';
import 'package:gestion_entrega_app/pages/delivery/drawerDelivery/delivery_drawer_controller.dart';
import 'package:gestion_entrega_app/widgets/myCustomDrawer.dart';
import 'package:get/get.dart';

class DeliveryDrawerPage extends StatelessWidget {
  const DeliveryDrawerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _con = Get.put(DeliveryDrawerController());
    return MyCustomDrawer(items: [
      DrawerItem(
          title: 'mis documentos',
          icon: Icons.person,
          onTap: _con.gotoDocument),
      DrawerItem(title: 'entregas', icon: Icons.list, onTap: _con.goToOrders),
      DrawerItem(
          title: 'realizar compras', icon: Icons.map, onTap: _con.goToClient),
      DrawerItem(
          title: 'mi negocio ', icon: Icons.store, onTap: _con.goToStore),
      DrawerItem(
          title: 'cerrar sesion', icon: Icons.exit_to_app, onTap: _con.logout),
    ]);
  }
}
