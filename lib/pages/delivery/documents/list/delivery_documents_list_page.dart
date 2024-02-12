import 'package:flutter/material.dart';
import 'package:gestion_entrega_app/pages/delivery/documents/list/delivery_documents_list_controller.dart';
import 'package:gestion_entrega_app/pages/delivery/drawerDelivery/delivery_drawer_page.dart';
import 'package:get/get.dart';

class DeliveryDocumentsListPage extends StatelessWidget {
  const DeliveryDocumentsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _con = Get.put(DeliveryDocumentsListController());
    return Scaffold(
      appBar: AppBar(
        title: Text('data'),
      ),
      drawer: DeliveryDrawerPage(),
    );
  }
}
