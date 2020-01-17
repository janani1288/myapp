import 'package:flutter/material.dart';
import 'package:myapp/Screens/AddWork.dart';
import 'package:myapp/ModelClasses.dart';

class WorkListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            onTap: (){
              OldWork work = new OldWork(serialNumber: 'ser1234');
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddWork(work: work,)));
            },
            trailing: Icon(Icons.edit, size: 50),
            title: Text('Work Name'),
            subtitle: Text('L: 25  W: 50 H:75'),
          ),
        ],
      ),
    );
  }
}
