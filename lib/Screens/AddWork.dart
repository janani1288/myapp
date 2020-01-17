import 'package:flutter/material.dart';
import 'package:myapp/custom_widgets/CustomTextFormField.dart';
import '../custom_widgets/CutomAppBar.dart';
import '../custom_widgets/CustomDrawerWidget.dart';
import '../custom_widgets/CustomDateField.dart';
import '../ModelClasses.dart';

class AddWork extends StatefulWidget {

  final OldWork work;

  AddWork({Key key,this.work}):super(key:key);

  @override
  _AddWorkState createState() => _AddWorkState();
}

class _AddWorkState extends State<AddWork> {

  TextEditingController date;
  TextEditingController serialNumber;
  TextEditingController workName;
  TextEditingController length;
  TextEditingController width;
  TextEditingController height;
  TextEditingController totalMeasurement;
  TextEditingController rate;
  TextEditingController totalValue;
  TextEditingController deductLength;
  TextEditingController deductWidth;
  TextEditingController deductHeight;
  TextEditingController remarks;


  int _isThereDeductable=0;

  bool _showDeductSection = false;

  @override
  Widget build(BuildContext context) {



    date = new TextEditingController(text:widget.work.date);
    serialNumber = new TextEditingController(text:widget.work.serialNumber);
    workName = new TextEditingController(text:widget.work.workName);
    length = widget.work.length != null ? new TextEditingController(text:widget.work.length.toString()) : new TextEditingController();
    width = new TextEditingController(text:widget.work.width.toString());
    height = new TextEditingController(text:widget.work.height.toString());
    totalMeasurement = new TextEditingController(text:widget.work.totalMeasurement.toString());
    rate = new TextEditingController(text:widget.work.rate.toString());
    totalValue = new TextEditingController(text:widget.work.totalValue.toString());
    deductLength = new TextEditingController(text:widget.work.deductLength.toString());
    deductWidth = new TextEditingController(text:widget.work.deductWidth.toString());
    deductHeight = new TextEditingController(text:widget.work.deductHeight.toString());
    remarks = new TextEditingController(text:widget.work.remarks.toString());
    _isThereDeductable=widget.work !=null && widget.work.isDeduct!=null ? widget.work.isDeduct?1:0 : 0;
    _showDeductSection = widget.work.isDeduct??false;

    return new Scaffold(
      appBar: new CustomAppBar(),
      //drawer: new DrawerWidget(),
      body: ListView(
        children: <Widget>[
          _formDesign(),
        ],
      ),

    );
  }

  void _handleIsDeductValueChange(int value) {
    switch(value) {
      case 0:
        _showDeductSection = false;
        break;
      case 1:
        _showDeductSection = true;
        break;
    }
    setState(() {
      _isThereDeductable = value;
    });
  }


  deductBox() {
    return Column(
      children: <Widget>[
        CustomTextFormField(
          controller: deductLength,
          labelText: 'Deduct Length',
          validationText: 'Please enter deduct length',
        ),
        CustomTextFormField(
          controller: deductWidth,
          labelText: 'Deduct Width',
          validationText: 'Please enter deduct width',
        ),
        CustomTextFormField(
          controller: deductHeight,
          labelText: 'Deduct Height',
          validationText: 'Please enter deduct height',
        ),
      ],
    );
  }


  Widget _formDesign() {
    final _formKey = GlobalKey<FormState>();
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CustomDateField(
              labelText: 'Date',
              validationText: 'Please select date',
              controller: date,
            ),
            CustomTextFormField(
              controller: serialNumber,
              labelText: 'Serial number',
              validationText: 'Please enter serial number',
            ),
            CustomTextFormField(
              controller: workName,
              labelText: 'Name of the work',
              validationText: 'Please enter name of the work',
            ),
            CustomTextFormField(
              controller: length,
              labelText: 'Length',
              validationText: 'Please enter length',
            ),
            CustomTextFormField(
              controller: width,
              labelText: 'Breadth/Width',
              validationText: 'Please enter width',
            ),
            CustomTextFormField(
              controller: height,
              labelText: 'Height',
              validationText: 'Please enter height',
            ),
            CustomTextFormField(
              controller: totalMeasurement,
              labelText: 'Total Measurement',
              validationText: 'Please enter total measurement',
            ),
            CustomTextFormField(
              controller: rate,
              labelText: 'Rate',
              validationText: 'Please enter rate',
            ),
            CustomTextFormField(
              controller: totalValue,
              labelText: 'Total value to date',
              validationText: 'Please enter total value to date',
            ),
            SizedBox(height: 20,),
            Text('Do you have deduct measurement to enter?'),
            Row(
              children: <Widget>[
                new Radio(value: 0, groupValue: _isThereDeductable, onChanged: _handleIsDeductValueChange),
                new Text('No'),
                new Radio(value: 1, groupValue: _isThereDeductable, onChanged: _handleIsDeductValueChange),
                new Text('Yes'),
              ],
            ),
            _showDeductSection ? deductBox():new Container(height: 0,width: 0,) ,
            CustomTextFormField(
              controller: remarks,
              labelText: 'Remarks',
              validationText: 'Please enter remarks',
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: RaisedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    print('Validated');
                    OldWork work = new OldWork(
                      date: 'Dummy Date',
                      serialNumber: serialNumber.text,
                      workName: workName.text,
                      length: double.parse(length.text),
                      width: double.parse(width.text),
                      height: double.parse(height.text),
                      totalMeasurement: double.parse(totalMeasurement.text),
                      rate: double.parse(rate.text),
                      totalValue: double.parse(totalValue.text),
                      deductLength: deductLength.text.isEmpty? 0.0 :double.parse(deductLength.text),
                      deductWidth: deductWidth.text.isEmpty?0.0:double.parse(deductWidth.text),
                      deductHeight: deductHeight.text.isEmpty?0.0:double.parse(deductHeight.text),
                      remarks: remarks.text
                    );
                    print(work.toJson().toString());
                    Navigator.pop(context);
                  }
                  print('Outside validate');
                    /*Work work = new Work(date:'date',
                        serialNumber: serialNumber.text,
                        workName : workName.text,
                        length : double.parse(length.text),
                        width : double.parse(width.text),
                        height : double.parse(height.text),
                        totaltotalMeasurement.text, deductLength.text, deductWidth.text, deductHeight.text, remarks.text);
                  }*/
                },
                child: Text('Submit'),
              ),
            ),

          ],
        ),
      )
    );

  }
}






