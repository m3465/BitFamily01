import 'dart:async';

import 'package:bitserver/Screen/Support/ChatSupporter.dart';
import 'package:bitserver/core/Strings/ColorApp.dart';
import 'package:bitserver/core/Strings/String.dart';
import 'package:bitserver/core/WebView/about.dart';
import 'package:bitserver/core/utils/constants.dart';
import 'package:bitserver/core/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class supportPage extends StatefulWidget {

  supportPage();

  @override
  _supportPageState createState() => _supportPageState();
}

class _supportPageState extends State<supportPage> {
  // Instance of WebView plugin



  @override
  void initState() {
    super.initState();

    // flutterWebViewPlugin.stopLoading();
    // flutterWebViewPlugin.close();
  }

  @override
  void dispose() {

    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(fontFamily: 'pr'),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: SafeArea(
          child: Container(
            decoration: new BoxDecoration(
                borderRadius:
                BorderRadius.circular(getProportionateScreenWidth(30)),
                color: ColorApp.backGrand),

            child: Scaffold(
              backgroundColor: Colors.transparent,

              body: Container(
                width: double.infinity,
                height: double.infinity,
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/help.png",width: 300,height: 300,),
                    Text(
                      'Bit Family               07191301442 ',
                      style:TextStyle(
                        color: Colors.white,
                        fontFamily:StringData.fontEnBold,
                        fontSize: 16
                      ),
                    ),
                    SizedBox(height: 60,),


                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
