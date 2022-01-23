import 'package:flutgo/services/authservice.dart';
import 'package:flutgo/user_list_page.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthService().handleAuth(),
      routes: <String, WidgetBuilder>{
        // Set routes for using the Navigator.
        '/home': (BuildContext context) => const ListUsers(),
        '/login': (BuildContext context) => LoginPage()
      },
    );
  }
}
