import 'package:flutter/material.dart';
import 'package:gestion_entrega_app/pages/client/products/list/client_products_list_controller.dart';
import 'package:get/get.dart';
import 'package:gestion_entrega_app/widgets/myWidgets.dart';

class ClientProductsListPage extends StatelessWidget {
  const ClientProductsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _con = Get.put(ClientProductsListController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de productos'),
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
      body: Center(
        child: ElevatedButton(
            onPressed: _con.logout, child: Text('cerrar sesion')),
      ),
    );
  }
}
