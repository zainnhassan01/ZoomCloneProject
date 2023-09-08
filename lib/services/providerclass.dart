import 'package:flutter/material.dart';

class ProviderClass extends ChangeNotifier{
  //loading widget
  bool _loading = false;
  bool get loading => _loading;

  void setBoolTrue(){
    _loading = true;
    notifyListeners();
  }
  void setBoolFalse(){
    _loading = false;
    notifyListeners();
  }

  //bottom navigation bar settings
  int _page = 0;
  int get pages => _page;
  void pageValue(int value) {
    _page = value;
    notifyListeners();
  }
}