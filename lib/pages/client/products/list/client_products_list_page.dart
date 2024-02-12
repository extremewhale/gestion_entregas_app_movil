import 'package:flutter/material.dart';
import 'package:gestion_entrega_app/models/product.dart';
import 'package:gestion_entrega_app/models/subcategory.dart';
import 'package:gestion_entrega_app/pages/client/drawerClient/client_drawer_page.dart';
import 'package:gestion_entrega_app/pages/client/products/list/client_products_list_controller.dart';
import 'package:gestion_entrega_app/widgets/no_data_widget.dart';
import 'package:get/get.dart';
import 'package:gestion_entrega_app/widgets/myWidgets.dart';
import 'package:get_storage/get_storage.dart';

class ClientProductsListPage extends StatelessWidget {
  ClientProductsListPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> arguments =
        Get.arguments as Map<String, dynamic>? ?? {};

    // Obtén el valor de idCategory

    final _con = Get.put(ClientProductsListController());
    _con.idCat.value = arguments['idCategory'] ?? '';

    return Obx(() =>   _con.isData.value
        ? DefaultTabController(
            length: _con.subcategories.length,
            child: Scaffold(
                key: _con.key,
                appBar: PreferredSize(
                    preferredSize: const Size.fromHeight(170),
                    child: AppBar(
                      automaticallyImplyLeading: false,
                      backgroundColor: Colors.white,
                      actions: [_shoppingBag()],
                      flexibleSpace: Column(
                        children: [
                          const SizedBox(
                            height: 40,
                          ),
                          _menuDrawer(),
                          const SizedBox(
                            height: 20,
                          ),
                          _textFieldSearch()
                        ],
                      ),
                      bottom: TabBar(
                        indicatorColor: Colors.red,
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.grey[400],
                        isScrollable: true,
                        tabs: List<Widget>.generate(_con.subcategories.length,
                            (index) {
                          return Tab(
                            child: Text(_con.subcategories[index].name ?? ''),
                          );
                        }),
                      ),
                    )),
                drawer: ClientDrawerPage(),
                body: TabBarView(
                  children: _con.subcategories.map((SubCategory subcategory) {
                    return FutureBuilder(
                        future: _con.getProducts(subcategory.id!),
                        builder:
                            (context, AsyncSnapshot<List<Product?>?> snapshot) {
                          if (snapshot.hasData) {
                            if (snapshot.data!.isNotEmpty) {
                              return GridView.builder(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 20),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          childAspectRatio: 0.67),
                                  itemCount: snapshot.data?.length ?? 0,
                                  itemBuilder: (_, index) {
                                    return _cardProduct(
                                      product: snapshot.data![index]!,
                                    );
                                  });
                            } else {
                              return NoDataWidget(
                                text: 'No hay Productos',
                              );
                            }
                          } else {
                            return NoDataWidget(
                              text: 'No hay Productos',
                            );
                          }
                        });
                  }).toList(),
                )),
          )
        : Container(
            child: Center(child: CircularProgressIndicator()),
          ));
  }
}

class _shoppingBag extends StatelessWidget {
  const _shoppingBag({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 15, top: 13),
            child: const Icon(
              Icons.shopping_bag_outlined,
              color: Colors.black,
            ),
          ),
          Positioned(
              right: 16,
              top: 15,
              child: Container(
                width: 9,
                height: 9,
                decoration: const BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.all(Radius.circular(30))),
              ))
        ],
      ),
    );
  }
}

class _textFieldSearch extends StatelessWidget {
  const _textFieldSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: TextField(
          decoration: InputDecoration(
              hintText: 'Buscar',
              suffixIcon: Icon(
                Icons.search,
                color: Colors.grey[400],
              ),
              hintStyle: TextStyle(fontSize: 17, color: Colors.grey[500]),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(
                    color: Colors.grey.shade300,
                  )),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(
                  color: Colors.grey.shade300,
                ),
              ),
              contentPadding: const EdgeInsets.all(15)),
        ));
  }
}

class _cardProduct extends StatelessWidget {
  Product product;

  _cardProduct({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final _con = Get.find<ClientProductsListController>();
    return GestureDetector(
      onTap: () {
        _con.openBottomSheet(product);
      },
      child: Container(
        color: Colors.white,
        height: 350,
        child: Card(
          color: Colors.white,
          elevation: 3.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Stack(
            children: [
              Positioned(
                  top: -1.0,
                  right: -1.0,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            topRight: Radius.circular(20))),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  )),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 150,
                    margin: const EdgeInsets.only(top: 20),
                    width: MediaQuery.of(context).size.width * 0.45,
                    padding: const EdgeInsets.all(20),
                    child: FadeInImage(
                      image: product.image1 != null
                          ? NetworkImage(product.image1!) as ImageProvider
                          : const AssetImage('assets/img/no-image.png'),
                      fit: BoxFit.contain,
                      fadeInDuration: const Duration(milliseconds: 50),
                      placeholder: const AssetImage('assets/img/no-image.png'),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    height: 37,
                    child: Text(
                      product.name ?? '',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontFamily: 'NimbusSans', fontSize: 14),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    child: Text(
                      '${product.price ?? 0} \S/',
                      style: const TextStyle(
                          fontFamily: 'NimbusSans',
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _menuDrawer extends StatelessWidget {
  const _menuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final _con = Get.find<ClientProductsListController>();
    return GestureDetector(
      onTap: _con.openDrawer,
      child: Container(
        margin: const EdgeInsets.only(left: 20),
        alignment: Alignment.centerLeft,
        child: Icon(Icons.menu),
      ),
    );
  }
}
