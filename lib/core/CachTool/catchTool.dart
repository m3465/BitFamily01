import 'dart:convert';
import 'dart:io';
import 'package:bitserver/Screen/bitServer/serverList/cls/ClsTunel.dart';
import 'package:encrypt/encrypt.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CatchTool
{
static  SharedPreferences prefs ;
 static String domain="MyVps.app";
 static String domainBit="Signal.app";
 static String  version="";
 static String  baseBis=domain;
 static String  baseBit=domainBit;


static Future setVersion(ve) async {
  prefs = await SharedPreferences.getInstance();
  return await prefs.setString(baseBit + '/ve',ve);
}
static Future<String> getRefreshSignal() async {
  prefs = null;
  SharedPreferences myPrefs = await SharedPreferences.getInstance();
  myPrefs.reload();
  return myPrefs.getString(baseBit + '/refresh');
}
static Future setPort(ve) async {
  prefs = await SharedPreferences.getInstance();
  return await prefs.setString(baseBit + '/port',ve);
}
static Future<String> getPort() async {
  prefs = null;
  SharedPreferences myPrefs = await SharedPreferences.getInstance();
  myPrefs.reload();
  return myPrefs.getString(baseBit + '/port');
}

static Future setStateProtocol(ve) async {
  prefs = await SharedPreferences.getInstance();
  return await prefs.setBool(baseBit + '/StateProtocol',ve);
}
static Future<bool> getStateProtocol() async {
  prefs = null;
  SharedPreferences myPrefs = await SharedPreferences.getInstance();
  myPrefs.reload();
  var a=myPrefs.getBool(baseBit + '/StateProtocol');
  return a!=null?a:false;
}

static Future setTunelId(ve) async {
  prefs = await SharedPreferences.getInstance();
  return await prefs.setString(baseBit + '/TunelId',ve);
}
static Future<String> getTunelId() async {
  prefs = null;
  SharedPreferences myPrefs = await SharedPreferences.getInstance();
  myPrefs.reload();
  return myPrefs.getString(baseBit + '/TunelId');
}



static Future setServerId(ve) async {
  prefs = await SharedPreferences.getInstance();
  return await prefs.setString(baseBit + '/ServerId',ve);
}
static Future<String> getServerId() async {
  prefs = null;
  SharedPreferences myPrefs = await SharedPreferences.getInstance();
  myPrefs.reload();
  return myPrefs.getString(baseBit + '/ServerId');
}



static Future removeRefresh() async {
  prefs = await SharedPreferences.getInstance();
  prefs.remove(baseBit + '/refresh');
}
static Future setPassWallet(String pass) async {
  prefs = await SharedPreferences.getInstance();
  prefs.setString(baseBit + '/passApp', pass);
}
static Future<String> getPassWallet() async {
  prefs = await SharedPreferences.getInstance();
  String a = prefs.getString(baseBit + '/passApp');
  return a;
}
static Future setKey(String key) async {
  prefs = await SharedPreferences.getInstance();
  prefs.setString(baseBit + '/keyF', key);
}
static Future<String> getKey(
    ) async {
  prefs = await SharedPreferences.getInstance();
  String a = prefs.getString(baseBit + '/keyF');
  return a;
}
static Future<String> getSmartKey() async {
  prefs = await SharedPreferences.getInstance();
  String a = prefs.getString(baseBit + '/SmartKey');
  return a;
}

static Future setSmartKey(String smartKey) async {
  prefs = await SharedPreferences.getInstance();
  prefs.setString(baseBit + '/SmartKey', smartKey);
}
static Future setChar(String char) async {
  prefs = await SharedPreferences.getInstance();
  prefs.setString(baseBit + '/char', char);
}


static Future setAddress(String char) async {
  prefs = await SharedPreferences.getInstance();
  prefs.setString(baseBit + '/Address', char);
}

static Future<String> getAddress() async {
  prefs = await SharedPreferences.getInstance();
  String a = prefs.getString(baseBit + '/Address');
  return a;
}
static Future setBalance(String price) async {
  prefs = await SharedPreferences.getInstance();
  prefs.setString(baseBit + '/Balance', price);
}

static Future<String> getBalance() async {
  prefs = await SharedPreferences.getInstance();
  String a = prefs.getString(baseBit + '/Balance');
  return a;
}
static Future setname(String name) async
{
  prefs = await SharedPreferences.getInstance();
  prefs.setString(baseBit+'/name', name);
}
static Future <String>getname() async
{
  prefs = await SharedPreferences.getInstance();
  String a =prefs.getString(baseBit+'/name');
  return a;
}
static Future <String>Get_Token() async
{
  prefs = await SharedPreferences.getInstance();

  String a =await prefs.getString(baseBit+'/Token');
  return a;
}
static Future Set_Token(String Mobile) async
{
  prefs = await SharedPreferences.getInstance();
  prefs.setString(baseBit+'/Token', Mobile);
}
////////////////////////////////////////////////
static Future <String>Get_Banner() async
{  prefs=null;

prefs = await SharedPreferences.getInstance();
String a =prefs.getString(baseBis+'/Banner');
return a;
}
static  Future Set_Intro(bool str) async
{  prefs=null;

prefs = await SharedPreferences.getInstance();
prefs.setBool(baseBis+'/intro', str);
}

static Future <bool>Get_Intro() async
{  prefs=null;

prefs = await SharedPreferences.getInstance();
bool a =prefs.getBool(baseBis+'/intro');
return a;
}

static  Future Set_Banner(String str) async
{  prefs=null;

prefs = await SharedPreferences.getInstance();
prefs.setString(baseBis+'/Banner', str);
}

 static  Future Set_setionid(String Session) async
  {
    prefs = await SharedPreferences.getInstance();
    prefs.setString(baseBis+'/session_id', Session);
  }
  static Future <String>Get_setionid() async
  {
    prefs = await SharedPreferences.getInstance();
   String a =prefs.getString(baseBis+'/session_id');
   return a;
  }
static  Future Set_Applink(String Applink) async
{
  prefs = await SharedPreferences.getInstance();
  prefs.setString(baseBis+'/Applink', Applink);
}
static Future <String>Get_Applink() async
{
  prefs = await SharedPreferences.getInstance();
  String a =prefs.getString(baseBis+'/Applink');
  return a;
}
//static  Future Set_Version(String Version) async
//{
//  prefs = await SharedPreferences.getInstance();
//  prefs.setString(base+'/Version', Version);
//}
//static Future <String>Get_Versiond() async
//{
//  prefs = await SharedPreferences.getInstance();
//  String a =prefs.getString(base+'/Version');
//  return a;
//}

  static Future Set_Mobile(String Mobile) async
  {
    prefs = await SharedPreferences.getInstance();
    prefs.setString(baseBis+'/Mobile', Mobile);
  }
  static Future <String>Get_Mobile() async
  {
    prefs = await SharedPreferences.getInstance();
    String a =prefs.getString(baseBis+'/Mobile');
    return a;
  }


  static Future setIp(String ip) async
  {
    prefs = await SharedPreferences.getInstance();
    prefs.setString(baseBis+'/ip', ip);
  }
  static Future <String>getIp() async
  {
    prefs = await SharedPreferences.getInstance();
    String a =prefs.getString(baseBis+'/ip');
    return a;
  }


  static Future Set_Config(String Config) async
{
  prefs = await SharedPreferences.getInstance();
  prefs.setString(baseBis+'/Config', Config);
}
static Future <String>Get_Config() async
{
  prefs = await SharedPreferences.getInstance();
  String a =prefs.getString(baseBis+'/Config');
  return a;
}

  static Future Set_ConfigProtocol(String Config) async
  {
    prefs = await SharedPreferences.getInstance();
    if (await prefs.getString(baseBis+'/ConfigProtocol')!=null)
    {
      await prefs.remove(baseBis+'/ConfigProtocol');
      prefs.setString(baseBis+'/ConfigProtocol', Config);

    }else
    prefs.setString(baseBis+'/ConfigProtocol', Config);
  }
  static Future <String>Get_ConfigProtocol() async
  {
    prefs = await SharedPreferences.getInstance();
    String a =prefs.getString(baseBis+'/ConfigProtocol');
    return a;
  }

  static Future Set_email(String email) async
{
  prefs = await SharedPreferences.getInstance();
  prefs.setString(baseBis+'/email', email);
}
static Future <String>Get_email() async
{
  prefs = await SharedPreferences.getInstance();
  String a =prefs.getString(baseBis+'/email');
  return a;
}

static Future SetStateVpn(String CenterLocation) async
{
  prefs = await SharedPreferences.getInstance();
  prefs.setString(baseBis+'/StateVpn', CenterLocation);
}
static Future <String>Get_StateVpn() async
{
  prefs = await SharedPreferences.getInstance();
  String a =prefs.getString(baseBis+'/StateVpn');
  return a;
}
  static Future Set_TokenBitServer(String Mobile) async
  {
    prefs = await SharedPreferences.getInstance();
    prefs.setString(baseBis+'/TokenBis', Mobile);
  }

  static Future <String>Get_TokenBitServer() async
  {
    prefs = await SharedPreferences.getInstance();

    String a =await prefs.getString(baseBis+'/TokenBis');
    return a;
  }

static Future Set_Name(String Name) async
{
  prefs = await SharedPreferences.getInstance();
  prefs.setString(baseBis+'/Name', Name);
}
static Future <String>Get_Name() async
{
  prefs = await SharedPreferences.getInstance();
  String a =prefs.getString(baseBis+'/Name');
  return a;
}
static Future Set_ID(int ID) async
{
  prefs = await SharedPreferences.getInstance();
  prefs.setInt(baseBis+'/ID', ID);
}
static Future <int>Get_ID() async
{
  prefs = await SharedPreferences.getInstance();
  int a =prefs.getInt(baseBis+'/ID');
  return a;
}



  static Future setTunel(var id) async
  {
    prefs = await SharedPreferences.getInstance();
    prefs.setString(baseBis+'/tunels', jsonEncode(id));
  }
  static Future <DataTunels>GetTunel() async
  {
    prefs = await SharedPreferences.getInstance();
    String a =prefs.getString(baseBis+'/tunels');
    if (a!=null) {
      DataTunels dataTunels = DataTunels.fromJson(jsonDecode(a));
      return dataTunels;
    }
    else
      return null;
  }


  static Future removeTokenAccount() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    for(String key in preferences.getKeys()) {
      print(key);
      if(key==baseBis + '/Banner'||key== baseBis+'/intro'||key.contains(baseBit) )
      {}else
        preferences.remove(key);
    }
  }
  static Future remove_Token() async
  {
    prefs = await SharedPreferences.getInstance();
      prefs.remove(baseBit+"\Token");
  }
  static Future remove_Btronet() async
  {
    prefs = await SharedPreferences.getInstance();
    for(String key in prefs.getKeys()) {
      if(key.contains(baseBis) )
      {}else
        prefs.remove(key);
    }
  }



}