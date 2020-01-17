import 'package:flutter/material.dart';
import 'package:myapp/Screens/WorkManagement.dart';
import 'package:myapp/Screens/LaborManagement.dart';
import 'package:myapp/colors.dart';

class DrawerWidget extends StatefulWidget {
  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: ListView(
        children: <Widget>[
          Container(
            height: 100.0,
            child: new DrawerHeader(
              child: new Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Menu",
                    style: TextStyle(
                      color: edhensWhite,
                      fontSize: 25.0,
                    ),
                )
              ),
              decoration: new BoxDecoration(
                  gradient: LinearGradient(
                    colors: [edhensOrange200, edhensOrange100],
                  ),
              ),

            ),
          ),
          new ListTile(
            title: new Text(
                "Work Management",
                style: TextStyle(
                  color: edhensTextIconColor,
                ),
            ),
            onTap: (){
              Navigator.pop(context);
              Navigator.pushNamed(context, '/work');
              //Navigator.push(context, new MaterialPageRoute(builder: (context)=> new WorkManagement()));
            },
          ),
          new Divider(
            color: edhensDividerColor,
          ),
          new ListTile(
            title: new Text(
                "Labor Management",
                style: TextStyle(
                color: edhensTextIconColor,
              ),),
            onTap: (){
              Navigator.pop(context);
              Navigator.pushNamed(context, '/labor');
              //Navigator.push(context, new MaterialPageRoute(builder: (context)=> new LaborManagement()));
            },
          ),
          new Divider(
            color: edhensDividerColor,
          ),
          new ListTile(
            title: new Text(
              "Logout",
              style: TextStyle(
                color: edhensTextIconColor,
              ),),
            onTap: (){
              Navigator.pop(context);
              Navigator.pushNamed(context, '/login');
              //Navigator.push(context, new MaterialPageRoute(builder: (context)=> new LaborManagement()));
            },
          ),
        ],
      ),
    );
  }
}
