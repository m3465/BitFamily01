import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:encrypt/encrypt.dart' as en;

class Config
{
  static String base="";
  static String header="";
  static const String baseCenter="https://panel.bitserver.in";
  static const String baseCenters="https://panel.bitserver.in";
  static const String baseMap="https://map.ir";
  static const String api="/api/v1";
  static const String login=api+"/auth/login";
  static const String myServices=api+"/myServices";
  static const String myIp=api+"/myIP";
  static const String tunel=api+"/tunnelList";
  static const String verify=api+"/auth/verify";
  static const String register=api+"/auth/register";
  static const String logout=api+"/auth/logout";
  static const String init=api+"/init";
  static const String centerInit=api+"/center/init";

  static const String StoreProDucts=api+"/store/products/";
  static const String orderInit=api+"/order/init";
  static const String orderCompelete=api+"/order/complete";
  static const String ADDIncreamens=api+"/invoice/increaseBalance";
  static const String Balance=api+"/balance/get";
  static const String getPriceTransport=api+"/transport/getPrice";
  static const String delivery=api+"/delivery/orders/new";
  static const String deliveryPage=api+"/delivery/orders/deliveredList";
  static const String deliveryWaitePage=api+"/delivery/orders/allUndelivered";
  static const String deliveryOk=api+"/delivery/order/delivered/";
  static const String OrderList=api+"/order/list";
  static  String Peyment=createDio().options.baseUrl+"/invoice/pay/";
  static const String GEtAddress=baseMap+"/reverse/no";
  static const String GEtPoilyLine=baseMap+"/routes/route/v1/driving/";
  static Dio createDio() {
    return Dio(
        BaseOptions(
            connectTimeout: 7000,
            receiveTimeout: 7000,
            baseUrl: baseCenter
          ,
          headers: {
            "User-Agent":header
          },
        )
    );
  }
  static Dio createDioMap() {
    return Dio(
        BaseOptions(
            connectTimeout: 10000,
            receiveTimeout: 50000,
            receiveDataWhenStatusError: true,
            baseUrl: baseMap
        )
    );
  }

 Future<bool> checkConnectionInternet() async {
   var connectivityResult = await (new Connectivity().checkConnectivity());
   return connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi;
 }

}
Future encrypt(js)async
{
  var keys= js['key'].toString();
  var timeStamp=DateTime.now().millisecondsSinceEpoch;
  final key = en.Key.fromUtf8(js['key']);
  final iv = en.IV.fromBase64('aB4gHxkwBQkKCxoRGBkaFA==');

  final encrypter = en.Encrypter(en.AES(key, mode: en.AESMode.cbc),);
  final encrypted = encrypter.encrypt(timeStamp.toString(), iv: iv);
  return  encrypted.base64;
}
Future<String> enKey(var string)async {
  int key=5;
  String result = '';
  int k= string.length;
  for(int i=0; i<k; i++) {
    var char =string[i];
    int ke=(i % key.toString().length)-1;
    int sub=key.toString().length+ke;
    var keychar = key.toString().substring(sub, 1);

    char = String.fromCharCode(char.codeUnitAt(0)+keychar.codeUnitAt(0));
    result += char;
  }
  return base64.encode(result.runes.toList().reversed.toList()).toString();
}