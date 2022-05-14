
import 'package:bitserver/Screen/bitServer/login/OTP/code/Class/severListGenerate.dart';

class SeverListGenerateManager
{
  static SeverListGenerateManager _instance;
  SeverListGenerate wallet;
  factory SeverListGenerateManager() => _instance ??= new SeverListGenerateManager._();

  void init(loc) {
    this.wallet = loc;
  }

  SeverListGenerateManager._();
}