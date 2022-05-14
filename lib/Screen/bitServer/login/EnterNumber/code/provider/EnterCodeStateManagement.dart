import 'package:bitserver/Screen/bitServer/login/EnterNumber/code/Class/ClsLoginResPonse.dart';
import 'package:flutter/material.dart';

class EnterCodeStateManagement extends ChangeNotifier{
  String number="";
  bool isLoading=false;

  void loadingChange(s)
  {
    isLoading=s;
    notifyListeners();
  }
  void setNumber(s)
  {
    number=s;
    notifyListeners();
  }
  Future onTapLogin(BuildContext context,GlobalKey<ScaffoldState> key,{bool repeat=false})
  {
    ClsLoginResponse.getHttp(number, context,key,repeat);
  }

}