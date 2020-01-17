import 'package:flutter/material.dart';
import 'package:myapp/colors.dart';


class EdhensButton extends StatelessWidget {
  final String label;
  final GestureTapCallback onPressed;

  EdhensButton({Key key, this.label, this.onPressed});

  @override
  Widget build(BuildContext context) {

    return RaisedButton(
      child: Text(label),
      onPressed: onPressed,
    );
    /*return GestureDetector(
        onTap: onPressed,
        child: Container(
            height: 45,
            //width: 100,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [edhensOrange200, edhensOrange100],
              ),
              borderRadius: BorderRadius.all(Radius.circular(50)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.8),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0,7),
                ),
              ]
            ),
            child: Center(
              child: Text(
                label.toUpperCase(),
                style: TextStyle(
                  color: edhensWhite,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )));*/
  }
}
