import 'package:flutter/material.dart';
import 'package:bitserver/Screen/bitServer/login/OTP/code/Class/severListGenerate.dart';

class HomeState extends ChangeNotifier {
  DataServerList userVpns;

  void initWallet(DataServerList countryUserVpn) {
    this.userVpns=countryUserVpn;
    notifyListeners();
  }
}