import 'package:flutter/material.dart';
import 'package:gestion_entrega_app/pages/store/drawerStore/Store_drawer_page.dart';
import 'package:gestion_entrega_app/pages/store/inventory/list/store_inventory_list_controller.dart';
import 'package:gestion_entrega_app/widgets/myCustomDrawer.dart';
import 'package:get/get.dart';

class StoreInventoryListPage extends StatelessWidget {
  const StoreInventoryListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _con = Get.put(StoreInventoryListController());
    return Scaffold(
      appBar: AppBar(
        title: Text('StoreInventoryListPage'),
      ),
      drawer: StoreDrawerPage(),
    );
  }
}
