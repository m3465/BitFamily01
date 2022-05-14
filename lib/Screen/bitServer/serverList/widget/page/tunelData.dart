import 'dart:convert';

import 'package:bitserver/Screen/bitServer/home/code/providerSelected/selectCountry.dart';
import 'package:bitserver/Screen/bitServer/login/OTP/code/Class/severListGenerate.dart';
import 'package:bitserver/Screen/bitServer/serverList/cls/ClsTunel.dart';
import 'package:bitserver/Screen/bitServer/serverList/cls/TunelListGenerateManager.dart';
import 'package:bitserver/Screen/bitServer/serverList/cls/Tunels.dart';
import 'package:bitserver/core/CachTool/catchTool.dart';
import 'package:bitserver/core/Config/Config.dart';
import 'package:bitserver/core/Strings/String.dart';
import 'package:bitserver/core/package/skeleton/flutter_skeleton.dart';
import 'package:bitserver/core/utils/size_config.dart';
import 'package:bitserver/core/vpn/flutter_openvpn.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TunelData extends StatefulWidget {
  ScrollController scrollController;
  Function callback;

  TunelData({this.scrollController, this.callback});

  @override
  _TunelDataState createState() => _TunelDataState();
}

class _TunelDataState extends State<TunelData> {
  var refreshKey = GlobalKey<RefreshIndicatorState>();
  Dio _dio;
  bool loading = false;
  String _value = "0";

  @override
  void initState() {
    _dio = Config.createDio();
    // TODO: implement initState
    getDataTunel();
    super.initState();
  }

  Future<Null> refreshTunel() async {
    await getDataTunel();
    refreshKey.currentState.show(atTop: true);
  }

  Future getDataTunel() async {
    setState(() {
      loading = true;
    });
    if (await CatchTool.getTunelId() != null) {
      String id = await CatchTool.getTunelId();
      setState(() {
        _value = id;
      });
    }
    if (await CatchTool.Get_TokenBitServer() != null) {
      String token = await CatchTool.Get_TokenBitServer();
      try {
        Response responseServerList = await _dio.get(
          Config.tunel,
        );
        if (responseServerList.statusCode == 200) {
          TunelListGenerateManager walletProviderManager =
              TunelListGenerateManager();
          ClsTunel maneger3 = ClsTunel.fromJson(responseServerList.data);
          walletProviderManager.init(maneger3);
          if (mounted) {
            Provider.of<TunelsProvider>(context, listen: false)
                .initWallet(walletProviderManager);
          }
          setState(() {
            loading = false;
          });
        }
      } on DioError catch (e) {
        debugPrint(e.response.toString());
        setState(() {
          loading = false;
        });
      }
    }
  }




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
              controller: widget.scrollController,
              children: [
                Container(
                  height: 80,
                  decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          getProportionateScreenWidth(30)),
                      gradient: new LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [
                            0.52,
                            1.2
                          ],
                          colors: [
                            Color(0xff010028),
                            Color(0xff010028),
                          ])),
                  child: Center(
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Center(
                            child: Text(
                              "Select Server",
                              style: new TextStyle(
                                  color: Colors.white,
                                  fontFamily: StringData.fontEn,
                                  fontSize: getProportionateScreenWidth(18)),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          bottom: 0,
                          right: getProportionateScreenWidth(30),
                          child: IconButton(
                            icon: Icon(
                              Icons.clear,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              widget.callback(false);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(15),
                ),
                Provider.of<TunelsProvider>(context)
                            .userVpns
                            .wallet
                            .data
                            .length >
                        0
                    ? ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: Provider.of<TunelsProvider>(context)
                                    .userVpns
                                    .wallet
                                    .data
                                    .length >
                                0
                            ? Provider.of<TunelsProvider>(context)
                                .userVpns
                                .wallet
                                .data
                                .length
                            : 0,
                        itemBuilder: (_, index) {
                          return Provider.of<TunelsProvider>(context)
                                      .userVpns
                                      .wallet
                                      .data
                                      .length >
                                  0
                              ? Container(
                                  child: ListTile(
                                    leading: new Container(
                                      padding: EdgeInsets.all(
                                          getProportionateScreenWidth(5)),
                                      width: getProportionateScreenWidth(56),
                                      height: getProportionateScreenHeight(56),
                                      child: new Image.network(
                                          "https://img.icons8.com/dotty/2x/vpn.png",
                                          width:
                                              getProportionateScreenWidth(46),
                                          height:
                                              getProportionateScreenHeight(46),
                                          color: Color(0xff42E8E0)),
                                      decoration: new BoxDecoration(
                                        shape: BoxShape.circle,
                                        gradient: new LinearGradient(colors: [
                                          Color(0x2642E8E0),
                                          Color(0xff42E8E0).withOpacity(.15)
                                        ]),
                                        border: Border.all(
                                            color: Color(0xff42E8E0), width: 1),
                                      ),
                                    ),
                                    title: Text(
                                      Provider.of<TunelsProvider>(context,
                                              listen: false)
                                          .userVpns
                                          .wallet
                                          .data[index]
                                          .code,
                                      style: new TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'pr',
                                          fontSize:
                                              getProportionateScreenWidth(16)),
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
                                    onTap: () async {
                                      print("press");
                                      CatchTool.setTunelId(index.toString());
                                      CatchTool.setTunel(Provider.of<TunelsProvider>(context,
                                          listen: false)
                                          .userVpns
                                          .wallet
                                          .data[index].toJson());
                                      setState(() {
                                        _value = index.toString();
                                      });
widget.callback(false);
                                      // Provider.of<SelectCountryUserVpn>(context,listen: false)
                                      //     .initWallet(Provider.of<CountryUserVpn>(context,listen: false)
                                      //     .userVpns
                                      //     .wallet.data[index]);
                                      // CatchTool.Set_Config(jsonEncode(
                                      //     Provider.of<CountryUserVpn>(context,listen: false)
                                      //         .userVpns
                                      //         .wallet
                                      //         .data[index]
                                      //         .toJson()));
                                      // Navigator.of(context).pop();
                                    },
                                  ),
                                )
                              : new Text("sd");
                        },
                        separatorBuilder: (_, index) => Padding(
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
