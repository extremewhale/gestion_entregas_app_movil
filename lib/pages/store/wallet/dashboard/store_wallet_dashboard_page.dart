import 'package:flutter/material.dart';
import 'package:gestion_entrega_app/pages/store/drawerStore/Store_drawer_page.dart';
import 'package:gestion_entrega_app/pages/store/wallet/dashboard/store_wallet_dashboard_controller.dart';
import 'package:gestion_entrega_app/widgets/myCustomDrawer.dart';
import 'package:get/get.dart';

class StoreWalletDashboardPage extends StatelessWidget {
  const StoreWalletDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _con = Get.put(StoreWalletDashboardController());
    return Scaffold(
      appBar: AppBar(
        title: Text('StoreWalletDashboardPage'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {},
          child: Text('agregar billetera'),
        ),
      ),
      drawer: StoreDrawerPage(),
    );
  }
}
