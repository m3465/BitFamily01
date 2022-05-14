import 'package:bitserver/Screen/bitServer/login/OTP/code/Class/SeverListGenerateManager.dart';
import 'package:bitserver/Screen/bitServer/serverList/cls/TunelListGenerateManager.dart';
import 'package:flutter/material.dart';

class TunelsProvider extends ChangeNotifier {
  TunelListGenerateManager userVpns=new TunelListGenerateManager();

  void initWallet(TunelListGenerateManager tunels) {
    this.userVpns=tunels;
    notifyListeners();
  }
}