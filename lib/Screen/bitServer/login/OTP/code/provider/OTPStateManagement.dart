import 'package:bitserver/Screen/bitServer/login/OTP/code/Class/ClsOTPResponse.dart';
import 'package:flutter/material.dart';

class OTPStateManagement extends ChangeNotifier{
  String code="";
  bool isLoading=false;
  int timer=59;

  void loadingChange(s)
  {
    isLoading=s;
    notifyListeners();
  }
  void setCode(s)
  {
    code=s;
    notifyListeners();
  }
  void setTimer(s)
  {
    timer=s;
    notifyListeners();
  }
  Future onTapLogin(BuildContext context,GlobalKey<ScaffoldState> key)
  {
    ClsOTPResponse.otpRequest(code, context,key);
  }


}