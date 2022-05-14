import 'dart:io';

import 'package:bitserver/Screen/bitServer/login/EnterNumber/code/EnterNumberPage.dart';
import 'package:bitserver/core/CachTool/catchTool.dart';
import 'package:bitserver/core/Strings/Images.dart';
import 'package:bitserver/core/Widget/BackgroundPage.dart';
import 'package:bitserver/core/utils/constants.dart';
import 'package:bitserver/core/utils/size_config.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:pushpole/pushpole.dart';
class Intro extends StatefulWidget {
  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  PageController controller=new PageController(initialPage: 0);
  int index=0;

  _onPageViewChange(int page) {
    print("Current Page: " + page.toString());
    setState(() {
      index=page;
    });


  }


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final Shader linearGradient = LinearGradient(
      colors: <Color>[Color(0xffA5FFFB
      ), Color(0xff42E8E0
      )],
    ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
    return BackgroundPage(
      child:Container(
        width: double.infinity,
        height: double.infinity,
        child: new Column(
          children: [
            new Expanded(child: new Container(
              width: double.infinity,
              height: double.infinity,
              child: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (sd){
                  sd.disallowGlow();
                },
                child: new PageView(
                  controller: controller,
                  onPageChanged: _onPageViewChange,
                  children: [
                    new Container(width: double.infinity,
                    height: double.infinity,
                    child: new Stack(
                      children: [
                        Positioned(top: getProportionateScreenHeight(20),right: 1,left: 1,child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,children: [
                            SvgPicture.asset("assets/images/logo_string.svg",height: getProportionateScreenHeight(120),width: getProportionateScreenWidth(161),),

                          ],
                        )),
                        Positioned(top: getProportionateScreenHeight(120),right: 1,left: 1,child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset("assets/images/int.svg",width: getProportionateScreenWidth(200),height: getProportionateScreenHeight(300),fit: BoxFit.contain,),
                            SizedBox(height: getProportionateScreenHeight(25),),
                            new Text(
                              'High Secure Servers',
                              style: new TextStyle(
                                  fontSize: getProportionateScreenWidth(20),
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "en_bold"),
                            ),
                            SizedBox(height: getProportionateScreenHeight(25),),

                            Container(
                              width:getProportionateScreenWidth(300) ,
                              child: new Text(
                                'Highest security and best encryption to keep your account secure',
                               textAlign: TextAlign.center, style: new TextStyle(
                                    fontSize: getProportionateScreenWidth(16),
                                    color: Colors.white,
                                    height: 1.5,

                                    fontFamily: "en"),
                              ),
                            ),

                          ],
                        )),
                      ],
                    ),
                    ),
                    new Container(width: double.infinity,
                      height: double.infinity,
                      child: new Stack(
                        children: [
                          Positioned(top: getProportionateScreenHeight(20),right: 1,left: 1,child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,children: [
                            SvgPicture.asset("assets/images/logo_string.svg",height: getProportionateScreenHeight(120),width: getProportionateScreenWidth(161),),

                          ],
                          )),
                          Positioned(top: getProportionateScreenHeight(120),right: 1,left: 1,child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset("assets/images/speed.svg",width: getProportionateScreenWidth(200),height: getProportionateScreenHeight(300),fit: BoxFit.contain,),
                              SizedBox(height: getProportionateScreenHeight(25),),
                              new Text(
                                'Fast Servers',
                                style: new TextStyle(
                                    fontSize: getProportionateScreenWidth(20),
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "en_bold"),
                              ),
                              SizedBox(height: getProportionateScreenHeight(25),),

                              Container(
                                width:getProportionateScreenWidth(300) ,
                                child: new Text(
                                  'The fastest servers for your use',
                                  textAlign: TextAlign.center, style: new TextStyle(
                                    fontSize: getProportionateScreenWidth(16),
                                    color: Colors.white,
                                    height: 1.5,

                                    fontFamily: "en"),
                                ),
                              ),

                            ],
                          )),
                        ],
                      ),
                    ),

                    new Container(width: double.infinity,
                      height: double.infinity,
                      child: new Stack(
                        children: [
                          Positioned(top: getProportionateScreenHeight(20),right: 1,left: 1,child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,children: [
                            SvgPicture.asset("assets/images/logo_string.svg",height: getProportionateScreenHeight(120),width: getProportionateScreenWidth(161),),

                          ],
                          )),
                          Positioned(top: getProportionateScreenHeight(170),right: 1,left: 1,child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset("assets/images/staticip.svg",width: getProportionateScreenWidth(150),height: getProportionateScreenHeight(250),fit: BoxFit.contain,),
                              SizedBox(height: getProportionateScreenHeight(25),),
                              new Text(
                                'Dedicated IP',
                                style: new TextStyle(
                                    fontSize: getProportionateScreenWidth(20),
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "en_bold"),
                              ),
                              SizedBox(height: getProportionateScreenHeight(25),),

                              Container(
                                width:getProportionateScreenWidth(300) ,
                                child: new Text(
                                  'Dedicated IP for safe trading in Bainance and global markets',
                                  textAlign: TextAlign.center, style: new TextStyle(
                                    fontSize: getProportionateScreenWidth(16),
                                    color: Colors.white,
                                    height: getProportionateScreenHeight(1.5),

                                    fontFamily: "en"),
                                ),
                              ),

                            ],
                          )),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ),flex: 5,),
            new Expanded(child: new Container(
              width: double.infinity,
              height: double.infinity,
              child: new Stack(children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: new DotsIndicator(
                    dotsCount: 3,
                    position: index.toDouble(),

                    decorator: DotsDecorator(
                      size: const Size.square(9.0),
                      activeSize: const Size(36.0, 9.0),
                      activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child:Container(
                    height: getProportionateScreenHeight(80),
                    padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: getProportionateScreenWidth(80),
                        height: getProportionateScreenHeight(100),
                        decoration: new BoxDecoration(
                            shape: BoxShape.circle
                        ),
                        child: InkWell(
                          onTap: () {
                              if (index<2){
                                setState(() {
                                  index=2;
                                });
                                controller.jumpToPage(index);
                              }

                          }, // needed
                          borderRadius: BorderRadius.circular(189),

                          child: Ink( // use Ink
                            width: getProportionateScreenWidth(80),
                            height: getProportionateScreenHeight(100),
                            child:Center(
                              child:Text(
                                'Skip',
                                style: new TextStyle(
                                    fontSize: getProportionateScreenWidth(16),
                                    fontFamily: "en",
                                    color: Colors.white),
                              ) ,
                            ) ,


                          ),
                        ),
                      ),
                     index==2?Row(
                       children: [
                         Container(
                           width: getProportionateScreenWidth(80),
                           height: getProportionateScreenHeight(100),
                           decoration: new BoxDecoration(
                               shape: BoxShape.circle
                           ),
                           child: InkWell(
                             onTap: () {

                               CatchTool.Set_Intro(true);
                               if(Platform.isAndroid)
                                 {
                               // PushPole.initialize();
                                 }
                               replaceNewPage(context, EnterNumberPage());

                             }, // needed
                             borderRadius: BorderRadius.circular(189),

                             child: Ink( // use Ink
                               width: getProportionateScreenWidth(80),
                               height: getProportionateScreenHeight(100),
                               child:Center(
                                 child: Text(
                                   'Finish',
                                   style: new TextStyle(
                                       fontSize: getProportionateScreenWidth(16),                            fontFamily: "en",
                                       foreground: Paint()..shader = linearGradient),
                                 ),
                               ) ,


                             ),
                           ),
                         ),
                       ],
                     ):Row(
                       children: [
                         Container(
                           width: 80,
                           height: 100,
                           decoration: new BoxDecoration(
                               shape: BoxShape.circle
                           ),
                           child: InkWell(
                             onTap: () {
                                 if (index<2){
                                   setState(() {
                                     index+=1;
                                   });
                                   controller.jumpToPage(index);}

                             }, // needed
                             borderRadius: BorderRadius.circular(189),

                             child: Ink( // use Ink
                               width: 80,
                               height: 100,
                               child:Center(
                                 child: Text(
                                   'Next',
                                   style: new TextStyle(
                                       fontSize: getProportionateScreenWidth(16),                            fontFamily: "en",
                                       foreground: Paint()..shader = linearGradient),
                                 ),
                               ) ,


                             ),
                           ),
                         ),
                       ],
                     )


                    ],
                    ),
                  ),
                )

              ],),
            ),flex: 1,)
          ],
        ),
      ),
    );
  }
}
