import 'dart:ui';

import 'package:bitserver/Screen/bitServer/login/EnterNumber/code/provider/EnterCodeStateManagement.dart';
import 'package:bitserver/Screen/bitServer/login/OTP/code/OTPPage.dart';
import 'package:bitserver/Screen/bitServer/login/back/backLogin.dart';
import 'package:bitserver/core/Strings/ColorApp.dart';
import 'package:bitserver/core/Widget/message.dart';
import 'package:bitserver/core/utils/constants.dart';
import 'package:bitserver/core/utils/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:provider/provider.dart';

class EnterNumberView extends StatefulWidget {
  final TextEditingController controller;
final  Function onTap;
  EnterNumberView({
      this.controller, this.onTap});

  @override
  _EnterNumberViewState createState() => _EnterNumberViewState();
}

class _EnterNumberViewState extends State<EnterNumberView> {
  GlobalKey<ScaffoldState> scaffoldKey=new GlobalKey<ScaffoldState>() ;

  @override
  Widget build(BuildContext context) {

    return Scaffold(body: BackLogin(child: new Column(
      crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,children: [
      SizedBox(
        height: getProportionateScreenHeight(20),
      ),

      Container(decoration: new BoxDecoration(
        borderRadius: BorderRadius.circular(getProportionateScreenWidth(30)),
      ), child:
      Container(
        width: MediaQuery.of(context).size.width,
        height: getProportionateScreenHeight(70),
        child: Stack(
          children: [
            new Container(width: double.infinity,height: double.infinity,
              child:SvgPicture.asset("assets/images/bLogin.svg"),),
            Positioned(
              left: getProportionateScreenWidth(30),
              right: 1,
              top: 1,
              bottom: 1,
              child: IntlPhoneField(
                countryCodeTextColor: Colors.white,
                dropDownArrowColor: Colors.white,
                controller: widget.controller,
                // CuntryCodeStyle: getProportionateScreenWidth(16),


                style: new TextStyle(color: Colors.white,fontFamily: "en",fontSize: getProportionateScreenWidth(16)),
                decoration: InputDecoration(
                  hintText: 'Phone Number',
                  border: InputBorder.none,
                  hintStyle: new TextStyle(color: Colors.white,fontFamily: "en",fontSize: getProportionateScreenWidth(16)),

                  counterText: "",
                ),
                onChanged: (phone) {
                  Provider.of<EnterCodeStateManagement>(context,listen: false).setNumber("0"+phone.number);
                },
                onCountryChanged: (phone) {
                  print('Country code changed to: ' + phone.countryCode);
                },
              ),
            ),
            Positioned(
              right: getProportionateScreenWidth(2),
              top: 1,
              bottom: 1,
              child: GestureDetector(
                onTap: Provider.of<EnterCodeStateManagement>(context).isLoading?(){}:() {
                  FocusScope.of(context).unfocus();
                  Provider.of<EnterCodeStateManagement>(context,listen: false).onTapLogin(context,scaffoldKey);
                },
                child: new Container(
                  margin: EdgeInsets.all(getProportionateScreenHeight(6)),
                  child: new Center(
                    child:Provider.of<EnterCodeStateManagement>(context).isLoading?Container(
                      width: getProportionateScreenWidth(30),
                      height: getProportionateScreenHeight(10),
                      child: LoadingIndicator(
                        indicatorType: Indicator.ballPulseSync,
                        color: Colors.black,
                      ),
                    ): Text(
                      'Login',
                      style: new TextStyle(
                          fontSize: getProportionateScreenWidth(16),
                          fontFamily: "en_bold",
                          color: Colors.black),
                    ),
                  ),

                  width: getProportionateScreenWidth(100),height: getProportionateScreenHeight(45),
                  decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(getProportionateScreenWidth(40)),
                      gradient: new LinearGradient(
                          colors: [
                            Color(0xffA5FFFB),
                            Color(0xff42E8E0),

                          ]
                      )
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      )

    ],
    ),),key: scaffoldKey,backgroundColor: Colors.transparent,);
  }
}

