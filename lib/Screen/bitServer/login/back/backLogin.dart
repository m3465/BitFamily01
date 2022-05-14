import 'package:bitserver/core/Widget/BackgroundPage.dart';
import 'package:bitserver/core/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class BackLogin extends StatelessWidget {
 final Widget child;
   BackLogin({this.child}) ;

  @override
  Widget build(BuildContext context) {
    return BackgroundPage(
      child: new Container(width: double.infinity,
      height: double.infinity,
      child: new Stack(
        children: [

          Align(
            alignment: Alignment.centerLeft,
            child: SvgPicture.asset("assets/images/m.svg"),
          ),
          Positioned(
            right: getProportionateScreenWidth(60),
            top: getProportionateScreenHeight(180),
            left: 1,
            child: SvgPicture.asset("assets/images/logo_string.svg",width: getProportionateScreenWidth(200),height: getProportionateScreenHeight(200),),
          ),
          Positioned(
            right:1,
            top: getProportionateScreenHeight(340),
            left: 1,
            child: child,
          )
        ],
      ),),
    );
  }
}
