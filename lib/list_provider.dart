import 'package:flutter/widgets.dart';

class ListProvider extends ChangeNotifier{
  List<Map<String,dynamic>> _mData=[];
  ///events...
  void addData(Map<String,dynamic> add){
    _mData.add(add);
    notifyListeners();
  }
  void updateData(Map<String,dynamic>update,int index){
    _mData[index]=update;
    notifyListeners();
  }
  void deleteData(int index){
    _mData.removeAt(index);
    notifyListeners();
  }
  List<Map<String,dynamic>> getData()=>_mData;

}