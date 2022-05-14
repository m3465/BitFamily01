import 'package:bitserver/core/Strings/ColorApp.dart';
import 'package:bitserver/core/utils/size_config.dart';
import 'package:flutter/material.dart';

class SwitchCustom extends StatelessWidget {
  final Function ontap;  bool value=false;
  SwitchCustom({this.ontap,this.value});


  @override
  Widget build(BuildContext context) {
    return                                     GestureDetector(
      onTap:ontap,
      child: Container(
        padding: EdgeInsets.all(0.5),
        width: getProportionateScreenWidth(60),
        height: getProportionateScreenHeight(45),
        decoration: new BoxDecoration(
            borderRadius: BorderRadius.circular(50),

            gradient: new LinearGradient(colors: [
           Colors.white.withOpacity(.5),
           Colors.white.withOpacity(0)
         ],begin: Alignment.topCenter,end: Alignment.bottomCenter)
        ),
        child: Container(
          decoration: new BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Color(0xff010028),

          ),
          child: new AnimatedContainer(
            width: getProportionateScreenWidth(40),
            height: getProportionateScreenHeight(40),
            duration: Duration(milliseconds: 300),
            curve: Curves.decelerate,
            decoration: new BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              gradient:value? new LinearGradient(
                  colors: [
                    Color(0x2642E8E0),
                    Color(0xff42E8E0).withOpacity(.15)

                  ]): new LinearGradient(
                  colors: [
                    Color(0x2642E8E0),
                    Color(0xff42E8E0).withOpacity(.15)

                  ]),

            ),
            child: new AnimatedAlign(
              duration: Duration(milliseconds: 150),
              alignment:  value
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              curve: Curves.decelerate,
              child:Container(
                margin: EdgeInsets.all(
                    getProportionateScreenWidth(
                        4)),
                width:
                getProportionateScreenWidth(
                    25),
                height:
                getProportionateScreenHeight(
                    25),
                decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    color:value? Color(0xff42E8E0):Color(0xff3342E8E0),
                    border: Border.all(
                        color:value?  Colors.white.withOpacity(0.5):Colors.white.withOpacity(0.3),
                        width: 1)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}