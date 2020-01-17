/*import 'package:flutter/material.dart';
import 'package:myapp/colors.dart';
import 'login.dart';

void main() {

  final ThemeData myAppTheme = buildTheme();


  return runApp(MaterialApp(
    title: "Edhens",
    home: new LoginPage(),
    theme: myAppTheme,
  ));
}

ThemeData buildTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    accentColor: accentColor,
    primaryColor: primaryColor,
    buttonColor: primaryColor,
    scaffoldBackgroundColor: lightPrimaryColor,
    cardColor: lightPrimaryColor,
    textSelectionColor: primaryColor,
    errorColor: Colors.red,
  );
}

*/

import 'package:flutter/material.dart';
import 'package:myapp/Screens/LaborManagement.dart';
import 'package:myapp/Screens/WorkManagement.dart';
import 'package:myapp/home.dart';
import 'package:myapp/Screens/login.dart';
import 'package:myapp/Screens/AddWork.dart';


void main() {
  runApp(App());
}


class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      routes: {
      '/login':(context) => LoginPage(),
      '/home':(context) => HomePage(),
      '/work':(context) => WorkManagement(),
      '/labor':(context) => LaborManagement(),
        '/addwork':(context) => AddWork(),
      },
      theme: buildAppTheme(),
    );
  }
}








/*
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "User List",
      home: Scaffold(
        appBar: AppBar(
          title: Text("User List"),
        ),
        body: Center(
            child: UsersListView()
        ),
      ),
    );
  }
}*/
