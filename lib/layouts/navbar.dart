import 'package:flutter/material.dart';

AppBar NavBar(String title){
  return AppBar(
      shape: ShapeBorder.lerp(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ), null,
        0,
      ),
      title: Text(title, style:TextStyle(
        fontFamily: "SawaraBiMincho",
        fontSize: 28,
      ),
        textAlign: TextAlign.center,
      ),
      actions: [
        IconButton(
            onPressed: (){print("menubar");},
            icon: Icon(Icons.info)),
      ]
  );
  }
