import 'dart:io';
import 'package:flutter/cupertino.dart';

class AddFile extends ChangeNotifier
{
  List<File> imageFile=[];
  addImage(List <File> img)
  {
    imageFile=img;
    notifyListeners();
  }

  deleteImage(List <File> img)
  {

    for(int i=0;i<imageFile.length;i++) {
      imageFile.remove(img[i]);
      notifyListeners();
    }
    // for (var element in img) {
    //    element.delete();
    //  }
    notifyListeners();
  }

}
