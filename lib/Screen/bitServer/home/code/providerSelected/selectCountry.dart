import 'package:flutter/material.dart';
import 'package:bitserver/Screen/bitServer/login/OTP/code/Class/severListGenerate.dart';

class SelectCountryUserVpn extends ChangeNotifier {
  DataServerList userVpns;

  void initWallet(DataServerList countryUserVpn) {
    clearUserVpn();
    this.userVpns=countryUserVpn;
    notifyListeners();
  }
  clearUserVpn()
  {
    userVpns=null;
    notifyListeners();
  }
}