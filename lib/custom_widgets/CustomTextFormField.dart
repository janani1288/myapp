import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {

  final String labelText;
  final String validationText;
  final TextEditingController controller;

  CustomTextFormField({Key key,this.labelText,this.validationText,this.controller});

  @override
  Widget build(BuildContext context) {
    return /*Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child:*/
      TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText
        ),
        validator: (value) {
          if (value.isEmpty) {
            return validationText;
          }
          return null;
        },
      //),
    );
  }
}
