import 'package:flutter/material.dart';
import 'package:gestion_entrega_app/models/product.dart';
import 'package:gestion_entrega_app/pages/client/products/detail/client_products_detail_controller.dart';
import 'package:gestion_entrega_app/widgets/myWidgets.dart';
import 'package:get/get.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class ClientProductsDetailPage extends StatelessWidget {
  Product? product;
  ClientProductsDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final _con = Get.put(ClientProductsDetailController());
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      child: Column(
        children: [
          _imageSlideshow(
            img1: product?.image1,
            img2: product?.image2,
            img3: product?.image3,
          ),
          _textName(name: product?.name),
          _texDescription(
            description: product?.description,
          ),
          Spacer(),
          _addOrRemoveItem(),
          _standartDelivery(),
          MyButtom(
              textButtom: 'Agregar a la bolsa', function: () {}, isEnable: true)
        ],
      ),
    );
  }
}

class _texDescription extends StatelessWidget {
  String? description;
  _texDescription({super.key, this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.only(right: 30, left: 30, top: 15),
        child: Text(
          '${description}' ?? '',
          style: TextStyle(fontSize: 13, color: Colors.grey),
        ));
  }
}

class _standartDelivery extends StatelessWidget {
  const _standartDelivery({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Row(
        children: [
          Image.asset(
            'assets/img/delivery.png',
            height: 17,
          ),
          SizedBox(
            width: 7,
          ),
          Text(
            'Envio estandar',
            style: TextStyle(fontSize: 12, color: Colors.green),
          )
        ],
      ),
    );
  }
}

class _addOrRemoveItem extends StatelessWidget {
  const _addOrRemoveItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 17),
      child: Row(
        children: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.add_circle_outline,
                color: Colors.grey,
                size: 30,
              )),
          Text(
            '1',
            style: TextStyle(
                fontSize: 17, fontWeight: FontWeight.bold, color: Colors.grey),
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.remove_circle_outline,
                color: Colors.grey,
                size: 30,
              )),
          Spacer(),
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Text(
              ' 0',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}

class _textName extends StatelessWidget {
  String? name;
  _textName({super.key, this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.only(right: 30, left: 30, top: 30),
        child: Text(
          ' ${name}' ?? '',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ));
  }
}

class _imageSlideshow extends StatelessWidget {
  String? img1;
  String? img2;
  String? img3;
  _imageSlideshow({this.img1, this.img2, this.img3});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ImageSlideshow(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.4,
          initialPage: 0,
          indicatorColor: Colors.red,
          indicatorBackgroundColor: Colors.grey,
          onPageChanged: (value) {
            print('Page changed: $value');
          },
          autoPlayInterval: 7000,
          isLoop: true,
          children: [
            FadeInImage(
              image: img1 != null
                  ? NetworkImage(img1!) as ImageProvider
                  : const AssetImage('assets/img/no-image.png'),
              fit: BoxFit.fitHeight,
              fadeInDuration: const Duration(milliseconds: 50),
              placeholder: const AssetImage('assets/img/no-image.png'),
            ),
            FadeInImage(
              image: img2 != null
                  ? NetworkImage(img2!) as ImageProvider
                  : const AssetImage('assets/img/no-image.png'),
              fit: BoxFit.fitHeight,
              fadeInDuration: const Duration(milliseconds: 50),
              placeholder: const AssetImage('assets/img/no-image.png'),
            ),
            FadeInImage(
              image: img3 != null
                  ? NetworkImage(img3!) as ImageProvider
                  : const AssetImage('assets/img/no-image.png'),
              fit: BoxFit.fitHeight,
              fadeInDuration: const Duration(milliseconds: 50),
              placeholder: const AssetImage('assets/img/no-image.png'),
            ),
          ],
        ),
        Positioned(
            left: 20,
            top: 5,
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_back_ios),
              color: Colors.red,
            ))
      ],
    );
  }
}
