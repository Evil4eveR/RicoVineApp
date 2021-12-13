import 'package:flutter/material.dart';

import '../menu_item.dart';
import 'navbar.dart';

class ContactUs extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      drawer: MenuItems(),
      appBar: NavBar("Contact Us"),
      body:
      Column(
        children:[
          Container(
              child: Text("welcome to Contact Us",style: TextStyle(fontSize: 50),)
          ),
        ],
      ),
    );
  }

}