import 'dart:async';

import 'package:bitserver/Screen/bitServer/login/EnterNumber/code/EnterNumberPage.dart';
import 'package:bitserver/Screen/bitServer/login/EnterNumber/code/provider/EnterCodeStateManagement.dart';
import 'package:bitserver/Screen/bitServer/login/OTP/code/provider/OTPStateManagement.dart';
import 'package:bitserver/Screen/bitServer/login/back/backLogin.dart';
import 'package:bitserver/core/Strings/ColorApp.dart';
import 'package:bitserver/core/utils/constants.dart';
import 'package:bitserver/core/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:provider/provider.dart';

class OTPView extends StatefulWidget {
  TextEditingController controller;
  @override
  _OTPViewState createState() => _OTPViewState();
}

class _OTPViewState extends State<OTPView> {

  GlobalKey<ScaffoldState> scaffoldKey=new GlobalKey<ScaffoldState>() ;
  Timer _timer;
  int _start = 59;
  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
          (Timer timer) => setState(
            () {
          if (_start < 1) {
            timer.cancel();
          } else {
            _start = _start - 1;
          }
        },
      ),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }



  @override
  Widget build(BuildContext context) {
    final Shader linearGradient = LinearGradient(
      colors: <Color>[Color(0xffA5FFFB
      ), Color(0xff42E8E0
      )],
    ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
    return Scaffold(body: BackLogin(child: new Column(
      crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,children: [
      SizedBox(
        height: getProportionateScreenHeight(20),
      ),
      Text("4-Digit Code Sent to: "
          "${"+98"+Provider.of<EnterCodeStateManagement>(context).number.substring(1,Provider.of<EnterCodeStateManagement>(context).number.length)}  ",
        style: TextStyle(
          fontWeight: FontWeight.w700,
          color: Colors.white,
          fontSize: getProportionateScreenWidth(16),
          fontFamily:'pr',
          wordSpacing: 1.65,

        ),
      ),
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
              right:  getProportionateScreenWidth(30),
              top: 1,
              bottom: 1,
              child:Row(
                children: [
                  SizedBox(width: getProportionateScreenWidth(200),child: animatingBorders()),
                ],
              ),
            ),
            Positioned(
              right: getProportionateScreenWidth(20),
              top: 1,
              bottom: 1,
              child: GestureDetector(
                onTap:Provider.of<OTPStateManagement>(context).isLoading?(){}:() {
                  FocusScope.of(context).unfocus();
                  Provider.of<OTPStateManagement>(context,listen: false).loadingChange(true);
                  Provider.of<OTPStateManagement>(context,listen: false).onTapLogin(context,scaffoldKey);
                },
                child: new Container(
                  margin: EdgeInsets.all(getProportionateScreenHeight(6)),
                  child: new Center(
                    child:Provider.of<OTPStateManagement>(context).isLoading?Container(
                      width: 30,
                      height: 10,
                      child: LoadingIndicator(
                        indicatorType: Indicator.ballPulseSync,
                        color: Colors.black,
                      ),
                    ): Text(
                      'Enter',
                      style: new TextStyle(
                          fontSize: getProportionateScreenWidth(16),
                          fontFamily: "en_bold",
                          color: Colors.black),
                    ),
                  ),

                  width: getProportionateScreenWidth(100),height: getProportionateScreenHeight(45),
                  decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
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

      ),
      SizedBox(
        height: getProportionateScreenHeight(40),
      ),
      Padding(
        padding:  EdgeInsets.symmetric(horizontal: getProportionateScreenHeight(30) ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            (_start>0)? Container(

              child: new Text(
                'Resend Code (${_start>9?_start.toString():"0"+_start.toString()}s) ',
                maxLines: 3,
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.center,
                style: new TextStyle(
                  color: ColorApp.basicWhite,
                  fontSize:  getProportionateScreenWidth(16),
                  fontWeight: FontWeight.w700,
                  fontFamily: 'pr',
                ),
              ),
            ):
            Container(

              child: InkWell(
                onTap: (){
                  FocusScope.of(context).unfocus();

                  setState(() {
                    _start=59;
                  });
                  startTimer();
                  Provider.of<EnterCodeStateManagement>(context,listen: false).onTapLogin(context, scaffoldKey,repeat: true);
                },
                child: new Text(
                  'Resend Code',
                  maxLines: 3,
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                    color: ColorApp.basicWhite,
                    fontSize:  getProportionateScreenWidth(16),
                    fontWeight: FontWeight.w700,
                    fontFamily: 'pr',
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                replaceNewPage(context, EnterNumberPage());


              }, // needed
              borderRadius: BorderRadius.circular(189),

              child:Center(
                child: Text(
                  'Change Number',
                  style: new TextStyle(
                      fontSize: getProportionateScreenWidth(16),                            fontFamily: "en",
                      foreground: Paint()..shader = linearGradient),
                ),
              ),
            )
          ],
        ),
      )
    ],
    ),),key: scaffoldKey,backgroundColor: Colors.transparent,);
  }
  Widget animatingBorders() {
    final BoxDecoration pinPutDecoration = BoxDecoration(
      border: Border.all(color: Colors.deepPurpleAccent),
      borderRadius: BorderRadius.circular(15.0),
    );
    return PinPut(
      fieldsCount: 4,
      preFilledWidget: new Text("___",style: new TextStyle(color: Colors.grey),),
      autofocus: false,
      textStyle: new TextStyle(
        color: ColorApp.basicWhite,
        fontSize:  getProportionateScreenWidth(16),
        fontWeight: FontWeight.w700,
        fontFamily: 'en',
      ),

      eachFieldHeight: 40.0,
      withCursor: true,
      onChanged: (s){
        print(s);
      Provider.of<OTPStateManagement>(context,listen: false).setCode(s);
    },
    );
  }


}

// class s extends StatelessWidget {
//   const s({Key key}) : super(key: key);
//
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
//           key: scaffoldKey,
//           backgroundColor: Colors.transparent,
//           body: ListView(
//             children: [
//               Column(
//                 children: [
//                   FadeAnimation(
//                     1,
//                     Stack(
//                       children: <Widget>[
//                         Align(
//                           alignment: Alignment.topCenter,
//                           child: Padding(
//                             padding:  EdgeInsets.all(getProportionateScreenWidth(20)),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 SvgPicture.asset("assets/images/verifi.svg",height: 170,),
//
//                                 Text(
//                                   "یک پیام به شماره ${replaceFarsiNumber(Provider.of<EnterCodeStateManagement>(context).number)} ارسال  ",
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.w700,
//                                     color: Colors.white,
//                                     fontFamily:'pr',
//                                     wordSpacing: 1.65,
//
//                                   ),
//                                 ),
//                                 SizedBox(height: 10,),
//                                 Text(
//                                   "شده است  لطفا آن را وارد کنید ",
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.w700,
//                                     wordSpacing: 1.65,
//                                     color: Colors.white,
//                                     fontFamily:'pr',
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   FadeAnimation(
//                     2,
//                     Stack(
//                       children: <Widget>[
//                         Align(
//                             alignment: Alignment.topCenter,
//                             child:animatingBorders()),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   FadeAnimation(1.75,),
//                   FadeAnimation(
//                     3,
//                     Stack(
//                       children: <Widget>[
//                         Align(
//                             alignment: Alignment.topCenter,
//                             child: new fn.NeumorphicButton(
//                                 margin: EdgeInsets.only(
//                                     top: 12, left: 12, right: 12),
//                                 onPressed:Provider.of<OTPStateManagement>(context).isLoading?(){}:() {
//                                   FocusScope.of(context).unfocus();
//                                   Provider.of<OTPStateManagement>(context,listen: false).onTapLogin(context,scaffoldKey);
//                                 },
//                                 style: fn.NeumorphicStyle(
//                                   shape: fn.NeumorphicShape.convex,
//                                   color:Provider.of<OTPStateManagement>(context).isLoading?ColorApp.backGrand: Color(0xFF1E202C),
//                                   depth: Provider.of<OTPStateManagement>(context).isLoading?0:2.5,
//                                   shadowLightColor: Provider.of<OTPStateManagement>(context).isLoading?ColorApp.backGrand:Colors.grey.shade600,
//                                   shadowLightColorEmboss:Provider.of<OTPStateManagement>(context).isLoading?ColorApp.backGrand: Colors.black26,
//                                   boxShape: fn.NeumorphicBoxShape.roundRect(
//                                       BorderRadius.circular(8)),
//                                   //border: NeumorphicBorder()
//                                 ),
//                                 padding: const EdgeInsets.all(12.0),
//                                 child: new Row(
//                                   crossAxisAlignment: CrossAxisAlignment.center,
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Provider.of<OTPStateManagement>(context).isLoading?Container(
//                                       width: 30,
//                                       height: 10,
//                                       child: LoadingIndicator(
//                                         indicatorType: Indicator.ballPulseSync,
//                                         color: Colors.white,
//                                       ),
//                                     ):
//                                     Text(
//                                       "تایید",
//                                       maxLines: 1,
//                                       overflow: TextOverflow.ellipsis,
//                                       style: TextStyle(
//                                           fontFamily: 'pr',
//                                           fontSize:
//                                           getProportionateScreenWidth(16),
//                                           color: Colors.white),
//                                     ),
//                                   ],
//                                 )))
//                       ],
//                     ),
//                   ),
//                   FadeAnimation(
//                     4,
//                     new Container(
//                       width: double.infinity,
//                       height: MediaQuery.of(context).size.height / 6,
//                       child: Stack(
//                         children: <Widget>[
//                           Align(
//                             child: new Column(
//                               crossAxisAlignment: CrossAxisAlignment.end,
//                               mainAxisAlignment: MainAxisAlignment.end,
//                               children: [
//                                 NeumorphicText(
//                                   "بیت سرور      2.0.0",
//                                   style: NeumorphicStyle(
//                                     depth: .5, //customize depth here
//                                     color: ColorApp
//                                         .backGrand, //customize color here
//                                   ),
//                                   textStyle: NeumorphicTextStyle(
//                                     fontSize: getProportionateScreenWidth(20),
//                                     fontFamily: 'pr',
//
//                                     // AND others usual text style properties (fontFamily, fontWeight, ...)
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             alignment: Alignment.bottomCenter,
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
