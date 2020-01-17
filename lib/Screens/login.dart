import 'dart:convert';

import 'package:flutter/material.dart';
import '../custom_widgets/CustomLoginTextField.dart';
import '../custom_widgets/CustomButton.dart';
import '../ModelClasses.dart';
import '../DatabaseHelper.dart';
import '../DBHelper.dart';

class LoginPage extends StatefulWidget {

  LoginPage({Key key}) : super(key:key);

  @override
  State<LoginPage> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  final dbHelper = DBHelper.instance;
  final _formKey = new GlobalKey<FormState>();

  TextEditingController userNameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {

    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/logo.png'),
      ),
    );

    final email = TextFormField(
      keyboardType: TextInputType.text,
      autofocus: false,
        controller: userNameController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter username';
          }
        },
      decoration: InputDecoration(
        hintText: 'Username',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final password = TextFormField(
      autofocus: false,
      //initialValue: 'some password',
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () async {
          if (_formKey.currentState.validate()) {
            print("on Login pressed");
            User user = await DBHelper.getUser(userNameController.text);
            if (user != null) {
              if (passwordController.text == user.password) {
                print('Go to the next screen');
              } else {
                print('Incorrect Password');
              }
            } else {
              print('No such username');
            }
          }
        },
        padding: EdgeInsets.all(12),
        color: Colors.lightBlueAccent,
        child: Text('Log In', style: TextStyle(color: Colors.white)),
      ),
    );

    return Scaffold(
          body: Center(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            children: <Widget>[
              //_formDesign()
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    logo,
                    SizedBox(height: 48.0),
                    email,
                    SizedBox(height: 8.0),
                    password,
                    SizedBox(height: 24.0),
                    loginButton,
                  ],
                ),
              )

            ],
          )
        )
      );


  }


}

