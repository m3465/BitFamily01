import 'dart:convert';

import 'package:bitserver/Screen/bitServer/home/code/providerSelected/selectCountry.dart';
import 'package:bitserver/Screen/bitServer/home/view/Widget/utils.dart';
import 'package:bitserver/Screen/bitServer/login/OTP/code/Class/SeverListGenerateManager.dart';
import 'package:bitserver/Screen/bitServer/login/OTP/code/Class/severListGenerate.dart';
import 'package:bitserver/Screen/bitServer/login/OTP/code/provider/CountryUserVpn.dart';
import 'package:bitserver/Screen/bitServer/serverList/cls/ClsTunel.dart';
import 'package:bitserver/Screen/bitServer/serverList/cls/TunelListGenerateManager.dart';
import 'package:bitserver/Screen/bitServer/serverList/cls/Tunels.dart';
import 'package:bitserver/Screen/bitServer/serverList/widget/page/DraggableSearchableListView.dart';
import 'package:bitserver/Screen/bitServer/serverList/widget/page/serverData.dart';
import 'package:bitserver/Screen/bitServer/serverList/widget/page/tunelData.dart';
import 'package:bitserver/Screen/bitServer/serverList/widget/upperCurvedContainer.dart';
import 'package:bitserver/core/CachTool/catchTool.dart';
import 'package:bitserver/core/Config/Config.dart';
import 'package:bitserver/core/Strings/ColorApp.dart';
import 'package:bitserver/core/Strings/String.dart';
import 'package:bitserver/core/Widget/BackgroundPage.dart';
import 'package:bitserver/core/utils/size_config.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:provider/provider.dart';

import 'widget/page/swichCustom.dart';

class ServerListPage extends StatefulWidget {
  @override
  _ServerListPageState createState() => _ServerListPageState();
}

class _ServerListPageState extends State<ServerListPage> with SingleTickerProviderStateMixin{
  TabController controller;
  int page=0;
  Dio _dio;
  @override
  void initState() {
    _dio=Config.createDio();
    // TODO: implement initState
    controller=TabController(length: 2, vsync: this);
    controller.addListener(_setActiveTabIndex);
    getData();

    super.initState();
  }
void getData()async
{
  var a=await CatchTool.getStateProtocol();
  if (a!=null)
    {
      setState(() {
        switchProtocol=a;
      });
    }
}
  void _setActiveTabIndex() {
   setState(() {
     page = controller.index;
   });
  }
  bool switchProtocol=false;
  @override
  Widget build(BuildContext context) {
    return BackgroundPage(


      child: Scaffold(
        appBar: PreferredSize(
          preferredSize:  Size.fromHeight(getProportionateScreenHeight(80)),

          child: new AppBar(
            titleSpacing: 0,
            automaticallyImplyLeading: false,
            title: Container(
              width: MediaQuery.of(context).size.width,
              height: getProportionateScreenHeight(90),
              child: new Stack(
                children: [
                  Positioned(top: 10,bottom: 0,right: 0,left: 0,
                    child: Center(
                      child: Text(
                        "Select Server",
                        style: new TextStyle(
                            color: Colors.white, fontFamily:StringData.fontEn, fontSize: getProportionateScreenWidth(18)),
                      ),
                    ),
                  ),
                  Positioned(top: 10,bottom: 0,left: getProportionateScreenWidth(10),
                    child: Row(
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(left:getProportionateScreenWidth(4),top:getProportionateScreenHeight(4),bottom: getProportionateScreenHeight(4)),
                          child: GestureDetector(behavior: HitTestBehavior.opaque,onTap: (){
                            Navigator.of(context).pop();
                          },child: new SvgPicture.asset("assets/images/back.svg",width: getProportionateScreenWidth(60),height: getProportionateScreenHeight(55),fit: BoxFit.fill,)),
                        ),
                      ],
                    ),
                  )

                ],
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,brightness: Brightness.dark,
            ),
        ),
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: ServerData(showProtocol: ShowProtocol,),
                  ),
                ],
              ),
            ],
          )
              ),
    );
  }

  void ShowProtocol(bool show)
  {
        Navigator.of(context).pop();
  }


}