import 'package:flutter/material.dart';
import 'package:rvapp/layouts/navbar.dart';
import 'package:rvapp/menu_item.dart';

class Treatment extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuItems(),
      appBar: NavBar("Treatment"),
      body:
      Column(
          children:[
            Container(
              child: Text("hello",style: TextStyle(fontSize: 50),)
            ),
          ]
      ),
    );
  }

}