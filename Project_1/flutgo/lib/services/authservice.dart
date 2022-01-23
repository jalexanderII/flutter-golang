import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../login_page.dart';
import '../user_model.dart';

class AuthService {
  var loggedIn = false;
  //Determine if the user is authenticated.
  handleAuth() {
    return StreamBuilder(builder: (BuildContext context, snapshot) {
      return LoginPage();
    });
  }

  Future<AuthResponse> login(AuthRequest request) async {
    var url = Uri.parse("http://127.0.0.1:9092/api/auth/login");
    var response = await http.post(url,
        body: {'identity': request.identity, 'password': request.password});
    late AuthResponse resp;

    if (response.statusCode == 200) {
      resp = AuthResponse.fromJson(jsonDecode(response.body));
    }

    return resp;
  }

  //Sign out
  void signOut() {
    if (kDebugMode) {
      print("Signed out");
    }
  }

  //Sign In
  void signIn(String email, String password, context) async {
    var req = AuthRequest(identity: email, password: password);
    AuthResponse resp = await login(req);
    if (resp.status == "success") {
      Navigator.of(context).pushReplacementNamed('/home');
    } else {
      if (kDebugMode) {
        print(resp.status);
      }
    }
  }
}
