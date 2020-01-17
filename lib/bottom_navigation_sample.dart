import 'package:flutter/material.dart';
import 'package:myapp/colors.dart';
import 'package:myapp/home.dart';
import 'Screens/login.dart';

class EdhensApp extends StatefulWidget {
  @override
  _EdhensAppState createState() => _EdhensAppState();
}

class _EdhensAppState extends State<EdhensApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Edhens"),
        ),
          body: SafeArea(
            child: HomePage(),
          ),
        bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.category),
            title: new Text('Work'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.person),
            title: new Text('Labor'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.location_city),
              title: Text('Stock')
          )
        ],
      ),
      ),
      theme: _buildAppTheme(),

    );
  }
}

ThemeData _buildAppTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
      accentColor: edhensAccentTeal900,
      primaryColor: edhensOrange100,
      buttonTheme: base.buttonTheme.copyWith(
        buttonColor: edhensOrange200,
        textTheme: ButtonTextTheme.normal,
      ),
      scaffoldBackgroundColor: edhensWhite,
      cardColor: edhensWhite,
      textSelectionColor: edhensOrange50,
      errorColor: edhensErrorRed,
      // TODO: Add the text themes (103)
      textTheme: _buildEdhensTextTheme(base.textTheme),
      primaryTextTheme: _buildEdhensTextTheme(base.primaryTextTheme),
      accentTextTheme: _buildEdhensTextTheme(base.accentTextTheme),
      // TODO: Add the icon themes (103)
      primaryIconTheme: base.iconTheme.copyWith(
          color: edhensTextIconColor
      ),
      // TODO: Decorate the inputs (103)
      /*inputDecorationTheme: InputDecorationTheme(
        border: CutCornersBorder(),
      )*/
  );

}

TextTheme _buildEdhensTextTheme(TextTheme base) {
  return base.copyWith(
    headline: base.headline.copyWith(
      fontWeight: FontWeight.w500,
    ),
    title: base.title.copyWith(
        fontSize: 18.0
    ),
    caption: base.caption.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 14.0,
    ),
  ).apply(
    fontFamily: 'Rubik',
    displayColor: edhensTextIconColor,
    bodyColor: edhensTextIconColor,
  );
}