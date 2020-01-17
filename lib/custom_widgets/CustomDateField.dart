import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';

class CustomDateField extends StatelessWidget {

  final format = DateFormat("yyyy-MM-dd");
  final String labelText;
  final String validationText;
  final TextEditingController controller;

  CustomDateField({Key key,this.labelText,this.validationText, this.controller});
  @override
  Widget build(BuildContext context) {
    return
      DateTimeField(
        controller: controller,
        validator: (value){
          if(value == null) {
            return validationText;
          }
          return null;
        },
        decoration: InputDecoration(labelText: labelText),
        format: format,
        onShowPicker: (context, currentValue) {
          return showDatePicker(
              context: context,
              firstDate: DateTime(1900),
              initialDate: currentValue ?? DateTime.now(),
              lastDate: DateTime(2100));
        },
    );
  }
}