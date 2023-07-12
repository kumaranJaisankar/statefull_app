import 'package:flutter/material.dart';

enum ProductTypeEnum { Downlodable, Deliverable }

class MyRadioBtn extends StatelessWidget {
  MyRadioBtn(
      {super.key,
      required this.title,
      required this.value,
      required this.productTypeEnum,
      required this.onChanged});

  String title;
  ProductTypeEnum value;
  ProductTypeEnum? productTypeEnum;

  Function(ProductTypeEnum?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.blue[50], borderRadius: BorderRadius.circular(10.0)),
        child: RadioListTile<ProductTypeEnum>(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
            dense: true,
            contentPadding: const EdgeInsets.all(0.0),
            title: Text(title),
            value: value,
            groupValue: productTypeEnum,
            // tileColor: Colors.blue[50],
            onChanged: onChanged),
      ),
    );
  }
}
