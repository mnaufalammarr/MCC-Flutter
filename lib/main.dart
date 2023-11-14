import 'package:flutter/material.dart';
import 'package:my_app/pages/select.dart';
import 'package:my_app/pages/home.dart';
import 'package:my_app/pages/loading.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => MyHomePage(),
      '/select': (context) => SelectPage()
    },
  ));
}
