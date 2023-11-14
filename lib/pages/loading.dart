import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void getData() async {
    try {
      Response response =
          await get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
      Map data = jsonDecode(response.body);
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        data["id"],
        data["title"],
      });
    } catch (e) {
      print("Error: $e");
      Navigator.pushReplacementNamed(context, '/home',
          arguments: {'id', 'title'});
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: SpinKitRotatingCircle(
      color: Colors.blueGrey,
      size: 50.0,
    )));
  }
}
