


import 'package:bitserver/core/package/autoSizeText/auto_size_text.dart';
import 'package:bitserver/core/Strings/ColorApp.dart';
import 'package:bitserver/core/Strings/String.dart';
import 'package:bitserver/core/utils/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void createSnackBarError({
    String message, BuildContext context,showPage,GlobalKey<ScaffoldState> key,Duration duration}) {
  if(context!=null)
    {
      SizeConfig().init(context);
      var snackBar = new SnackBar(
          margin: showPage?EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10),vertical: getProportionateScreenWidth(80))
              :EdgeInsets.all(getProportionateScreenWidth(10)), behavior: SnackBarBehavior.floating,

          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(getProportionateScreenWidth(15))))



          ,elevation: getProportionateScreenWidth(60),
          content: Container(
            height: getProportionateScreenHeight(40),
            child: Center(
              child: Row(
                children: [
                  Container(width: getProportionateScreenWidth(20),height: getProportionateScreenHeight(25),decoration: new BoxDecoration
                    (
                    borderRadius: BorderRadius.circular(getProportionateScreenWidth(10)),
                    color: Color(0xff02123A).withOpacity(0.2),
                  ),child: Center(child: Icon(Icons.warning_amber_outlined,color: Colors.white,))),
                  SizedBox(width: getProportionateScreenWidth(10),),
                  new AutoSizeText(
                    message,
                    maxFontSize: 18,
                    minFontSize: 10,
                    style:new TextStyle(
    color: ColorApp.basicWhite,
    fontFamily:StringData.fontPr,
    fontSize: getProportionateScreenWidth(15),
  ),
                    textAlign: TextAlign.center,

                  ),
                ],
              ),
            ),
          ),
          backgroundColor: Colors.red,duration: duration!=null?duration:Duration(milliseconds: 1200),);
      // Find the Scaffold in the Widget tree and use it to show a SnackBar!
      Scaffold.of(context).showSnackBar(snackBar);
    }else
      {
        SizeConfig().init(key.currentContext);
        var snackBar = new SnackBar(
            margin: showPage?EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10),vertical: getProportionateScreenWidth(80))
                :EdgeInsets.all(getProportionateScreenWidth(10)), behavior: SnackBarBehavior.floating,

            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(getProportionateScreenWidth(15))))
            ,elevation: getProportionateScreenWidth(60),
            content: Container(
              height: getProportionateScreenHeight(60),
              child: Center(
                child: Row(
                  children: [
                    Container(width: getProportionateScreenWidth(50),height: getProportionateScreenHeight(60),decoration: new BoxDecoration
                      (
                      borderRadius: BorderRadius.circular(getProportionateScreenWidth(10)),

                      color: Color(0xff02123A).withOpacity(0.2),
                    ),child: Center(child: Icon(Icons.warning_amber_outlined,color: Colors.white,))),
                    SizedBox(width: getProportionateScreenWidth(10),),
                    new AutoSizeText(
                      message,
                      maxFontSize: 18,
                      minFontSize: 10,
                      style:new TextStyle(
    color: ColorApp.basicWhite,
    fontFamily:StringData.fontPr,
    fontSize: getProportionateScreenWidth(15),
  ),
                      textAlign: TextAlign.center,

                    ),
                  ],
                ),
              ),
            ),
            backgroundColor: Colors.red,duration: duration!=null?duration:Duration(milliseconds: 1200));
        // Find the Scaffold in the Widget tree and use it to show a SnackBar!
        key.currentState.showSnackBar(snackBar);
      }
}




