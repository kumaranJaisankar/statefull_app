import 'package:flutter/material.dart';
import 'package:statefull_app/Widgets/my_radio_button.dart';
import 'package:statefull_app/detail.dart';
import 'package:statefull_app/Widgets/my_text_filed.dart';
import 'package:statefull_app/model/my_models.dart';

// ignore: constant_identifier_names

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  // var _productName;

  final _ProductTextFieldControler = TextEditingController();
  final _productDecController = TextEditingController();

  bool? _checkState, _checkList = false;
  // bool? _checkList = false;

  ProductTypeEnum? _productTypeEnum;

  String? _dropdownvalue;
  final List _items = [
    'Small',
    'Medium',
    'Large',
    'X Large',
    'XXL Large',
  ];

  String? simpleVal;

  @override
  void dispose() {
    _ProductTextFieldControler.dispose();
    super.dispose();
  }

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    print('hello');
    return Scaffold(
        appBar: AppBar(
          title: const Text('Form Page'),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView(
              children: [
                const Text(
                  'Product Form',
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        MyTextField(
                          myController: _ProductTextFieldControler,
                          fieldName: 'Product Name',
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        MyTextField(
                            myController: _productDecController,
                            fieldName: 'Product discriptions'),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            width: 200.0,
                            height: 60.0,
                            margin: const EdgeInsets.symmetric(vertical: 10.0),
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10.0)),
                              color: Colors.blue[100],
                            ),
                            child: CheckboxListTile(
                              value: _checkList,
                              onChanged: (val) {
                                setState(() {
                                  _checkList = val;
                                });
                              },
                              checkboxShape: const CircleBorder(
                                  eccentricity: double.minPositive),
                              title: const Text('Top products'),
                              controlAffinity: ListTileControlAffinity.leading,
                              selectedTileColor: Colors.blue,
                              // tileColor: Color.fromARGB(54, 0, 94, 255),
                              shape: const CircleBorder(
                                  eccentricity: double.minPositive),
                              // visualDensity: VisualDensity(horizontal: -4.0),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MyRadioBtn(
                                  title: ProductTypeEnum.Downlodable.name,
                                  value: ProductTypeEnum.Downlodable,
                                  productTypeEnum: _productTypeEnum,
                                  onChanged: (val) {
                                    setState(() {
                                      _productTypeEnum = val;
                                    });
                                  }),
                              const SizedBox(
                                width: 8.0,
                              ),
                              MyRadioBtn(
                                  title: ProductTypeEnum.Deliverable.name,
                                  value: ProductTypeEnum.Deliverable,
                                  productTypeEnum: _productTypeEnum,
                                  onChanged: (val) {
                                    setState(() {
                                      _productTypeEnum = val;
                                    });
                                  })
                            ],
                          ),
                        ),
                        DropdownButtonFormField(
                            decoration: const InputDecoration(
                                labelText: 'Select Size',
                                border: UnderlineInputBorder()),
                            items: _items
                                .map((e) => DropdownMenuItem(
                                      value: e,
                                      child: Text(e),
                                    ))
                                .toList(),
                            onChanged: (val) {
                              setState(() {
                                _dropdownvalue = val as String;
                              });
                            }),
                        const SizedBox(
                          height: 20.0,
                        ),
                        submitButton(context),
                      ],
                    )),
              ],
            ),
          ),
        ));
  }

  OutlinedButton submitButton(BuildContext context) {
    return OutlinedButton(
        style: OutlinedButton.styleFrom(minimumSize: const Size(200, 50)),
        onPressed: () {
          print('submit');
          if (_formkey.currentState!.validate()) {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('Processing data')));
            ProductDetails productDetails = ProductDetails();

            productDetails.productName = _ProductTextFieldControler.text;
            productDetails.productDetail = _productDecController.text;
            productDetails.isTopProduct = _checkList!;
            productDetails.productType = _productTypeEnum!;
            productDetails.productSize = _dropdownvalue!;

            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DetailPage(productDetails: productDetails);
            }));
          }
        },
        child: const Text(
          'Submit Form',
          style: TextStyle(fontWeight: FontWeight.bold),
        ));
  }
}
