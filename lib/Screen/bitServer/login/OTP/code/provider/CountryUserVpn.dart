import 'package:bitserver/Screen/bitServer/login/OTP/code/Class/SeverListGenerateManager.dart';
import 'package:flutter/material.dart';

class CountryUserVpn extends ChangeNotifier {
  SeverListGenerateManager userVpns=new SeverListGenerateManager();

  void initWallet(SeverListGenerateManager countryUserVpn) {
    this.userVpns=countryUserVpn;
    notifyListeners();
  }
}