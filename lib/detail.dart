import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:statefull_app/model/my_models.dart';

class DetailPage extends StatelessWidget {
  DetailPage({super.key, required this.productDetails});

  ProductDetails productDetails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Product Detailss'),
        ),
        body: Container(
          padding: const EdgeInsets.all(14.0),
          child: ListView(
            children: [
              ListTile(
                title: Text(productDetails.productName),
                subtitle: Text(productDetails.productDetail),
                leading: const FaIcon(FontAwesomeIcons.bagShopping),
                trailing: IconButton(
                    onPressed: () {},
                    icon: const FaIcon(FontAwesomeIcons.trash)),
              )
            ],
          ),
        ));
  }
}
