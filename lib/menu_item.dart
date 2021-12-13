 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rvapp/layouts/aboutus.dart';
import 'package:rvapp/layouts/contactus.dart';
import 'package:rvapp/layouts/savedresult.dart';


class MenuItems extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Drawer(
     child: ListView(
       padding: EdgeInsets.zero,
       children: [
         UserAccountsDrawerHeader(
            accountName: Text("Admin",
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.black87,
            ),
     ),
            accountEmail: Text("mail@mail.com",
              style: TextStyle(
                fontSize: 25,
                color: Colors.black87,
              ),
            ),
           currentAccountPicture: CircleAvatar(
             child: ClipOval(
               child: Image.asset("assets/images/me.jpg",
                 fit:BoxFit.cover,
               ),
             ),
           ),
           decoration: BoxDecoration(
             image: DecorationImage(
               image: AssetImage("assets/images/image.png"),
               fit: BoxFit.cover,
             )
           ),
        ),
         ListTile(
           leading:Icon(Icons.save),
           title: Text('Saved Results'),
           onTap: (){
             Navigator.of(context).push(MaterialPageRoute(builder:(context)=>SavedResult()));
           },
         ),
         Divider(),
         ListTile(
           leading:Icon(Icons.contact_page),
           title: Text('Contact Us'),
           onTap: (){
             Navigator.of(context).push(MaterialPageRoute(builder:(context)=> ContactUs()));
           },
         ),
         ListTile(
           leading:Icon(Icons.info),
           title: Text('About US'),
           onTap: (){
             Navigator.of(context).push(MaterialPageRoute(builder:(context)=> AboutUs()));
           },
         ),
         Divider(),
         ListTile(
           leading:Icon(Icons.exit_to_app),
           title: Text('Exit'),
           onTap: (){print("exit");},
         ),

       ],
     ),
   );
  }
}

showDialogWidget(BuildContext context) {
   return showDialog(
       context: context,
       builder: (newContext) {
         return AlertDialog(
           // when i did print("sth") it printed
           title: Text("Are you sure?"),
           content: Text("Would you really want to exit the app?"),
           actions: [
             TextButton(onPressed: () {SystemNavigator.pop();}, child: Text("Exit")),
             TextButton(onPressed: () {Navigator.of(context).pop(false);}, child: Text("Cancel")),
           ],
           elevation: 10.0,
           backgroundColor: Colors.green,
         );
       });
 }
