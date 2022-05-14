import 'dart:convert';
import 'dart:io';

import 'package:bitserver/Screen/Intro/intro_view.dart';
import 'package:bitserver/Screen/bitServer/home/code/HomCode.dart';
import 'package:bitserver/Screen/bitServer/login/EnterNumber/code/EnterNumberPage.dart';
import 'package:bitserver/Screen/bitServer/login/OTP/code/Class/SeverListGenerateManager.dart';
import 'package:bitserver/Screen/bitServer/login/OTP/code/Class/severListGenerate.dart';
import 'package:bitserver/Screen/bitServer/login/OTP/code/provider/CountryUserVpn.dart';
import 'package:bitserver/core/CachTool/catchTool.dart';
import 'package:bitserver/core/Config/Config.dart';
import 'package:bitserver/core/Strings/ColorApp.dart';
import 'package:bitserver/core/Strings/String.dart';
import 'package:bitserver/core/Widget/BackgroundPage.dart';
import 'package:bitserver/core/utils/constants.dart';
import 'package:bitserver/core/utils/size_config.dart';
import 'package:device_info/device_info.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:package_info/package_info.dart';
import 'package:provider/provider.dart';
import '../enable/EnablePage.dart';

import 'Class/SplashLoading.dart';
import 'dart:io' show Platform;

class SplashLoadingPage extends StatefulWidget {
  @override
  _SplashLoadingPageState createState() => _SplashLoadingPageState();
}