// void createSnackBarErrorServer(
//     String message, GlobalKey<ScaffoldState> key) {
//   final snackBar = new SnackBar(
//       content: new AutoSizeText(
//         message,
//         maxFontSize: getProportionateScreenWidth(18),
//         minFontSize: getProportionateScreenWidth(10),
//         style:new TextStyle(
//     color: ColorApp.basicWhite,
//     fontFamily:StringData.fontPr,
//     fontSize: getProportionateScreenWidth(15),
//   ),
//         textAlign: TextAlign.center,
//       ),
//       backgroundColor: Colors.red);
//   // Find the Scaffold in the Widget tree and use it to show a SnackBar!
//   key.currentState.showSnackBar(snackBar);
// }
Future<bool> createSnackBarComplete({
    String message, BuildContext context,showPage,GlobalKey<ScaffoldState> key}) async{
if(context!=null)
  {
    SizeConfig().init(context);

    SizeConfig().init(context);
    var snackBar = new SnackBar(

        margin: showPage?EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10),vertical: getProportionateScreenWidth(80))
            :EdgeInsets.all(getProportionateScreenWidth(10)), behavior: SnackBarBehavior.floating,
        duration: Duration(milliseconds: 1200),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(getProportionateScreenWidth(15))))



        ,elevation: getProportionateScreenWidth(60),
        content: Container(
          height: getProportionateScreenHeight(40),
          child: Center(
            child: Row(
              children: [
                Icon(Icons.check_rounded,color: Colors.white,),
                SizedBox(width: getProportionateScreenWidth(10),),
                SizedBox(
                  width:  getProportionateScreenWidth(250),
                  child: new AutoSizeText(
                    message,
                    maxFontSize: 14,
                    minFontSize: 9,
                    maxLines: 1,

                    style:new TextStyle(
    color: ColorApp.basicWhite,
    fontFamily:StringData.fontPr,
    fontSize: getProportionateScreenWidth(15),
  ),
                    textAlign: TextAlign.center,

                  ),
                ),
              ],
            ),
          ),
        ),
        backgroundColor: ColorApp.success,);
    Scaffold.of(context).showSnackBar(snackBar);
  }else
    {
      SizeConfig().init(key.currentContext);
      var snackBar = new SnackBar(

          margin: showPage?EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10),vertical: getProportionateScreenWidth(80))
              :EdgeInsets.all(getProportionateScreenWidth(10)), behavior: SnackBarBehavior.floating,
          duration: Duration(milliseconds: 1200),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(getProportionateScreenWidth(15))))



          ,elevation: getProportionateScreenWidth(60),
          content: Container(
            height: getProportionateScreenHeight(40),
            child: Center(
              child: Row(
                children: [
                  Icon(Icons.check_rounded,color: Colors.white,),
                  SizedBox(width: getProportionateScreenWidth(10),),
                  new AutoSizeText(
                    message,
                    maxFontSize: 18,
                    minFontSize: 10,
                    style:new TextStyle(
    color: ColorApp.basicWhite,
    fontFamily:StringData.fontPr,
    fontSize: getProportionateScreenWidth(15),
  ),
                    textAlign: TextAlign.center,

                  ),
                ],
              ),
            ),
          ),
          backgroundColor: ColorApp.success);
      key.currentState.showSnackBar(snackBar);
    }
  return true;

}


Future<bool> createSnackBarNormal({
    String message, BuildContext context,showPage,GlobalKey<ScaffoldState> key,IconData ico=Icons.check_rounded}) async
{

  if(key==null)
  {
    SizeConfig().init(context);

    var snackBar = new SnackBar(
      margin: showPage?EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10),vertical: getProportionateScreenWidth(80))
          :EdgeInsets.all(getProportionateScreenWidth(10))
      ,  behavior: SnackBarBehavior.floating,
      duration: Duration(milliseconds: 1200),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(getProportionateScreenWidth(15))))



      ,elevation: getProportionateScreenWidth(60),
      content: Container(
        height: getProportionateScreenHeight(40),
        child: Center(
          child: Row(
            children: [
              Icon(Icons.check_rounded,color: Colors.white,),
              SizedBox(width: getProportionateScreenWidth(10),),
              new AutoSizeText(
                message,
                maxFontSize: 18,
                minFontSize: 10,
                style:new TextStyle(
    color: ColorApp.basicWhite,
    fontFamily:StringData.fontPr,
    fontSize: getProportionateScreenWidth(15),
  ),
                textAlign: TextAlign.center,

              ),
            ],
          ),
        ),
      ),
      backgroundColor: ColorApp.basicBlack,);
    Scaffold.of(context).showSnackBar(snackBar);
  }else
  {
    var snackBar = new SnackBar(
      margin: showPage?EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10),vertical: getProportionateScreenWidth(80))
          :EdgeInsets.all(getProportionateScreenWidth(10))
      ,  behavior: SnackBarBehavior.floating,
      duration: Duration(milliseconds: 1200),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(getProportionateScreenWidth(15))))



      ,elevation: getProportionateScreenWidth(60),
      content: Container(
        height: getProportionateScreenHeight(40),
        child: Center(
          child: Row(
            children: [
              Icon(ico,color: Colors.white,),
              SizedBox(width: getProportionateScreenWidth(10),),
              new AutoSizeText(
                message,
                maxFontSize: 18,
                minFontSize: 10,
                style:new TextStyle(
    color: ColorApp.basicWhite,
    fontFamily:StringData.fontPr,
    fontSize: getProportionateScreenWidth(15),
  ),
                textAlign: TextAlign.center,

              ),
            ],
          ),
        ),
      ),
      backgroundColor:ColorApp.basicBlack,);
    key.currentState.showSnackBar(snackBar);
  }

  return true;

}