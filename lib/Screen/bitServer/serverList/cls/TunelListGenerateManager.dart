
import 'package:bitserver/Screen/bitServer/login/OTP/code/Class/severListGenerate.dart';
import 'package:bitserver/Screen/bitServer/serverList/cls/ClsTunel.dart';

class TunelListGenerateManager
{
  static TunelListGenerateManager _instance;
  ClsTunel wallet;
  factory TunelListGenerateManager() => _instance ??= new TunelListGenerateManager._();

  void init(tunel) {
    this.wallet = tunel;
  }

  TunelListGenerateManager._();
}