class _SplashLoadingPageState extends State<SplashLoadingPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  Config _config;
  Dio _dio;
  bool isLoading;
  var auth;

  @override
  void initState() {
    notLandScape(); // TODO: implement initState
    super.initState();
    isLoading = true;
    userAgent();
    _config = new Config();
    _dio = Config.createDio();
    checkLogin();
  }

  // static const platform = const MethodChannel(
  //     'com.darano.bitronet');
  String version = "";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return new BackgroundPage(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        key: _scaffoldKey,
        body: new Stack(
          children: <Widget>[
            Positioned(
              right: 1,
              top: MediaQuery.of(context).size.height / 5,
              left: -(MediaQuery.of(context).size.width / 4.15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SvgPicture.asset(
                    "assets/images/logo_string.svg",
                    width: getProportionateScreenWidth(400),
                    height: getProportionateScreenHeight(300),
                    fit: BoxFit.fill,
                  ),
                ],
              ),
            ),
            Positioned(
              right: 1,
              top: MediaQuery.of(context).size.height / 2.15,
              left:1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new Text("Create By Bitserver.in",style: new TextStyle(color: Colors.white.withOpacity(0.5),fontSize: getProportionateScreenHeight(18),fontFamily: "en"),textAlign: TextAlign.center,)

                ],
              ),
            ),
            // Align(
            //   alignment: Alignment.bottomCenter,
            //   child: Container(
            //     width: 60,height: getProportionateScreenHeight(120),
            //     child: Stack(
            //       fit: StackFit.expand,
            //       children: [
            //         Align(
            //           alignment: Alignment.topCenter,
            //           child: new Container(width: double.infinity,height: 70,decoration: new BoxDecoration(
            //             color: Colors.red,
            //             borderRadius: BorderRadius.circular(10)
            //           ),),
            //         ),Positioned(top: -getProportionateScreenHeight(20),right: 5,left: 5,bottom: 0,
            //           child: LoadingIndicator(
            //             color: Colors.white,
            //             indicatorType: Indicator.ballGridPulse,
            //           ),
            //
            //         ),
            //       ],
            //     ),
            //   ),
            // )
            Positioned(
                bottom: 30,
                right: 10,
                left: 10,
                child: Column(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      child: new LoadingIndicator(
                        indicatorType: Indicator.ballRotateChase,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ))
            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 60),
            //   child: Align(alignment: Alignment.bottomCenter
            //       ,child:
            //       isLoading?ColorLoader2(color1: mColor.bg_primary,
            //
            //     color2: mColor.LightGreen,color3: Colors.brown,):InkWell(
            //         onTap:  () {
            //           _scaffoldKey.currentState.hideCurrentSnackBar();
            //           checkLogin();
            //         },
            //       child: new Row(
            //           crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,children: [
            //
            //         new Text("بازسازی",style: new TextStyle(
            //           fontSize: 14,
            //           fontFamily: 'pr',
            //         ),)
            //         ,
            //         SizedBox(
            //           width: 12,
            //         ),
            //         new Icon(Icons.refresh),
            //
            //           ]
            //         ,
            //         ),
            //     )),
            // )
          ],
        ),
      ),
    );
  }

  // Future betSplash() async
  // {
  //     PackageInfo packageInfo = await PackageInfo.fromPlatform();
  //
  //     String version = "1.5.0";
  //
  //     if (Platform.isAndroid) {
  //       setState(() {
  //         this.version="ANDROID"+"\n"+version;
  //
  //       });
  //     } else if (Platform.isIOS) {
  //       this.version="IOS"+"\n"+version;
  //     }
  //     CatchTool.setVersion(version);
  //     platform.setMethodCallHandler(this.receiveData);
  //
  //     platform.invokeListMethod("init", "start");
  //   }
  // Future<void> receiveData(MethodCall call) async {
  //   final String data = call.arguments;
  //   debugPrint("SplashScreen>>>>>>>>>>>>>>>>>>>>>>>" + data);
  //   debugPrint("SplashScreen>>>>>>>>>>>>>>>>>>>>>>>" + call.method.toString());
  //   switch (call.method) {
  //     case "rc":
  //       if (data.contains('ready')) {
  //
  //
  //         Wallet wl=new Wallet(false);
  //         Account as=new Account();
  //         WalletManeger maneger3=new WalletManeger();
  //         maneger3.init(wl);
  //         Provider.of<WalletProviderManeger>(context,listen: false).initWallet(maneger3);
  //
  //         AccountManeger ac=AccountManeger();
  //         ac.init(as);
  //         Provider.of<WalletProviderManeger>(context,listen: false).initAccount(ac);
  //         if (await CatchTool.getKey() != null) {
  //           // await  Future.delayed(Duration(seconds: 1));
  //           Provider.of<CheckOpenProvider>(context,listen: false).loadingChange(true,false);
  //
  //
  //           replaceNewPage(context, MainCenterCode());
  //         }else{
  //           if (await CatchTool.Get_Intro() == null ||
  //               await CatchTool.Get_Intro() == false)
  //           {
  //             replaceNewPage(context, Intro());
  //           }else
  //           replaceNewPage(context, MainCenterCode());
  //         }
  //       }
  //       break;
  //     case "er":
  //       if (data.contains('UpdateApp')) {
  //         Provider.of<CheckOpenProvider>(context,listen: false).loadingChange(true,true);
  //       }
  //       break;
  //   }
  // }
  void splash() async {
    try {
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      String versionName = packageInfo.version;
      Response rsp = await _dio.post(Config.init, data: {"version":versionName});
      if (rsp.statusCode == 200) {
        var a;
        ClsSplash splash = ClsSplash.fromJson(rsp.data);
        if (splash.data.version.runtimeType==List)
          {
            a=splash.data.version;
          }else
            {
              a=splash.data.version;
            }
        if (a.contains(versionName)) {
          CatchTool.Set_Banner(jsonEncode(rsp.data));

          if (await CatchTool.Get_Intro() != null &&
              await CatchTool.Get_Intro() == true) {
            if (await CatchTool.Get_TokenBitServer() != null) {
              String token = await CatchTool.Get_TokenBitServer();
              if (await CatchTool.Get_Intro() == null ||
                  await CatchTool.Get_Intro() == false) {
                replaceNewPage(context, Intro());
              } else
                replaceNewPage(context, HOmeCode());
            } else {
              // betSplash();
              if (await CatchTool.Get_Intro() == null ||
                  await CatchTool.Get_Intro() == false) {
                replaceNewPage(context, Intro());
              } else
                replaceNewPage(context, EnterNumberPage());
            }
          } else {
            // betSplash();
            if (await CatchTool.Get_Intro() == null ||
                await CatchTool.Get_Intro() == false) {
              replaceNewPage(context, Intro());
            } else
              replaceNewPage(context, EnterNumberPage());
          }
        } else {
          replaceNewPage(context, EnablePage());
        }
      }
    } on DioError catch (e) {
      print(e.response.toString());
      print(e.message.toString());

      _scaffoldKey.currentState.showSnackBar(new SnackBar(
          duration: new Duration(hours: 2),
          content: new GestureDetector(
            onTap: () {
              _scaffoldKey.currentState.hideCurrentSnackBar();
              checkLogin();
            },
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Text("There is a problem with your connection to the server.\n Please send a message to the system administrator ",
                    style: TextStyle(fontFamily: StringData.fontEn)),
                new Icon(Icons.signal_cellular_connected_no_internet_4_bar, color: Colors.white)
              ],
            ),
          )));
    }
  }

  checkLogin() async {
    if (await _config.checkConnectionInternet()) {
      // check api Toke
      await splash();
    } else {
      setState(() {
        isLoading = false;
      });
      _scaffoldKey.currentState.showSnackBar(new SnackBar(
          duration: new Duration(hours: 2),
          content: new GestureDetector(
            onTap: () {
              _scaffoldKey.currentState.hideCurrentSnackBar();
              checkLogin();
            },
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Text("Not Connected To Server Please Check Internet",
                    style: TextStyle(fontFamily: StringData.fontEn)),
                new Icon(Icons.wifi_lock, color: Colors.white)
              ],
            ),
          )));
    }
  }

  void ff() {
    setState(() {});
  }

  void userAgent() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      Config.header = androidInfo.id.hashCode.toString() + "HMS";
    } else if (Platform.isIOS) {
      IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
      Config.header = iosDeviceInfo.model.hashCode.toString() + "HMS";
    }
  }
}
