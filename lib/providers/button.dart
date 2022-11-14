import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../main.dart';

class Button extends StatelessWidget {

  final String data;
  final String location;
  final double fontSize;
  final FontWeight fontWeight;
  
   Button(this.data, this.location, this.fontSize, this.fontWeight);

  @override
  Widget build(BuildContext context) {
    return Container(
          padding: EdgeInsets.fromLTRB(31, 30, 0, 0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: MyApp.accentColor, //background color of button
              side: BorderSide(width: 5, color: MyApp.accentColor),
              shape: RoundedRectangleBorder(
                //to set border radius to button
                borderRadius: BorderRadius.circular(16),
              ),
              minimumSize: Size(10.0, 47.0),
            ),
            onPressed: () => context.go('/$location'),
            child: Text(
              data,
              style: TextStyle(
                  fontFamily: 'Aeonik',
                  fontWeight: fontWeight,
                  fontSize: fontSize),
            ),
          ),
        );
  }
}