import 'package:flutter/material.dart';

import '../menu_item.dart';
import 'navbar.dart';

class AboutUs extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        drawer: MenuItems(),
    appBar: NavBar("About Us"),
    body:
    Column(
    children:[
      Container(
          child: Text("welcome to About Us",style: TextStyle(fontSize: 50),)
      ),
      ],
    ),
    );
  }

}