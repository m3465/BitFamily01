import 'dart:convert';

import 'package:flutter/services.dart';
// import 'package:flutter_bcrypt/flutter_bcrypt.dart';

import 'CachTool/catchTool.dart';

class PlatFormTools
{
  static const platform = const MethodChannel(
      'com.darano.bitronet');
  Future<String>hashPass(String pass)async
  {
    // var salt10 = await FlutterBcrypt.saltWithRounds(rounds: 10);
    // var pwhs = await FlutterBcrypt.hashPw(password: pass, salt: salt10);
    // return  pwhs;
  }

  Future setToken(MethodChannel platform) async
  {

    var a=await CatchTool.Get_Token();
    var c=jsonEncode("'ioServer.setIOToken");
    var b= "{IOToken :$a}";
    Map mp=<String,String>{
      "fun":c,
      "data":b
    };
    platform.invokeMethod('send',mp);
  }

}