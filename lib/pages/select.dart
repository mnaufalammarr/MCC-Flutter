import 'package:flutter/material.dart';

class SelectPage extends StatefulWidget {
  @override
  _SelectPage createState() => _SelectPage();
}

class _SelectPage extends State<SelectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Select Page',
          style: TextStyle(
            color: Colors.white70,
          ),
        ),
      ),
      body: Center(
        child: Text("Select page"),
      ),
    );
  }
}
