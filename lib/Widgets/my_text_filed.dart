import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField(
      {super.key,
      required this.myController,
      required this.fieldName,
      this.myIcon = Icons.verified_user,
      this.prifixIconColor = Colors.blue});

  final TextEditingController myController;
  final String fieldName;
  final IconData myIcon;
  final Color prifixIconColor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter text';
        } else {
          null;
        }
        return null;
      },
      controller: myController,
      // onChanged: (value) => _updateText(value),
      decoration: InputDecoration(
        labelText: fieldName,
        border: const OutlineInputBorder(),
        prefixIcon: Icon(
          myIcon,
          color: prifixIconColor,
        ),
        // focusColor: Colors.red,
        // fillColor: Colors.red,
        // hoverColor: Colors.red,
        // focusedBorder: OutlineInputBorder(
        //     borderSide: BorderSide(color: Colors.redAccent))
      ),
    );
  }
}
