import 'dart:convert';

import 'package:bitserver/Screen/bitServer/home/code/providerSelected/selectCountry.dart';
import 'package:bitserver/Screen/bitServer/login/OTP/code/Class/SeverListGenerateManager.dart';
import 'package:bitserver/Screen/bitServer/login/OTP/code/Class/severListGenerate.dart';
import 'package:bitserver/Screen/bitServer/login/OTP/code/provider/CountryUserVpn.dart';
import 'package:bitserver/core/CachTool/catchTool.dart';
import 'package:bitserver/core/Config/Config.dart';
import 'package:bitserver/core/package/skeleton/src/skeleton_style.dart';
import 'package:bitserver/core/package/skeleton/src/skeleton_theme.dart';
import 'package:bitserver/core/package/skeleton/src/widget/list_skeleton.dart';
import 'package:bitserver/core/utils/size_config.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:provider/provider.dart';

class ServerData extends StatefulWidget {
  Function showProtocol;

  ServerData({this.showProtocol});

  @override
  _ServerDataState createState() => _ServerDataState();
}

class _ServerDataState extends State<ServerData> {
  var refreshKey = GlobalKey<RefreshIndicatorState>();
  Dio _dio;
  bool loading = false;
  String _value = "0";

  @override
  void initState() {
    _dio = Config.createDio();
    // TODO: implement initState
    getData();

    super.initState();
  }

  Future<Null> refreshTunel() async {
    await getData();
    refreshKey.currentState.show(atTop: true);
  }

  Future getData() async {
    setState(() {
      loading = true;
    });
    if (await CatchTool.getServerId() != null) {
      String id = await CatchTool.getServerId();
      setState(() {
        _value = id;
      });
    }
    if (await CatchTool.Get_TokenBitServer() != null) {
      String token = await CatchTool.Get_TokenBitServer();
      try {
        Response responseServerList =
        await _dio.post(Config.myServices, data: {"_token": token});
        if (responseServerList.statusCode == 200) {
          SeverListGenerateManager walletProviderManager =
          SeverListGenerateManager();
          SeverListGenerate maneger3 =
          SeverListGenerate.fromJson(responseServerList.data);
          walletProviderManager.init(maneger3);
          if (mounted) {
            Provider.of<CountryUserVpn>(context, listen: false)
                .initWallet(walletProviderManager);
          }
          setState(() {
            loading = false;
          });
          // betSplash();
        }
      } on DioError catch (e) {
        debugPrint(e.response.toString());
        setState(() {
          loading = false;
        });
      }
    }
  }

  final Shader active = LinearGradient(
    colors: <Color>[Color(0xff42E8E0), Color(0xff3AFF04)],
  ).createShader(Rect.fromLTWH(10.0, 50.0, 200.0, 70.0));

