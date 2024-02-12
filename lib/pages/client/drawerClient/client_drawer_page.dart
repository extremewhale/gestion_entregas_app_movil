import 'package:flutter/material.dart';
import 'package:gestion_entrega_app/pages/client/drawerClient/client_drawer_controller.dart';
import 'package:gestion_entrega_app/widgets/myCustomDrawer.dart';
import 'package:get/get.dart';

class ClientDrawerPage extends StatelessWidget {
  const ClientDrawerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _con = Get.put(ClientDrawerController());
    return MyCustomDrawer(items: [
      DrawerItem(
          title: 'mi Perfil', icon: Icons.person, onTap: _con.gotoUpdate),
      DrawerItem(title: 'mis Pedidos', icon: Icons.list, onTap: () {}),
      DrawerItem(title: 'mis direcciones', icon: Icons.map, onTap: () {}),
      DrawerItem(title: 'mi negocio', icon: Icons.store, onTap: _con.goToStore),
      DrawerItem(
          title: 'repartidor',
          icon: Icons.delivery_dining,
          onTap: _con.gotoDelivery),
      DrawerItem(
          title: 'cerrar sesion', icon: Icons.exit_to_app, onTap: _con.logout),
    ]);
  }
}
