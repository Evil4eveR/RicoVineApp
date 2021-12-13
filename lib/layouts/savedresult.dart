import 'package:flutter/material.dart';

import '../menu_item.dart';
import 'navbar.dart';

class SavedResult extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      drawer: MenuItems(),
      appBar: NavBar("Saved Result"),
      body:
      Column(
        children:[
          Container(
              child: Text("welcome to Saved Result",style: TextStyle(fontSize: 50),)
          ),
        ],
      ),
    );
  }

}