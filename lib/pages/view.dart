import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:smart_test/pages/search.dart';
import 'package:smart_test/provider/add_file.dart';
import 'package:smart_test/service/file_db.dart';
import 'package:smart_test/service/image_file.dart';
import 'package:smart_test/ulity.dart';

class View extends StatefulWidget {
  const View({Key? key}) : super(key: key);
  static const id = 'View';
  static List<String> results = [];
  @override
  _ViewState createState() => _ViewState();
}

class _ViewState extends State<View> {

  // List<File> images = AddFile().imageFile;

  final Color  _colors = const Color(0x99499973);
  final Color _colors2 = const Color(0x8499D7B4);
  final Color _colors3 = const Color(0x59011509);
  final Color _colors4 = const Color(0x593E6D2F);
  final Color _colors5 = const Color(0x5967AF34);
  bool isLoading = false;
  double progress = 0.0;
  final Dio dio = Dio();
  late DatabaseFile db;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    db = DatabaseFile ();
  }

  @override
  Widget build(BuildContext context) {

    ImagesFile? imgFile = ModalRoute.of(context)!.settings.arguments as ImagesFile? ;

    List<File> imageFile = Provider.of<AddFile>(context).imageFile;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            // const SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // زر الرجوع الى الخلف
                MaterialButton(
                  minWidth: 40,
                  height: 50,
                  color: Colors.white70,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      )),
                  child: const Icon(Icons.arrow_back_ios_rounded,
                      color: Colors.black),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),

                //// زر القائمةالجانبية
                MaterialButton(
                  minWidth: 40,
                  height: 50,
                  color: Colors.white70,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      )),
                  child: const Icon(Icons.menu_sharp, color: Colors.black),
                  onPressed: () {},
                ),
              ],
            ),
            // const SizedBox(height: 10,),
            const SizedBox(
              height: 50,
            ),
            Container(
              height: 70,
              width: MediaQuery.of(context).size.width * .8,
              color: Colors.green,
              alignment: Alignment.center,
              child: const Text(
                'THE RESULT',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 34),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              color: _colors2,
              width: MediaQuery.of(context).size.width * .8,
              height: MediaQuery.of(context).size.height * .53,
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  // ListView.builder(
                  //     itemCount:imageFile.length,
                  //     itemBuilder: (context,index) {}),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(0),
                        child: Column(
                          children: [
                            ClipOval(
                              child: Container(

                                padding: const EdgeInsets.all(0),
                                height: 55,
                                width: 55,
                                child: Image.memory(Utility.image(imgFile!.image1!),fit: BoxFit.fill,),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              color: _colors3,
                              alignment: Alignment.center,
                              height: 40,
                              width: 50,
                              child: Text(
                                '${imgFile.result1}',
                                style:const TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(0),
                        child: Column(
                          children: [
                            ClipOval(
                              child: Container(

                                  padding: const EdgeInsets.all(0),
                                  height: 55,
                                  width: 55,
                                  child:Image.memory(Utility.image(imgFile.image2!),fit: BoxFit.fill,)

                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              color: _colors3,
                              alignment: Alignment.center,
                              height: 40,
                              width: 50,
                              child:  Text('${imgFile.result2}',
                                style:const TextStyle(color: Colors.white),
                              ),
                            )

                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(0),
                        child: Column(
                          children: [
                            ClipOval(
                              child: Container(

                                  padding: const EdgeInsets.all(0),
                                  height: 55,
                                  width: 55,
                                  child:Image.memory(Utility.image(imgFile.image3!),fit: BoxFit.fill,)

                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              color: _colors,
                              alignment: Alignment.center,
                              height: 40,
                              width: 50,
                              child:  Text(
                                '${imgFile.result3}',
                                style:const TextStyle(color: Colors.white),
                              ),
                            )

                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(0),
                        child: Column(
                          children: [
                            ClipOval(
                              child: Container(
                                padding: const EdgeInsets.all(0),
                                height: 55,
                                width: 55,
                                child: imgFile.image4!.isNotEmpty
                                    ?  Image.memory(Utility.image(imgFile.image4!),fit: BoxFit.fill,)
                                    : Container(),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            imgFile.image4!.isNotEmpty
                                ? Container(
                              color: _colors4,
                              alignment: Alignment.center,
                              height: 40,
                              width: 50,
                              child: Text(
                                '${imgFile.result4}',
                                style:const TextStyle(color: Colors.white),
                              ),
                            )
                                : Container(),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(0),
                        child: Column(
                          children: [
                            ClipOval(
                              child: Container(
                                padding: const EdgeInsets.all(0),
                                height: 55,
                                width: 55,
                                child: imgFile.image5!.isNotEmpty
                                    ?  Image.memory(Utility.image(imgFile.image5!),fit: BoxFit.fill,)
                                    : Container(),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            imgFile.image5!.isNotEmpty
                                ? Container(
                              color: _colors5,
                              alignment: Alignment.center,
                              height: 40,
                              width: 50,
                              child: Text(
                                '${imgFile.result5}',
                                style:const TextStyle(color: Colors.white),
                              ),
                            )
                                : Container(),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Container(
                      color: _colors,
                      height: MediaQuery.of(context).size.height * .3,
                      width: MediaQuery.of(context).size.width * .69,
                      child: Text(
                        '${imgFile.details}',
                        style:const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 0,
                vertical: 8,
              ),
              child: Row(
                //crossAxisAlignment: CrossAxisAlignment,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  //share
                  Column(children: <Widget>[
                    MaterialButton(
                      minWidth: 65,
                      height: 65,
                      color: Colors.green,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(35)),
                      child: const Icon(
                        Icons.share_sharp,
                        color: Colors.white,
                        size: 35,
                      ),
                      onPressed: () {},
                    ),
                    const Text('Share', style: TextStyle(fontSize: 18)),
                  ]),
                  //save
                  Column(children: <Widget>[
                    MaterialButton(
                      minWidth: 65,
                      height: 65,
                      color: Colors.green,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(35)),
                      child: const Icon(
                        Icons.save_outlined,
                        color: Colors.white,
                        size: 35,
                      ),
                      onPressed: () {
                        // db.save(ImagesFile(
                        //   id: 0,
                        //   date: DateTime.now(),
                        //   details: 'this result for flowers',
                        //   image1: MainPage.imageName[0],
                        //   image2: MainPage.imageName[1],
                        //   image3: MainPage.imageName[2],
                        //   image4: MainPage.imageName[3],
                        //   image5: MainPage.imageName[4],
                        //   result1: '94',
                        //   result2: '87',
                        //   result3: '54',
                        //   result4: '45',
                        //   result5: '33',
                        // ));
                        // downloadFile();
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SearchPage(),
                            ));

                      },
                    ),
                    const Text('Save', style: TextStyle(fontSize: 18)),
                  ]),
                  //delete
                  Column(children: <Widget>[
                    MaterialButton(
                      minWidth: 65,
                      height: 65,
                      color: Colors.lightGreen,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(35)),
                      child: const Icon(
                        Icons.delete,
                        color: Colors.white,
                        size: 35,
                      ),
                      onPressed: () async {
                        await db.delete(imgFile.id!);
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SearchPage(),
                            ));
                      },
                    ),
                    const Text('Delete', style: TextStyle(fontSize: 18)),
                  ]),
                ],
              ),
            ),
            isLoading
                ? LinearProgressIndicator(
              minHeight: 10,
              value: progress,
            )
                : Container(),
          ],
        ),
      ),
    );
  }
}
