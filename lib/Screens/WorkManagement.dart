import 'package:flutter/material.dart';
import 'package:myapp/ModelClasses.dart';
import 'package:myapp/colors.dart';
import 'package:myapp/custom_widgets/WorkListItem.dart';
import '../custom_widgets/CutomAppBar.dart';
import '../custom_widgets/CustomDrawerWidget.dart';
import 'AddWork.dart';

class WorkManagement extends StatefulWidget {
  @override
  _WorkManagementState createState() => _WorkManagementState();
}

class _WorkManagementState extends State<WorkManagement> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new CustomAppBar(),
      drawer: new DrawerWidget(),
      body: _buildBody(),
      floatingActionButton: new FloatingActionButton(
          onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddWork(work: new OldWork())));
          },
        child: Icon(Icons.add),
        backgroundColor: edhensOrange100,
          ),
    );
  }

  _buildBody() {
    //return WorkListItem();
    List<OldWork> dummyList = buildDummyWorkList();
    return ListView.builder(
      itemCount: dummyList.length,
      itemBuilder: (context, index) {
        return Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddWork(work: dummyList[index],)));
                },
                trailing: Icon(Icons.edit, size: 50),
                title: Text(dummyList[index].workName),
                subtitle: Text('L: ${dummyList[index].length}  W: ${dummyList[index].width} H:${dummyList[index].height}'),
              ),
            ],
          ),
        );
      },
    );
  }

  List<OldWork> buildDummyWorkList() {
    List<OldWork> works = new List();
    OldWork work1 = new OldWork(id:1, date: '5 Jan 2020',serialNumber: 'ser1234', workName: 'Painting', length: 5,width: 6,height: 6,totalMeasurement: 15,rate: 5.5,totalValue: 16,deductLength: 1,deductWidth: 5,deductHeight: 7,remarks: 'Upto speed',isDeduct: true);
    OldWork work2 = new OldWork(id:2, date: '5 Jan 2020',serialNumber: 'ser126', workName: 'Carpenting', length: 5,width: 6,height: 6,totalMeasurement: 15,rate: 5.5,totalValue: 16,remarks: 'Upto speed', isDeduct: false);
    works.add(work1);
    works.add(work2);
    return works;
  }
}


