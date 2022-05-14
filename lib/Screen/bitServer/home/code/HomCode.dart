import 'dart:convert';

import 'package:bitserver/Screen/bitServer/home/code/class/clsMyIp.dart';
import 'package:bitserver/Screen/bitServer/home/code/providerSelected/SelectVpnState.dart';
import 'package:bitserver/Screen/bitServer/home/code/providerSelected/selectCountry.dart';
import 'package:bitserver/Screen/bitServer/home/view/HomeView.dart';
import 'package:bitserver/Screen/bitServer/login/OTP/code/Class/severListGenerate.dart';
import 'package:bitserver/Screen/bitServer/login/OTP/code/provider/CountryUserVpn.dart';
import 'package:bitserver/core/CachTool/catchTool.dart';
import 'package:bitserver/core/Config/Config.dart';
import 'package:bitserver/core/utils/size_config.dart';
import 'package:bitserver/core/vpn/flutter_openvpn.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class HOmeCode extends StatefulWidget {
  @override
  _HOmeCodeState createState() => _HOmeCodeState();
}
enum VpnState {
  NOPROCESS,
  VPN_GENERATE_CONFIG,
  WAIT,
  AUTH,
  GET_CONFIG,
  ASSIGN_IP,
  CONNECTED,
  RECONNECTING,
  DISCONNECTED
}
class _HOmeCodeState extends State<HOmeCode> {
  ClsMyIp ip;
  Dio _dio;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _dio=Config.createDio();
    FlutterOpenvpn.init(
      localizedDescription: "en",
      providerBundleIdentifier:
      "ir.darano.kabok.RunnerExtension",
    );
    a();
  }
  int dGet=0;

  void a()async
  {
    getData();
   var a =await FlutterOpenvpn.check();
   String getCatch=await CatchTool.Get_Config();
   if(a.contains("true"))
     {
       DataServerList data =DataServerList.fromJson(jsonDecode(getCatch));
       Provider.of<SelectCountryUserVpn>(context,listen: false)
           .initWallet(data);
       refreshVpnState(VpnState.CONNECTED,8);
     }else if(getCatch !=null && getCatch.length>10)
       {
         DataServerList data =DataServerList.fromJson(jsonDecode(getCatch));
         Provider.of<SelectCountryUserVpn>(context,listen: false)
             .initWallet(data);
         refreshVpnState(VpnState.DISCONNECTED,8);
       }
   print(a);
  }
  bool stConnect=true;
  void refreshVpnState(VpnState state,int index)async
  {

    if (state==VpnState.CONNECTED && stConnect )
    {
      getData();
      setState(() {
        stConnect=false;
     getData(); });
      print("GGGGGGGGGGGGGGGGGGGGGGGGGGGGGG");
    }else if(state!=VpnState.CONNECTED)
      {
        if (state==VpnState.DISCONNECTED)
        {
          print("DAta");
          getData();
        }
        else
          {
        setState(() {
          stConnect=true;

        });
      }}
    Provider.of<SelectVpnState>(context,listen: false).refreshVpnState(state, index);

  }
  Future getData() async {
    print("getDattttttta");
    try {
      Provider.of<SelectVpnState>(context,listen: false).myIP(null);
      Response responseServerList =
      await _dio.get(Config.myIp,);
      if (responseServerList.statusCode == 200) {
        var a=ClsMyIp.fromJson(responseServerList.data);

        Provider.of<SelectVpnState>(context,listen: false).myIP(a);
        Provider.of<SelectVpnState>(context,listen: false).setStateGetDatas(false);
        // betSplash();
      }
    } on DioError catch (e) {
      debugPrint(e.response.toString());

    }
  }

  Future<void> initPlatformState() async
  {
    if (await FlutterOpenvpn.check()=="true")
      {


        FlutterOpenvpn.stopVPN();
        refreshVpnState(VpnState.DISCONNECTED, 0);
        return;
      }else if (Provider.of<SelectCountryUserVpn>(context,listen: false).userVpns!=null)
        {
          String r;
          if (await CatchTool.getStateProtocol()==true)
            {
            r = await CatchTool.Get_ConfigProtocol();

            }else
              {
                r= await CatchTool.Get_Config();
              }

          DataServerList data =DataServerList.fromJson(jsonDecode(r));
          print(data.serviceMeta.country);

          await FlutterOpenvpn.lunchVpn(
            data.serviceMeta.config,
                (isProfileLoaded) {

            },
                (vpnActivated) {
              switch(vpnActivated){
                case "NOPROCESS":refreshVpnState(VpnState.NOPROCESS,7);break;
                case "VPN_GENERATE_CONFIG":refreshVpnState(VpnState.VPN_GENERATE_CONFIG,7);break;
                case "WAIT":refreshVpnState(VpnState.WAIT,6);break;
                case "AUTH":refreshVpnState(VpnState.AUTH,5);break;
                case "GET_CONFIG":refreshVpnState(VpnState.GET_CONFIG,4);break;
                case "ASSIGN_IP":refreshVpnState(VpnState.ASSIGN_IP,3);break;
                case "CONNECTED":refreshVpnState(VpnState.CONNECTED,2); CatchTool.SetStateVpn('CONNECTED');break;
                case "RECONNECTING":refreshVpnState(VpnState.RECONNECTING,1);break;
              }
            },
            user: 'user',
            pass: 'pass',
            expireAt: null,
            country: Provider.of<SelectCountryUserVpn>(context,listen: false).userVpns.serviceMeta.country,
            onConnectionStatusChanged:
                (duration, lastPacketRecieve, byteIn, byteOut) => debugPrint(lastPacketRecieve),

          );
        }
  }
  void onTap()async
  {
    await initPlatformState();

  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return HomeView(onTap:onTap,myIP: getData,);
  }
}
