import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

import '../model/user.dart';

class SelectPage extends StatefulWidget {
  @override
  _SelectPage createState() => _SelectPage();
}

class _SelectPage extends State<SelectPage> {
  Future<List<User>> getUsers() async {
    const url = "https://reqres.in/api/users?page=1&per_page=10";
    var response = await get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);
    var jsonArray = jsonData["data"];

    List<User> users = [];
    for (var jsonUser in jsonArray) {
      User user = User(
        id: jsonUser["id"],
        email: jsonUser["email"],
        first_name: jsonUser["first_name"],
        last_name: jsonUser["last_name"],
        avatar: jsonUser["avatar"],
      );

      users.add(user);
    }

    return users;
  }

  Widget build(BuildContext context) {
    final List? data = ModalRoute.of(context)?.settings.arguments as List?;
    print("build dipanggil");
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
      body: FutureBuilder<List<User>>(
          future: getUsers(),
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              List<User> users = snapshot.data!;

              return ListView.builder(
                cacheExtent: 10,
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  User user = users[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(user.avatar),
                      radius: 49,
                    ),
                    title: Text(
                      user.first_name + " " + user.last_name,
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      user.email.toUpperCase(),
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(
                          context, user.first_name + " " + user.last_name);
                    },
                  );
                },
              );
            }
          }),
    );
  }
}
