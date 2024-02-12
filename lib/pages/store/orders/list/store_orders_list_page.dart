import 'package:flutter/material.dart';
import 'package:gestion_entrega_app/pages/store/drawerStore/Store_drawer_page.dart';
import 'package:gestion_entrega_app/pages/store/orders/list/store_orders_list_controller.dart';
import 'package:gestion_entrega_app/widgets/myCustomDrawer.dart';
import 'package:get/get.dart';

class StoreOrdersListPage extends StatelessWidget {
  const StoreOrdersListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _con = Get.put(StoreOrdersListController());
    return Scaffold(
      appBar: AppBar(),
      body: Text('store orders list'),
      drawer: StoreDrawerPage(),
    );
  }
}
