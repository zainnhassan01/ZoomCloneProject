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
  //for the switch in join meeting
  bool _isAudioMute = true;
  bool get isAudioMute => _isAudioMute;
  bool _isVideoMute = true;
  bool get isVideoMute => _isVideoMute;

  void onAudioChange (bool value){
    _isAudioMute = value;
    notifyListeners();
  }
  void onVideoChange (bool value){
    _isVideoMute = value;
    notifyListeners();
  }
  // conference settings
  bool _conference = false;
  bool get conference => _conference;
  void setConference(bool value){
    _conference = value;
    notifyListeners();
  }
}