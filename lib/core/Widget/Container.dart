import 'dart:ui';

import 'package:bitserver/core/utils/size_config.dart';
import 'package:flutter/cupertino.dart';

class ClsContainer {
  static BoxDecoration _decoration(
      {Color color,List<Color>gradient, BorderRadius radius, List<
          BoxShadow> boxShadows, DecorationImage image,BoxBorder border}) {
    return new BoxDecoration(
        boxShadow:boxShadows!=null?boxShadows:null,
        borderRadius:radius!=null? radius:null,
      color:color!=null? color:null,
      border:border!=null? border:null ,
      gradient:gradient!=null? new LinearGradient(
        colors: gradient
      ):null,
      image:image!=null? image:null,
    );
  }

  static Container containerItemList(
      {EdgeInsets padding=const EdgeInsets.all(0),EdgeInsets margin=const EdgeInsets.all(0),Widget child,double height,double width,Color color,List<Color>gradient, BorderRadius radius, List<
          BoxShadow> boxShadows, DecorationImage image}) {
    return new Container(
      width:width,
      padding: padding,
      margin: margin,
      height:height ,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
        child: child,
      ),
      decoration: _decoration(boxShadows: boxShadows,image: image,color: color,gradient: gradient,radius: radius),
    );
  }

  static Container container(
      {EdgeInsets padding,EdgeInsets margin,Widget child,double height,double width,Color color,List<Color>gradient, BorderRadius radius, List<
          BoxShadow> boxShadows, DecorationImage image,BoxBorder border}) {
    return new Container(
      width:width,
      padding: padding,
      margin: margin,
      height:height ,
      child: child,
      decoration: _decoration(boxShadows: boxShadows,image: image,color: color,gradient: gradient,radius: radius,border: border),
    );
  }

  static Container containerBasic(
      {EdgeInsets padding,EdgeInsets margin,Widget child,double height,double width,Color color,List<Color>gradient, double radiusTopLeft=0,double radiusTopRight=0, List<
          BoxShadow> boxShadows, DecorationImage image,BoxBorder border}) {
    return new Container(
      width:width,
      padding: padding,
      margin: margin,
      height:height ,
      child: child,
      decoration: _decoration(boxShadows: boxShadows,image: image,color: color,gradient: gradient
          ,radius: BorderRadius.only(bottomLeft:Radius.circular(getProportionateScreenWidth(30)),bottomRight: Radius.circular(getProportionateScreenWidth(30)),topLeft: Radius.circular(getProportionateScreenWidth(radiusTopLeft)),topRight: Radius.circular(getProportionateScreenWidth(radiusTopRight))),border: border),
    );
  }
}