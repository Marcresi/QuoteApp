
import 'package:flutter/material.dart';

class Counter with ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment1() {
    if(count >=20){
      _count=_count;
    }
    else{
    _count++;
    notifyListeners();}
  }

  void increment2() {
    if(count >=10){
      _count=_count;
    }
    else{
    _count++;
    notifyListeners();}
  }

  void decrement() {
    if(count <=0){
      _count=_count;
    }
    else{
    _count--;
    notifyListeners();}
  }

  void reset() {
    _count = 0;
    notifyListeners();
  }
}