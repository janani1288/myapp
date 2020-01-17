import 'package:flutter/material.dart';
import 'custom_widgets/CustomDrawerWidget.dart';

import 'package:myapp/custom_widgets/CutomAppBar.dart';
import 'colors.dart';

class HomePage extends StatefulWidget {

  HomePage({Key key}) : super(key:key);

  @override
  State<HomePage> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new CustomAppBar(),
      body: new Text("Landing Page : You have successfully Logged in."),
      drawer: new DrawerWidget(),
    );
  }
}

ThemeData buildAppTheme() {
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