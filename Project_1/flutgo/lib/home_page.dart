import 'package:flutgo/services/authservice.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Text('You are logged in'),
      ElevatedButton(
          onPressed: () {
            AuthService().signOut();
          },
          child: const Center(child: Text('LOG OUT')))
    ]));
  }
}
