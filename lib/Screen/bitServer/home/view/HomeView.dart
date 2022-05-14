import 'dart:convert';
import 'dart:ui';

import 'package:bitserver/Screen/SplashScreen/SplashLoading.dart';
import 'package:bitserver/Screen/bitServer/home/code/HomCode.dart';
import 'package:bitserver/Screen/bitServer/home/code/class/clsMyIp.dart';
import 'package:bitserver/Screen/bitServer/home/code/providerSelected/SelectVpnState.dart';
import 'package:bitserver/Screen/bitServer/home/code/providerSelected/selectCountry.dart';
import 'package:bitserver/Screen/bitServer/login/OTP/code/Class/severListGenerate.dart';
import 'package:bitserver/Screen/bitServer/serverList/cls/ClsTunel.dart';
import 'package:bitserver/Screen/bitServer/serverList/server_list_page.dart';
import 'package:bitserver/Screen/bitServer/serverList/widget/page/DraggableSearchableListView.dart';
import 'package:bitserver/core/CachTool/catchTool.dart';
import 'package:bitserver/core/Config/Config.dart';
import 'package:bitserver/core/Strings/ColorApp.dart';
import 'package:bitserver/core/Strings/String.dart';
import 'package:bitserver/core/Widget/message.dart';
import 'package:bitserver/core/utils/constants.dart';
import 'package:bitserver/core/utils/size_config.dart';
import 'package:bitserver/core/vpn/flutter_openvpn.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:provider/provider.dart';
import 'Widget/circularButtonWidget.dart';
import 'Widget/connectedStatusText.dart';
import 'Widget/locationCard.dart';
import 'Widget/upperCurvedContainer.dart';

class HomeView extends StatefulWidget {
  Function onTap;
  Function myIP;

  HomeView({this.onTap, this.myIP});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool state = false;
  Dio _dio;
  DataTunels tunels;

  String title;

  @override
  void initState() {
    title = "Home";
    super.initState();
    _dio = Config.createDio();
    getData();
  }

  bool showProtocol = false;
  bool showProtocolPage = false;

