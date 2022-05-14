import 'package:bitserver/Screen/SplashScreen/SplashLoading.dart';
import 'package:bitserver/core/Strings/ColorApp.dart';
import 'package:bitserver/core/Strings/String.dart';
import 'package:bitserver/core/Widget/BackgroundPage.dart';
import 'package:bitserver/core/utils/constants.dart';
import 'package:bitserver/core/utils/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class EnablePage extends StatefulWidget {
  @override
  _EnablePageState createState() => _EnablePageState();
}

class _EnablePageState extends State<EnablePage> {
  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) {
    return BackgroundPage(
      child:Container(
        width: double.infinity,
        height: double.infinity,
        child: new Column(
          children: [
            new Expanded(child:new Container(width: double.infinity,
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
                      SvgPicture.asset("assets/images/update.svg",width: getProportionateScreenWidth(200),height: getProportionateScreenHeight(300),fit: BoxFit.contain,),
                      SizedBox(height: getProportionateScreenHeight(40),),
                      new Text(
                        'Update Application',
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
                          'Click the button below to update the application',
                          textAlign: TextAlign.center, style: new TextStyle(
                            fontSize: getProportionateScreenWidth(16),
                            height: 1.5,
                            color: Colors.white,

                            fontFamily: "en"),
                        ),
                      ),

                    ],
                  )),
                ],
              ),
            ),
              flex: 5,),
            new Expanded(child: new Container(
              width: double.infinity,
              height: double.infinity,
              child: new Stack(children: [
                // Align(
                //   alignment: Alignment.topCenter,
                //   child: new DotsIndicator(
                //     dotsCount: 3,
                //     position: index.toDouble(),
                //
                //     decorator: DotsDecorator(
                //       size: const Size.square(9.0),
                //       activeSize: const Size(36.0, 9.0),
                //       activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                //     ),
                //   ),
                // ),
                // Align(
                //   alignment: Alignment.bottomCenter,
                //   child:Container(
                //     height: getProportionateScreenHeight(80),
                //     padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
                //     child: new Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         Container(
                //           width: getProportionateScreenWidth(80),
                //           height: getProportionateScreenHeight(100),
                //           decoration: new BoxDecoration(
                //               shape: BoxShape.circle
                //           ),
                //           child: InkWell(
                //             onTap: () {
                //               if (index<2){
                //                 setState(() {
                //                   index=2;
                //                 });
                //                 controller.jumpToPage(index);
                //               }
                //
                //             }, // needed
                //             borderRadius: BorderRadius.circular(189),
                //
                //             child: Ink( // use Ink
                //               width: getProportionateScreenWidth(80),
                //               height: getProportionateScreenHeight(100),
                //               child:Center(
                //                 child:Text(
                //                   'Skip',
                //                   style: new TextStyle(
                //                       fontSize: getProportionateScreenWidth(16),
                //                       fontFamily: "en",
                //                       color: Colors.white),
                //                 ) ,
                //               ) ,
                //
                //
                //             ),
                //           ),
                //         ),
                //         index==2?Row(
                //           children: [
                //             Container(
                //               width: getProportionateScreenWidth(80),
                //               height: getProportionateScreenHeight(100),
                //               decoration: new BoxDecoration(
                //                   shape: BoxShape.circle
                //               ),
                //               child: InkWell(
                //                 onTap: () {
                //
                //                   CatchTool.Set_Intro(true);
                //                   PushPole.initialize();
                //                   replaceNewPage(context, EnterNumberPage());
                //
                //                 }, // needed
                //                 borderRadius: BorderRadius.circular(189),
                //
                //                 child: Ink( // use Ink
                //                   width: getProportionateScreenWidth(80),
                //                   height: getProportionateScreenHeight(100),
                //                   child:Center(
                //                     child: Text(
                //                       'Finish',
                //                       style: new TextStyle(
                //                           fontSize: getProportionateScreenWidth(16),                            fontFamily: "en",
                //                           foreground: Paint()..shader = linearGradient),
                //                     ),
                //                   ) ,
                //
                //
                //                 ),
                //               ),
                //             ),
                //           ],
                //         ):Row(
                //           children: [
                //             Container(
                //               width: 80,
                //               height: 100,
                //               decoration: new BoxDecoration(
                //                   shape: BoxShape.circle
                //               ),
                //               child: InkWell(
                //                 onTap: () {
                //                   if (index<2){
                //                     setState(() {
                //                       index+=1;
                //                     });
                //                     controller.jumpToPage(index);}
                //
                //                 }, // needed
                //                 borderRadius: BorderRadius.circular(189),
                //
                //                 child: Ink( // use Ink
                //                   width: 80,
                //                   height: 100,
                //                   child:Center(
                //                     child: Text(
                //                       'Next',
                //                       style: new TextStyle(
                //                           fontSize: getProportionateScreenWidth(16),                            fontFamily: "en",
                //                           foreground: Paint()..shader = linearGradient),
                //                     ),
                //                   ) ,
                //
                //
                //                 ),
                //               ),
                //             ),
                //           ],
                //         )
                //
                //
                //       ],
                //     ),
                //   ),
                // )
                Align(alignment: Alignment.topCenter,child:
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: (){
                      _launchInBrowser("http://panel.bitserver.in/app");
                    },
                    child: new Container(width: getProportionateScreenWidth(250),height: getProportionateScreenHeight(70),
                    child: new Center(
                      child: new Text(
                        'Update Now',
                        textAlign: TextAlign.justify, style: new TextStyle(
                          fontSize: getProportionateScreenWidth(18),
                          color: Color(0xff174F67),

                          fontFamily: StringData.fontEnBold),
                      ),
                    ),
                    decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(getProportionateScreenWidth(50)),
                      gradient: new LinearGradient(colors: [
                        Color(0xffA5FFFB),
                        Color(0xff42E8E0),

                      ])
                    ),),
                  ),)

              ],),
            ),flex: 1,)
          ],
        ),
      ),
    );
  }


  //



}
