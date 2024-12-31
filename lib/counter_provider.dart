import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier{
  int _count=0;

  void inCrement(){
    _count++;
     notifyListeners();
  }
 void deCrement(){
   if(_count>0){
    _count--;}
    notifyListeners();
  }
 int getValue(){
   return _count;
    notifyListeners();
  }

}