  final Shader dactive = LinearGradient(
    colors: <Color>[Color(0xffB52025), Color(0xffEF4F4E)],
  ).createShader(Rect.fromLTWH(10.0, 50.0, 200.0, 70.0));

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      key: refreshKey,
      onRefresh: refreshTunel,
      child: loading
          ? ListSkeleton(
        style: SkeletonStyle(
          theme: SkeletonTheme.Dark,
          isShowAvatar: true,
          colors: [
            Colors.grey.shade400,
            Colors.grey.shade200,
            Colors.grey.shade400
          ],
          backgroundColor: Colors.transparent,
          barCount: 0,
          isAnimation: true,
        ),
      )
          : ListView(
        children: [
          SizedBox(
            height: getProportionateScreenHeight(15),
          ),
          Provider
              .of<CountryUserVpn>(context)
              .userVpns
              .wallet
              .data
              .length >
              0
              ? ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: Provider
                .of<CountryUserVpn>(context)
                .userVpns
                .wallet
                .data
                .length >
                0
                ? Provider
                .of<CountryUserVpn>(context)
                .userVpns
                .wallet
                .data
                .length
                : 0,
            itemBuilder: (_, index) {
              return Provider
                  .of<CountryUserVpn>(context)
                  .userVpns
                  .wallet
                  .data
                  .length >
                  0
                  ? Container(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: getProportionateScreenWidth(20),
                    backgroundImage: NetworkImage(
                        Provider
                            .of<CountryUserVpn>(context)
                            .userVpns
                            .wallet
                            .data[index]
                            .serviceMeta
                            .countryConfig
                            .link),
                  ),
                  title: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    mainAxisAlignment:
                    MainAxisAlignment.center,
                    children: [
                      Text(
                        Provider
                            .of<CountryUserVpn>(context)
                            .userVpns
                            .wallet
                            .data[index]
                            .serviceMeta
                            .country + "  :  " + Provider
                            .of<CountryUserVpn>(context)
                            .userVpns
                            .wallet
                            .data[index]
                            .ip,
                        style: new TextStyle(
                            color: Colors.white,
                            fontFamily: 'pr',
                            fontSize:
                            getProportionateScreenWidth(
                                16)),
                      ),
                      SizedBox(
                        height:
                        getProportionateScreenHeight(10),
                      ),
                      Text(
                        Provider
                            .of<CountryUserVpn>(context)
                            .userVpns
                            .wallet
                            .data[index]
                            .expireDay + " Day  " + Provider
                            .of<CountryUserVpn>(context)
                            .userVpns
                            .wallet
                            .data[index]
                            .status,
                        style: Provider
                            .of<CountryUserVpn>(
                            context)
                            .userVpns
                            .wallet
                            .data[index]
                            .status
                            .toUpperCase()
                            .contains("ACTIVE")
                            ? new TextStyle(
                            foreground: Paint()
                              ..shader = active,
                            fontFamily: 'pr',
                            fontSize:
                            getProportionateScreenWidth(
                                12))
                            : new TextStyle(
                            foreground: Paint()
                              ..shader = dactive,
                            fontFamily: 'pr',
                            fontSize:
                            getProportionateScreenWidth(
                                12)),
                      ),
                    ],
                  ),
                  trailing: int.parse(_value) == index
                      ? new Container(
                    width:
                    getProportionateScreenWidth(25),
                    height:
                    getProportionateScreenHeight(
                        25),
                    child: Center(
                      child: new Container(
                        margin: EdgeInsets.all(
                            getProportionateScreenWidth(
                                4)),
                        width:
                        getProportionateScreenWidth(
                            17),
                        height:
                        getProportionateScreenHeight(
                            17),
                        decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xff42E8E0),
                            border: Border.all(
                                color: Colors.white,
                                width: 1)),
                      ),
                    ),
                    decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: new LinearGradient(
                          colors: [
                            Color(0x2642E8E0),
                            Color(0xff42E8E0)
                                .withOpacity(.15)
                          ]),
                      border: Border.all(
                          color: Color(0xff42E8E0),
                          width: 1),
                    ),
                  )
                      : new Container(
                    width:
                    getProportionateScreenWidth(25),
                    height:
                    getProportionateScreenHeight(
                        25),
                    decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: new LinearGradient(
                          colors: [
                            Color(0x2642E8E0),
                            Color(0xff42E8E0)
                                .withOpacity(.15)
                          ]),
                      border: Border.all(
                          color: Colors.white.withOpacity(0.3),
                          width: 1),
                    ),
                  ),
                  onTap: () {
                    Provider.of<SelectCountryUserVpn>(context,
                        listen: false)
                        .initWallet(
                        Provider
                            .of<CountryUserVpn>(
                            context,
                            listen: false)
                            .userVpns
                            .wallet
                            .data[index]);
                    print(">>>>>>>>>>>>>>>>>>>>>" + Provider
                        .of<CountryUserVpn>(context,
                        listen: false)
                        .userVpns
                        .wallet
                        .data[index].serviceMeta.country);
                    CatchTool.Set_Config(jsonEncode(
                        Provider
                            .of<CountryUserVpn>(context,
                            listen: false)
                            .userVpns
                            .wallet
                            .data[index]
                            .toJson()));
                    CatchTool.setIp(
                        Provider
                            .of<CountryUserVpn>(context,
                            listen: false)
                            .userVpns
                            .wallet
                            .data[index]
                            .ip);
                    setState(() {
                      _value = index.toString();
                    });
                    CatchTool.setServerId(index.toString());
                    CatchTool.setPort(Provider
                        .of<CountryUserVpn>(context,
                        listen: false)
                        .userVpns
                        .wallet
                        .data[index]
                        .port.toString());
                    widget.showProtocol(true);
                  },
                ),
              )
                  : new Text("sd");
            },
            separatorBuilder: (_, index) =>
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(19)),
                  child: Column(
                    children: [
                      SizedBox(
                        height: getProportionateScreenHeight(10),
                      ),
                      Divider(
                        color: Colors.white.withOpacity(0.5),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(10),
                      ),
                    ],
                  ),
                ),
          )
              : Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                "No service available",
                style: new TextStyle(
                    color: Colors.white,
                    fontFamily: 'pr',
                    fontSize: getProportionateScreenWidth(16)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
