import 'package:flutter/material.dart';
import '../custom_widgets/CutomAppBar.dart';
import '../custom_widgets/CustomDrawerWidget.dart';

class LaborManagement extends StatefulWidget {
  @override
  _LaborManagementState createState() => _LaborManagementState();
}

class _LaborManagementState extends State<LaborManagement> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new CustomAppBar(),
      drawer: new DrawerWidget(),
      body: new Text("This is Labor management screen"),
    );
  }
}
