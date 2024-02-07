import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gestion_entrega_app/widgets/myWidgets.dart';
import 'package:gestion_entrega_app/pages/client/products/list/client_products_list_controller.dart';

class ClientProductsListPage extends StatelessWidget {
  const ClientProductsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    final _con = Get.put(ClientProductsListController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de productos'),
      ),
      drawer: MyCustomDrawer(items: [
        DrawerItem(title: 'Mi Perfil', icon: Icons.person, onTap: () {}),
        DrawerItem(title: 'Pedidos', icon: Icons.list, onTap: () {}),
        DrawerItem(title: 'Direcciones', icon: Icons.map, onTap: () {}),
        DrawerItem(title: 'Negocio', icon: Icons.store, onTap: () {}),
        DrawerItem(
            title: 'Repartidor', icon: Icons.delivery_dining, onTap: () {}),
        DrawerItem(
            title: 'Cerrar Sesión',
            icon: Icons.exit_to_app,
            onTap: _con.logout),
      ]),
      body: Center(
        child: ElevatedButton(
            onPressed: _con.logout, child: const Text('Cerrar Sesión')),
      ),
    );
  }
}
