import 'dart:ui';

import 'package:bitserver/core/Strings/ColorApp.dart';
import 'package:bitserver/core/Strings/String.dart';
import 'package:bitserver/core/utils/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';


class ClsTextStyle {
  static BuildContext context;
 static void init(BuildContext context)
  {
   ClsTextStyle.context=context;
  }


///Light Text

  static TextStyle lightBox = new TextStyle(
    color: ColorApp.basicWhite,
    fontFamily:StringData.fontPr,
    fontSize: getProportionateScreenWidth(15),
  );
  static TextStyle smallLightBox = new TextStyle(
    color: ColorApp.basicWhite,
    fontFamily:StringData.fontPr,

    fontSize: getProportionateScreenWidth(13),
  );
  static TextStyle headerAppbar= new TextStyle(
    color: ColorApp.basicWhite,
    fontSize: getProportionateScreenWidth(18),
    fontFamily:StringData.fontPrBold,


  );
  static TextStyle headerButtonName= new TextStyle(
    color: ColorApp.basicWhite,
    fontSize: getProportionateScreenWidth(16),
    fontFamily:StringData.fontPrBold,


  );
  static TextStyle lightBoxButton = new TextStyle(
    color: ColorApp.basicWhite,
    fontSize: getProportionateScreenWidth(14),
    fontFamily:StringData.fontPr,

  );

  ///English Font
  static TextStyle lightBoxEn = new TextStyle(
    color: ColorApp.basicWhite,
    fontSize: getProportionateScreenWidth(15),
    fontFamily:StringData.fontEn,

  );
  static TextStyle smallLightBoxEn = new TextStyle(
    color: ColorApp.basicWhite,
    fontSize: getProportionateScreenWidth(13),
    fontFamily:StringData.fontEn,

  );
  static TextStyle headerAppbarEn= new TextStyle(
    color: ColorApp.basicWhite,
    fontSize: getProportionateScreenWidth(18),
    fontFamily:StringData.fontEnBold,


  );
  static TextStyle headerButtonNameEn= new TextStyle(
    color: ColorApp.basicWhite,
    fontSize: getProportionateScreenWidth(16),
    fontFamily:StringData.fontEnBold,


  );
  static TextStyle lightBoxButtonEn = new TextStyle(
    color: ColorApp.basicWhite,
    fontSize: getProportionateScreenWidth(14),
    fontFamily:StringData.fontEn,

  );


  ////dark Text
  static TextStyle lightBoxDark = new TextStyle(
    color: ColorApp.basicBlack,
    fontFamily:StringData.fontPr,
    fontSize: getProportionateScreenWidth(15),
  );
  static TextStyle smallLightBoxDark = new TextStyle(
    color: ColorApp.basicBlack,
    fontFamily:StringData.fontPr,

    fontSize: getProportionateScreenWidth(13),
  );
  static TextStyle headerAppbarDark= new TextStyle(
    color: ColorApp.basicBlack,
    fontSize: getProportionateScreenWidth(18),
    fontFamily:StringData.fontPrBold,


  );
  static TextStyle headerButtonNameDark= new TextStyle(
    color: ColorApp.basicBlack,
    fontSize: getProportionateScreenWidth(16),
    fontFamily:StringData.fontPrBold,


  );
  static TextStyle lightBoxButtonDark = new TextStyle(
    color: ColorApp.basicBlack,
    fontSize: getProportionateScreenWidth(14),
    fontFamily:StringData.fontPr,

  );

  ///English Font
  static TextStyle lightBoxEnDark = new TextStyle(
    color: ColorApp.basicBlack,
    fontSize: getProportionateScreenWidth(15),
    fontFamily:StringData.fontEn,

  );
  static TextStyle smallLightBoxEnDark = new TextStyle(
    color: ColorApp.basicBlack,
    fontSize: getProportionateScreenWidth(13),
    fontFamily:StringData.fontEn,

  );
  static TextStyle headerAppbarEnDark= new TextStyle(
    color: ColorApp.basicBlack,
    fontSize: getProportionateScreenWidth(18),
    fontFamily:StringData.fontEnBold,


  );
  static TextStyle headerButtonNameEnDark= new TextStyle(
    color: ColorApp.basicBlack,
    fontSize: getProportionateScreenWidth(16),
    fontFamily:StringData.fontEnBold,


  );
  static TextStyle lightBoxButtonEnDark = new TextStyle(
    color: ColorApp.basicBlack,
    fontSize: getProportionateScreenWidth(14),
    fontFamily:StringData.fontEn,

  );

}
