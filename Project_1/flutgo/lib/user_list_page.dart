import 'dart:convert';

import 'package:flutgo/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ListUsers extends StatefulWidget {
  const ListUsers({Key? key}) : super(key: key);

  @override
  _ListUsersState createState() => _ListUsersState();
}

class _ListUsersState extends State<ListUsers> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.blueGrey,
            body: SizedBox.expand(
                child: Stack(
              children: [
                FutureBuilder<List<User>>(
                  future: fetchFromServer(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text("Error: ${snapshot.error}",
                            style: const TextStyle(color: Colors.redAccent)),
                      );
                    } else {
                      return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                              child: ListTile(
                            title: Text(snapshot.data[index].name),
                            subtitle: Text(
                                "Username: ${snapshot.data[index].username} \t Email:${snapshot.data[index].email}"),
                          ));
                        },
                      );
                    }
                  },
                ),
              ],
            ))));
  }

  Future<List<User>> fetchFromServer() async {
    var url = Uri.parse("http://127.0.0.1:9092/api/users");
    var response = await http.get(url);

    List<User> userList = [];
    if (response.statusCode == 200) {
      var userMap = jsonDecode(response.body);
      for (final item in userMap) {
        userList.add(User.fromJson(item));
      }
    }

    return userList;
  }
}
