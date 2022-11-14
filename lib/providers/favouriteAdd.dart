import 'package:flutter/material.dart';

class favouriteAdd with ChangeNotifier {

  List<String> authorName=[];

  void favAdd(String data){
    authorName.add(data);
    notifyListeners();
  }
}