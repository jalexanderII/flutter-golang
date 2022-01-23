import 'package:flutgo/services/authservice.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();

  late String email, password;

  Color greenColor = const Color(0xFF00AF19);

  //To check fields during submit
  checkFields() {
    final form = formKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  //To Validate email
  String? validateEmail(String value) {
    var pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Enter Valid Email';
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Form(key: formKey, child: _buildLoginForm(context))));
  }

  _buildLoginForm(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: ListView(children: [
          const SizedBox(height: 75.0),
          SizedBox(
              height: 125.0,
              width: 200.0,
              child: Stack(
                children: [
                  const Text('Hello',
                      style: TextStyle(fontFamily: 'Trueno', fontSize: 60.0)),
                  const Positioned(
                      top: 50.0,
                      child: Text('There',
                          style:
                              TextStyle(fontFamily: 'Trueno', fontSize: 60.0))),
                  Positioned(
                      top: 97.0,
                      left: 175.0,
                      child: Container(
                          height: 10.0,
                          width: 10.0,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: greenColor)))
                ],
              )),
          const SizedBox(height: 25.0),
          TextFormField(
              decoration: InputDecoration(
                  labelText: 'EMAIL',
                  labelStyle: TextStyle(
                      fontFamily: 'Trueno',
                      fontSize: 12.0,
                      color: Colors.grey.withOpacity(0.5)),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: greenColor),
                  )),
              onChanged: (value) {
                email = value;
              },
              validator: (value) =>
                  value!.isEmpty ? 'Email is required' : validateEmail(value)),
          TextFormField(
              decoration: InputDecoration(
                  labelText: 'PASSWORD',
                  labelStyle: TextStyle(
                      fontFamily: 'Trueno',
                      fontSize: 12.0,
                      color: Colors.grey.withOpacity(0.5)),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: greenColor),
                  )),
              obscureText: true,
              onChanged: (value) {
                password = value;
              },
              validator: (value) =>
                  value!.isEmpty ? 'Password is required' : null),
          const SizedBox(height: 5.0),
          GestureDetector(
            onTap: () {
              if (checkFields()) AuthService().signIn(email, password, context);
            },
            child: SizedBox(
                height: 50.0,
                child: Material(
                    borderRadius: BorderRadius.circular(25.0),
                    shadowColor: Colors.greenAccent,
                    color: greenColor,
                    elevation: 7.0,
                    child: const Center(
                        child: Text('LOGIN',
                            style: TextStyle(
                                color: Colors.white, fontFamily: 'Trueno'))))),
          ),
          // SizedBox(height: 20.0),
          // Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          //   Text('New to Spotify ?'),
          //   SizedBox(width: 5.0),
          //   InkWell(
          //       onTap: () {
          //         Navigator.of(context).push(
          //             MaterialPageRoute(builder: (context) => SignupPage()));
          //       },
          //       child: Text('Register',
          //           style: TextStyle(
          //               color: greenColor,
          //               fontFamily: 'Trueno',
          //               decoration: TextDecoration.underline)))
          // ])
        ]));
  }
}
