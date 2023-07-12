import 'package:flutter/material.dart';
import 'package:statefull_app/form.dart';

void main() => runApp(const Main());

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter push and pop',
      debugShowCheckedModeBanner: false,
      home: FormPage(),
    );
  }
}
