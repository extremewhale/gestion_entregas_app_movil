import 'package:flutter/material.dart';
import 'package:gestion_entrega_app/pages/delivery/drawerDelivery/delivery_drawer_page.dart';
import 'package:gestion_entrega_app/pages/delivery/orders/list/delivery_orders_list_controller.dart';
import 'package:gestion_entrega_app/widgets/myCustomDrawer.dart';
import 'package:get/get.dart';

class DeliveryOrdersListPage extends StatelessWidget {
  const DeliveryOrdersListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _con = Get.put(DeliveryOrdersListController());
    return Scaffold(
      appBar: AppBar(),
      body: Text('delivery orders list'),
      drawer: DeliveryDrawerPage(),
    );
  }
}
