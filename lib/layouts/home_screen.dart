import 'package:flutter/material.dart';
//import 'package:rvapp/start.dart';

class HomeScreen extends StatelessWidget{
  @override
  // ignore: prefer_const_constructors
  Widget build(BuildContext context) {
    final screenW = MediaQuery.of(context).size.width;
    final screenH = MediaQuery.of(context).size.height;
    final sysBarH = MediaQuery.of(context).padding.top;
    print(sysBarH);
    print(screenH);
    print(screenW);
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children:[
                    Container(
                        // margin: EdgeInsets.only(left: 15, right: 15, top: 80
                        height: screenH/2,
                        width: screenW-(screenW/5),
                        child: Image.asset("assets/images/started page.png",
                        fit: BoxFit.cover),
              ),
                        Container(
                          margin: EdgeInsets.only(bottom: (screenH/30)),
                          child: Text("Rico Vine App",
                          style: TextStyle(
                          fontFamily: "Lobster",
                          fontSize: 40,
                          color: Color(0xFF781645)
                          ),
                              ),
                            ),
                   Container(

                        margin: EdgeInsets.only(bottom: 30),
                        padding: EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: screenW/8,
                        ),
                        child: Center(
                          child: Text("Recognizing the types of the vine based on the image of its leaves.",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontFamily: "FuzzyBubbles",
                              fontSize: 25,
                              color: Color(0xFF1b8260),
                                ),
                                ),
                        ),
                    ),
                    Container(
                        padding: EdgeInsets.all(45),
                        child:ElevatedButton(onPressed: (){
                          Navigator.of(context).push(MaterialPageRoute(
                              builder:(context)=> Treatment()
                          )
                          );
                        },
                            style: ElevatedButton.styleFrom(

                              textStyle: TextStyle(
                                fontSize: 40,
                                fontFamily: "PermanentMarker"
                              ),
                              primary: Color(0xFF781645),
                              onPrimary: Colors.greenAccent,
                            ),
                            child: Text('Get Started'))
                    ),
                  ]
            ),
              ),
          ),
      );
  }
}