  void getData() async {
    var state = await CatchTool.getStateProtocol();
    if(state)
      {
    var a = await CatchTool.GetTunel();
    if (a != null) {
      setState(() {
        tunels = a;
        showProtocol = true;
      });
    }

  }    else{
      setState(() {
        showProtocol = false;
      });
    }
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool getDataCheck = false;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: new Scaffold(
        key: _scaffoldKey,
        drawer: Theme(
          data: Theme.of(context).copyWith(
            // Set the transparency here
            canvasColor: Colors
                .transparent, //or any other color you want. e.g Colors.blue.withOpacity(0.5)
          ),
          child: Drawer(
            elevation: 0,
            child: Container(
              color: Color(0xff010028),
              child: new Container(
                width: 249,
                height: double.infinity,
                child: new Stack(
                  children: [
                    Positioned(
                      top: getProportionateScreenWidth(20),
                      right: getProportionateScreenWidth(30),
                      left: getProportionateScreenWidth(1),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/images/logo_string.svg",
                            width: getProportionateScreenWidth(150),
                            height: getProportionateScreenHeight(150),
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: getProportionateScreenHeight(150),
                      right: 1,
                      left: 1,
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          new Container(
                            width: double.infinity,
                            height: getProportionateScreenHeight(80),
                            child: Material(
                              child: InkWell(
                                onTap: () {
                                  startNewPage(context, ServerListPage());
                                },
                                child: new Row(
                                  children: [
                                    new Expanded(
                                      child: new Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          new SvgPicture.asset(
                                            "assets/images/server-line.svg",
                                            color: Colors.white,
                                          )
                                        ],
                                      ),
                                      flex: 1,
                                    ),
                                    new Expanded(
                                      child: new Row(
                                        children: [
                                          Text(
                                            "MyServices",
                                            style: new TextStyle(
                                                color: Colors.white,
                                                fontFamily: StringData.fontPr,
                                                fontSize:
                                                    getProportionateScreenWidth(
                                                        16)),
                                          )
                                        ],
                                      ),
                                      flex: 3,
                                    ),
                                    new Expanded(
                                      child: new Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          new SvgPicture.asset(
                                            "assets/images/next.svg",
                                            color: Colors.white,
                                          )
                                        ],
                                      ),
                                      flex: 1,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: getProportionateScreenHeight(120),
                      right: 1,
                      left: 1,
                      child: Column(
                        children: [
                          GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () async {
                              Provider.of<SelectCountryUserVpn>(context,
                                      listen: false)
                                  .initWallet(null);
                              Provider.of<SelectVpnState>(context,
                                      listen: false)
                                  .vpnState = VpnState.DISCONNECTED;

                              CatchTool.removeTokenAccount();
                              if (await FlutterOpenvpn.check() == "true") {
                                FlutterOpenvpn.stopVPN();
                              }
                              Navigator.pop(context);
                              replaceNewPage(context, SplashLoadingPage());
                            },
                            child: Container(
                              width: getProportionateScreenWidth(100),
                              height: getProportionateScreenHeight(60),
                              decoration: new BoxDecoration(
                                  gradient: new LinearGradient(colors: [
                                    Color(0xffB52025),
                                    Color(0xffEF4F4E),
                                  ]),
                                  borderRadius: BorderRadius.circular(
                                      getProportionateScreenWidth(30))),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "Log Out",
                                    style: new TextStyle(
                                        color: Colors.white,
                                        fontFamily: StringData.fontPr,
                                        fontSize:
                                            getProportionateScreenWidth(16)),
                                  ),
                                  SvgPicture.asset(
                                    "assets/images/shut-down-line.svg",
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                decoration: new BoxDecoration(
                    gradient: new LinearGradient(
                        colors: [Color(0xff007089), Color(0x38007089)],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter)),
              ),
            ),
          ),
        ),
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(0.0), // here the desired height
            child: AppBar(
              brightness: Brightness.dark,
              foregroundColor: Color(0xff010028),
              backgroundColor: Color(0xff010028),
            )),
        backgroundColor: Color(0xff010028),
        body: Stack(
          children: [
            new Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        right: 0,
                        left: 0,
                        child: SvgPicture.asset(
                          "assets/images/backConnection.svg",
                          fit: BoxFit.fill,
                        ),
                        bottom: 0,
                      ),
                      Positioned(
                        top: getProportionateScreenHeight(0),
                        right: 1,
                        left: 1,
                        child: PicServerChange(),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: new Row(
                          children: [
                            Expanded(
                              child: Container(
                                width: double.infinity,
                                height: 50,
                              ),
                              flex: 1,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  BtnCountry(),
                                  SizedBox(
                                    height: getProportionateScreenHeight(20),
                                  ),
                                  new Row(
                                    children: [
                                      new Container(
                                        padding: EdgeInsets.all(
                                            getProportionateScreenWidth(5)),
                                        child: Container(
                                          decoration: new BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              gradient: new LinearGradient(
                                                  colors: [
                                                    Colors.white
                                                        .withOpacity(.5),
                                                    Colors.white.withOpacity(0)
                                                  ],
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter)),
                                          child: Container(
                                            decoration: new BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              color: Color(0xff010028),
                                            ),
                                            child: SizedBox(
                                                width: 24,
                                                height: 24,
                                                child: Theme(
                                                    data: Theme.of(context)
                                                        .copyWith(
                                                      unselectedWidgetColor:
                                                          Colors.transparent,
                                                    ),
                                                    child: Checkbox(
                                                      value: showProtocol,
                                                      onChanged: (b) {
                                                        setState(() {
                                                          print(b);
                                                          showProtocol = b;
                                                          CatchTool.setStateProtocol(b);
                                                        });
                                                      },
                                                      activeColor:
                                                          Colors.transparent,
                                                    ))),
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap:showProtocol
                                            ? (){
                                            ShowProtocol(true);

                                        }:(){},
                                        behavior:HitTestBehavior.opaque,

                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              tunels != null
                                                  ? "Protocol :  " + tunels.code
                                                  : "Use Protocol",
                                              style: new TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: StringData.fontPr,
                                                  fontSize:
                                                      getProportionateScreenWidth(
                                                          16)),
                                            ),
SizedBox(width: getProportionateScreenWidth(60),),
                                            showProtocol
                                                ? Text(
                                                  "Change",
                                                  style: new TextStyle(
                                                      color: Colors.white,
                                                      fontFamily:
                                                          StringData.fontPr,
                                                      fontSize:
                                                          getProportionateScreenWidth(
                                                              16)),
                                                )
                                                : new Container(),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: getProportionateScreenHeight(20),
                                  ),
                                  BtnConnect(
                                    ontap: () async {
                                      if (await CatchTool.Get_Config()!=null) {
                                       if (showProtocol)
                                         {
                                          if (tunels!=null)
                                            {
                                              changeConfig();
                                            }else
                                              {

                                                createSnackBarError(
                                                    key: _scaffoldKey,
                                                    showPage: false,
                                                    message:"Please Selected Protocol"
                                                );
                                              }
                                         }else
                                           {
                                             changeConfig(b: true);
                                           }

                                      }else
                                        {

                                          createSnackBarError(
                                              key: _scaffoldKey,
                                              showPage: false,
                                              message:"Please Selected Server Connection"
                                          );
                                        }
                                      // await getData();
                                    },
                                  )
                                ],
                              ),
                              flex: 6,
                            ),
                            Expanded(
                              child: Container(
                                width: double.infinity,
                                height: 50,
                              ),
                              flex: 1,
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Column(
                          children: [
                            ListTile(
                              leading: new Container(
                                width: getProportionateScreenWidth(150),
                                height: getProportionateScreenHeight(200),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      "assets/images/logo_menu.svg",
                                      height: getProportionateScreenHeight(55),
                                      width: getProportionateScreenWidth(100),
                                    ),
                                  ],
                                ),
                              ),
                              trailing: Container(
                                  child: new IconButton(
                                      icon: Icon(
                                        Icons.menu,
                                        color: Colors.white,
                                        size: getProportionateScreenWidth(30),
                                      ),
                                      onPressed: () {
                                        _scaffoldKey.currentState.openDrawer();
                                      })),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                       new Container(
                              width: double.infinity,
                              height: getProportionateScreenHeight(120),
                              margin: EdgeInsets.all(10),
                              padding: EdgeInsets.symmetric(
                                  horizontal: getProportionateScreenWidth(10)),
                              decoration: new BoxDecoration(
                                  color: Color(0xff010028),
                                  borderRadius: BorderRadius.circular(
                                      getProportionateScreenHeight(15)),
                                  boxShadow: [
                                    new BoxShadow(
                                        color: Colors.white.withOpacity(0.3),
                                        offset: new Offset(0, 1)),
                                    new BoxShadow(
                                        color: Colors.white.withOpacity(0.3),
                                        offset: new Offset(1, 0))
                                  ]),
                              child: Stack(
                                children: [
                                  Provider.of<SelectVpnState>(context).ip != null
                                      ?  new Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Row(
                                              children: [
                                                Text(
                                                  "ISP",
                                                  style: new TextStyle(
                                                      color: Colors.white,
                                                      fontFamily:
                                                          StringData.fontPr,
                                                      fontSize:
                                                          getProportionateScreenWidth(
                                                              16)),
                                                ),
                                                Spacer(),
                                                Container(
                                                  width: 1,
                                                  height:
                                                      getProportionateScreenHeight(
                                                          20),
                                                  color: Colors.white,
                                                )
                                              ],
                                            ),
                                            flex: 1,
                                          ),
                                          VerticalDivider(
                                              color: Colors.grey, width: 3),
                                          SizedBox(
                                            width: 3,
                                          ),
                                          Expanded(
                                            child: Row(
                                              children: [
                                                Text(
                                                  Provider.of<SelectVpnState>(
                                                          context)
                                                      .ip
                                                      .data
                                                      .ip
                                                      .isp,
                                                  style: new TextStyle(
                                                      color: Colors.white,
                                                      fontFamily:
                                                          StringData.fontPr,
                                                      fontSize:
                                                          getProportionateScreenWidth(
                                                              16)),
                                                ),
                                              ],
                                            ),
                                            flex: 4,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height:
                                            getProportionateScreenHeight(10),
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Row(
                                              children: [
                                                Text(
                                                  "IP",
                                                  style: new TextStyle(
                                                      color: Colors.white,
                                                      fontFamily:
                                                          StringData.fontPr,
                                                      fontSize:
                                                          getProportionateScreenWidth(
                                                              16)),
                                                ),
                                                Spacer(),
                                                Container(
                                                  width: 1,
                                                  height:
                                                      getProportionateScreenHeight(
                                                          20),
                                                  color: Colors.white,
                                                )
                                              ],
                                            ),
                                            flex: 1,
                                          ),
                                          VerticalDivider(
                                              color: Colors.grey, width: 3),
                                          SizedBox(
                                            width: 3,
                                          ),
                                          Expanded(
                                            child: Row(
                                              children: [
                                                Text(
                                                  Provider.of<SelectVpnState>(
                                                          context)
                                                      .ip
                                                      .data
                                                      .ip
                                                      .query,
                                                  style: new TextStyle(
                                                      color: Colors.white,
                                                      fontFamily:
                                                          StringData.fontPr,
                                                      fontSize:
                                                          getProportionateScreenWidth(
                                                              16)),
                                                ),
                                              ],
                                            ),
                                            flex: 4,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height:
                                            getProportionateScreenHeight(10),
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Row(
                                              children: [
                                                Text(
                                                  "Country",
                                                  style: new TextStyle(
                                                      color: Colors.white,
                                                      fontFamily:
                                                          StringData.fontPr,
                                                      fontSize:
                                                          getProportionateScreenWidth(
                                                              16)),
                                                ),
                                                Spacer(),
                                                Container(
                                                  width: 1,
                                                  height:
                                                      getProportionateScreenHeight(
                                                          20),
                                                  color: Colors.white,
                                                )
                                              ],
                                            ),
                                            flex: 1,
                                          ),
                                          SizedBox(
                                            width: 3,
                                          ),
                                          Expanded(
                                            child: Row(
                                              children: [
                                                Text(
                                                  Provider.of<SelectVpnState>(
                                                          context)
                                                      .ip
                                                      .data
                                                      .ip
                                                      .country,
                                                  style: new TextStyle(
                                                      color: Colors.white,
                                                      fontFamily:
                                                          StringData.fontPr,
                                                      fontSize:
                                                          getProportionateScreenWidth(
                                                              16)),
                                                ),
                                              ],
                                            ),
                                            flex: 4,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ): Align(alignment: Alignment.center,
                                    child: Container(
                                      width: 30,
                                      height: 10,
                                      child: LoadingIndicator(
                                        indicatorType: Indicator.ballPulseSync,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                      bottom: getProportionateScreenHeight(20),
                                      right: 2,
                                      child: GestureDetector(
                                        behavior: HitTestBehavior.opaque,
                                        onTap: () async {
                                          widget.myIP();
                                        },
                                        child: new Row(
                                          children: [
                                            Icon(
                                              Icons.refresh_sharp,
                                              color: Colors.white,
                                              size: getProportionateScreenWidth(
                                                  20),
                                            ),
                                          ],
                                        ),
                                      ))
                                ],
                              ),
                            )
                          ,
                    ],
                  ),
                  flex: 1,
                ),
              ],
            ),
            showProtocolPage
                ? DraggableSearchableListView(
                    callback: ShowProtocol,
                  )
                : new Container(),
          ],
        ),



      ),
    );
  }

  void ShowProtocol(b) {
    getData();
    setState(() {
      showProtocolPage = b;
    });
  }
  void changeConfig({bool b=false}) async {




    String ip = await CatchTool.getIp();
    String getCatch = await CatchTool.Get_Config();
    String getPort = await CatchTool.getPort();
    if (b==false) {
      if (getCatch != null) {
        DataServerList dataServerList=DataServerList.fromJson(jsonDecode(getCatch));
        int pFrom = dataServerList.serviceMeta.config.indexOf("remote ") + "remote ".length;
        int pTo = dataServerList.serviceMeta.config.lastIndexOf("\nresolv");
        print(pFrom);
        String result = dataServerList.serviceMeta.config.substring(pFrom,pTo);
       print(result);
       print(tunels.remoteHost.toString()+" "+getPort );
       var a=dataServerList.serviceMeta.config.replaceAll(result,tunels.remoteHost.toString()+" "+getPort );
        dataServerList.serviceMeta.config=a;
        CatchTool.Set_ConfigProtocol(jsonEncode(dataServerList.toJson()));
        // getCatch = getCatch.replaceAll(
        //     tunels.forwardPort.toString(), tunels.localPort.toString());
        widget.onTap();
      }
    }else
      {
          widget.onTap();
        }
      }

}

class BtnConnect extends StatelessWidget {
  final Function ontap;

  const BtnConnect({this.ontap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(1),
      margin: EdgeInsets.only(bottom: getProportionateScreenWidth(10)),
      width: double.infinity,
      decoration: new BoxDecoration(
          borderRadius: BorderRadius.circular(60),
          gradient: new LinearGradient(colors: [
            Provider.of<SelectVpnState>(context).vpnState == VpnState.CONNECTED
                ? Color(0xff3AFF04)
                : Colors.transparent,
            Provider.of<SelectVpnState>(context).vpnState ==
                    VpnState.DISCONNECTED
                ? Color(0xffFF0404)
                : Provider.of<SelectVpnState>(context).vpnState ==
                        VpnState.CONNECTED
                    ? Colors.transparent
                    : Color(0xffFFF504)
          ])),
      height: getProportionateScreenHeight(80),
      child: Container(
        decoration: new BoxDecoration(
          color: Color(0xff01001C),
          borderRadius: BorderRadius.circular(60),
        ),
        child: Stack(
          children: [
            Positioned(
              left: Provider.of<SelectVpnState>(context).vpnState !=
                      VpnState.CONNECTED
                  ? getProportionateScreenWidth(15)
                  : null,
              right: Provider.of<SelectVpnState>(context).vpnState ==
                      VpnState.CONNECTED
                  ? getProportionateScreenWidth(15)
                  : null,
              top: getProportionateScreenHeight(0),
              bottom: getProportionateScreenHeight(1),
              child: Center(
                  child: Text(
                Provider.of<SelectVpnState>(context).vpnState ==
                        VpnState.CONNECTED
                    ? "On"
                    : Provider.of<SelectVpnState>(context).vpnState ==
                            VpnState.DISCONNECTED
                        ? "OFF"
                        : "Connecting",
                style: new TextStyle(
                    color: Colors.white,
                    fontFamily: StringData.fontPr,
                    fontSize: Provider.of<SelectVpnState>(context).vpnState ==
                                VpnState.CONNECTED ||
                            Provider.of<SelectVpnState>(context).vpnState ==
                                VpnState.DISCONNECTED
                        ? getProportionateScreenWidth(17)
                        : getProportionateScreenWidth(15)),
              )),
            ),
            GestureDetector(
                onTap: ontap,
                child: new AnimatedContainer(
                  height: getProportionateScreenHeight(70),
                  duration: Duration(milliseconds: 300),
                  curve: Curves.decelerate,
                  decoration: new BoxDecoration(
                    borderRadius: BorderRadius.circular(60),
                  ),
                  child: new AnimatedAlign(
                    duration: Duration(milliseconds: 150),
                    alignment: Provider.of<SelectVpnState>(context).vpnState ==
                            VpnState.CONNECTED
                        ? Alignment.centerLeft
                        : Alignment.centerRight,
                    curve: Curves.decelerate,
                    child: SingleChildScrollView(
                      physics: NeverScrollableScrollPhysics(),
                      child: Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenHeight(07),
                            vertical: getProportionateScreenHeight(7)),
                        child: SvgPicture.asset(
                          Provider.of<SelectVpnState>(context).vpnState ==
                                  VpnState.CONNECTED
                              ? "assets/images/btn_conected.svg"
                              : Provider.of<SelectVpnState>(context).vpnState ==
                                      VpnState.DISCONNECTED
                                  ? "assets/images/btn_not_Connect.svg"
                                  : "assets/images/btn_loading.svg",
                          fit: BoxFit.fill,
                          height: getProportionateScreenHeight(70),
                          width: getProportionateScreenWidth(
                            20,
                          ),
                        ),
                      ),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

class BtnCountry extends StatelessWidget {
  const BtnCountry({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          startNewPage(context, ServerListPage());
        },
        child: LocationCard(
            "Select Country",
            Colors.transparent,
            Provider.of<SelectCountryUserVpn>(context, listen: true).userVpns !=
                    null
                ? Provider.of<SelectCountryUserVpn>(context, listen: true)
                    .userVpns
                    .serviceMeta
                    .countryConfig
                    .link
                : null,
            Provider.of<SelectCountryUserVpn>(context, listen: true).userVpns !=
                    null
                ? Provider.of<SelectCountryUserVpn>(context, listen: true)
                    .userVpns
                    .serviceMeta
                    .country
                : "Select Country"));
  }
}

class PicServerChange extends StatelessWidget {
  const PicServerChange({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      Provider.of<SelectVpnState>(context).vpnState == VpnState.CONNECTED
          ? "assets/images/server.svg"
          : Provider.of<SelectVpnState>(context).vpnState ==
                  VpnState.DISCONNECTED
              ? "assets/images/server_disconnect.svg"
              : Provider.of<SelectVpnState>(context).vpnState ==
                          VpnState.WAIT ||
                      Provider.of<SelectVpnState>(context).vpnState ==
                          VpnState.AUTH
                  ? "assets/images/server_loading_2.svg"
                  : Provider.of<SelectVpnState>(context).vpnState ==
                          VpnState.GET_CONFIG
                      ? "assets/images/server_loading_3.svg"
                      : Provider.of<SelectVpnState>(context).vpnState ==
                              VpnState.ASSIGN_IP
                          ? "assets/images/server_loading_4.svg"
                          : "assets/images/server_loading_1.svg",
      width: MediaQuery.of(context).size.width,
      fit: BoxFit.fill,
    );
  }
}

// class sss extends StatelessWidget {
//   const sss({Key key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Container(
//         decoration: new BoxDecoration(
//             borderRadius:
//             BorderRadius.circular(getProportionateScreenWidth(30)),
//             color: ColorApp.backGrand),
//         child: Scaffold(
//             backgroundColor: Colors.transparent,
//             body: new Container(
//               width: screenWidth,
//               height: screenHeight,
//               child: new Stack(
//                 children: [
//                   UpperCurvedContainer(),
//                   Positioned(
//                       top: getProportionateScreenHeight(130),
//                       left: 10,
//                       right: 10,
//                       child: CircularButtonWidget(screenWidth, onTap, state)),
//                   Positioned(
//                     top: getProportionateScreenHeight(210),
//                     left: getProportionateScreenWidth(10),
//                     right: getProportionateScreenWidth(10),
//                     child: new Column(
//                       children: [
//                         SizedBox(height: screenWidth * 0.40),
//                         ConnectedStatusText(state: state,Index:Index,),
//                         SizedBox(height: 20),
//                         // We need to pass parameters to this widget
//                         GestureDetector(
//                             behavior: HitTestBehavior.opaque,
//                             onTap: () {
//                               startNewPage(context, ServerListPage());
//                             },
//                             child: LocationCard(
//                                 'انتخاب سرور',
//                                 Colors.transparent,
//                                 Provider.of<SelectCountryUserVpn>(context,
//                                     listen: true)
//                                     .userVpns !=
//                                     null
//                                     ?Provider.of<SelectCountryUserVpn>(context,
//                                     listen: true)
//                                     .userVpns
//                                     .serviceMeta
//                                     .countryConfig
//                                     .link
//                                     :null,
//                                 Provider.of<SelectCountryUserVpn>(context,
//                                     listen: true)
//                                     .userVpns !=
//                                     null
//                                     ? Provider.of<SelectCountryUserVpn>(context,
//                                     listen: true)
//                                     .userVpns
//                                     .serviceMeta
//                                     .countryConfig
//                                     .fa
//                                     : "لطفا سرور خود را انتخاب کنید")),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             )),
//       ),
//     );
//   }
// }
