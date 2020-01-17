import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {

  final IconData icon;
  final String hintText;
  final bool isObscure;
  final TextEditingController controller;
  final String validationText;

  LoginTextField({Key key, this.icon, this.hintText, this.isObscure,this.controller, this.validationText});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width/1.2,
      height: 45,
      padding: EdgeInsets.only(
          top: 4,left: 16, right: 16, bottom: 4
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
              Radius.circular(50)
          ),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                blurRadius: 5
            )
          ]
      ),
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: Icon(icon,
            color: Colors.grey,
          ),
          labelText: hintText,
        ),
        obscureText: isObscure,
        controller: controller,
        validator: (value){
          if(value == null || value.isEmpty) {
            return validationText;
          }
          return null;
        },
      ),
    );
  }

}