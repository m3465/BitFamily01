import 'dart:convert';
import 'dart:io';
import 'package:bitserver/core/Config/Config.dart';
import 'package:bitserver/core/Strings/ColorApp.dart';
import 'package:bitserver/core/Strings/String.dart';
import 'package:bitserver/core/utils/constants.dart';
import 'package:bitserver/core/utils/size_config.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:package_info/package_info.dart';
import 'package:provider/provider.dart';


class CommingSoon extends StatefulWidget {
  @override
  _CommingSoonPageState createState() => _CommingSoonPageState();
}

class _CommingSoonPageState extends State<CommingSoon> {
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
  }



  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(

      child: Container(
        decoration: new BoxDecoration(
            borderRadius:
            BorderRadius.circular(getProportionateScreenWidth(30)),
            color: ColorApp.backGrand),

        child: new Scaffold(
          backgroundColor: Colors.transparent,

          key: _scaffoldKey,
          body: new Stack(
            children: <Widget>[
              Positioned(
                right: 100,
                top: 70,
                left: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[

                  ],
                ),
              ),
              Positioned(
                  top: getProportionateScreenHeight(300),
                  right: 10,
                  left: 10,
                  child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: getProportionateScreenHeight(50),
                  ),
                  new Text(
                    'این صفحه به زودی در دسترس \nقرار میگیرد',
                    style: new TextStyle(
                        fontSize: 20,
                        color: Colors.white,

                        fontFamily: StringData.fontPr),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(50),
                  ),
                  new Text(
                    'Bit Family',
                    style: new TextStyle(
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontFamily: StringData.fontEnBold),
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
      ),
    );
  }

}
