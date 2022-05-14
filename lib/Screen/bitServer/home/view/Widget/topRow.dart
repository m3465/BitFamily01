import 'package:bitserver/Screen/SplashScreen/SplashLoading.dart';
import 'package:bitserver/Screen/bitServer/home/view/Widget/utils.dart';
import 'package:bitserver/core/Allert.dart';
import 'package:bitserver/core/CachTool/catchTool.dart';
import 'package:bitserver/core/Strings/String.dart';
import 'package:bitserver/core/utils/constants.dart';
import 'package:bitserver/core/utils/size_config.dart';
import 'package:bitserver/core/vpn/flutter_openvpn.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TopRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            height: 50,
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: GestureDetector(
              onTap: (){
                _launchInBrowser("https://bitserver.in/");
              },
              behavior: HitTestBehavior.opaque,
              child: Row(
                children: <Widget>[
                  Image.asset('assets/images/premiumcrown.png', height: 25),
                  SizedBox(width: 12),
                  Text(
                    'خرید اشتراک',
                    style: new TextStyle(color:Colors.white,fontSize: 14,fontFamily:StringData.fontPr),
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: (){


              var baseDialog = BaseAlertDialog(successValue: (a){
              },errorValue: ( a){},
                  title: "خروج از اکانت",contentHighe: getProportionateScreenHeight(100),changeSize: true,
                  content:
                  "آیا میخواهید از برنامه خارج شوید؟",
                  yesOnPressed: () async{
                    CatchTool.removeTokenAccount();
                    if(await FlutterOpenvpn.check()=="true")
                      {
                    FlutterOpenvpn.stopVPN();}
                    Navigator.of(context, rootNavigator: true).pop('dialog');
                    Navigator.pop(context);
                    replaceNewPage(context, SplashLoadingPage());
                  }
                  ,
                  noOnPressed: () {
                    Navigator.of(context, rootNavigator: true).pop('dialog');
                  },

                  yes: "بله",
                  no:"خیر");
              showDialog(
                  context: context,
                  builder: (BuildContext context) => baseDialog);


            },
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Icon(
                  Icons.power_settings_new_outlined,
                  size: 26,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
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
}
