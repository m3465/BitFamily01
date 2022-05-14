import 'package:bitserver/Screen/bitServer/home/code/class/clsMyIp.dart';
import 'package:flutter/material.dart';
import 'package:bitserver/Screen/bitServer/login/OTP/code/Class/severListGenerate.dart';

import '../HomCode.dart';

class SelectVpnState extends ChangeNotifier {
  VpnState vpnState = VpnState.DISCONNECTED;
  bool stateGetData=false;
  int index;
  int numRepeat=0;
  ClsMyIp ip;
  void refreshVpnState(VpnState state,int index)
  {

      this.index=index;
      vpnState=state;
      notifyListeners();
  }
  void setStateGetDatas(bool data)
  {
    stateGetData=data;
    numRepeat=0;
    notifyListeners();
  }
  void myIP(ClsMyIp ipData)
  {
    this.ip=ipData;
    notifyListeners();
  }
}