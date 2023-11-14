import 'package:flutter/material.dart';
import 'package:my_app/pages/select.dart';
import 'package:my_app/pages/home.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/home',
    routes: {
      '/home': (context) => MyHomePage(),
      '/select': (context) => SelectPage()
    },
  ));
}
