
import 'dart:ui';


import 'package:bitserver/core/package/autoSizeText/auto_size_text.dart';
import 'package:bitserver/core/package/autoSizeText/auto_size_text.dart';
import 'package:bitserver/core/utils/constants.dart';
import 'package:bitserver/core/utils/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:provider/provider.dart';


import 'Strings/ColorApp.dart';
import 'Strings/String.dart';


class BaseAlertDialog extends StatefulWidget {

  //When creating please recheck 'context' if there is an error!

  String title;
  String content;
  String yes;
  String no;
  bool lo_start;
  Function yesOnPressed;
  Function noOnPressed;
  double contentHighe;
  double contentwhith;
  Widget child;
  Function successValue;
  Function errorValue;
  bool changeSize;


  BaseAlertDialog({
      this.title,
    this.changeSize=false,
    this.lo_start=true,
      this.content,
      this.yes,
    this.child,
      this.no,
      this.yesOnPressed,
      this.noOnPressed,
    this.successValue,
    this.errorValue,
      this.contentHighe=120,
      this.contentwhith=100});

  @override
  _BaseAlertDialogState createState() => _BaseAlertDialogState();
}

class _BaseAlertDialogState extends State<BaseAlertDialog> {
  Color _color = Color.fromARGB(220, 117, 218 ,255);
  TextEditingController _controller=new TextEditingController();
  bool loading=false;
  static const platform = const MethodChannel('com.darano.bitronet');
  bool ex=false;
  @override
  void initState() {notLandScape();
    // TODO: implement initState
    super.initState();
    platform.setMethodCallHandler(this.receiveData);
  }

  Future<void> receiveData(MethodCall call) async {
    final String data = call.arguments;
    print(data);
    switch (call.method) {
      case "rc":
        widget.successValue(data);

        break;

    case "er":
      widget.errorValue(data);
      break;
    }
  }
  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).viewInsets.bottom);
    setState(() {
      if(widget.changeSize)
        {
          if(MediaQuery.of(context).viewInsets.bottom>0)
            ex=true;else
            ex=false;
        }
    });

    return Directionality(
      textDirection: TextDirection.rtl,
      child: AlertDialog(
        title:new Text(
           widget.title,
            style:
            new TextStyle(
              color: ColorApp.basicWhite
                  ,
              fontSize:
              getProportionateScreenWidth(
                  20),
              fontFamily:
                   StringData
                  .fontPr
                   ,
            )),
        content:Builder(
          builder: (context) {
        // Get available height and width of the build area of this widget. Make a choice depending on the size.
        return Container(child:Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Container(width: double.infinity,height: double.infinity,
                  child: Center(
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(5),vertical: getProportionateScreenHeight(5)),
                      child: new AutoSizeText(

                          widget.content,maxLines: 2,maxFontSize: 18,minFontSize: 12,textAlign: TextAlign.center,
                          style:
                           new TextStyle(
                            color:
                            ColorApp.basicWhite
                            ,
                            fontSize:
                            getProportionateScreenWidth(
                                16),
                            fontFamily:
                               StringData
                                .fontPr
                                ,
                          )


                      ),
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
          height:50,
          decoration: new BoxDecoration(
            borderRadius: BorderRadius.circular(getProportionateScreenWidth(10)),color:ColorApp.basicBlack,
          ),
          width: widget.contentwhith,
        );
      },
      ),
        contentPadding: EdgeInsets.only(right: getProportionateScreenWidth(20),left: getProportionateScreenWidth(20),top: getProportionateScreenHeight(10),bottom: 0),
        backgroundColor:ColorApp.basicBlack,buttonPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
        shape:
        RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15)),
        actions: <Widget>[
          new FlatButton(
      color:Colors.green.shade500
           ,
            shape: RoundedRectangleBorder(borderRadius:new BorderRadius.circular(10)),
            child:loading?Container(
              width: 30,
              height: 10,
              child: LoadingIndicator(
                indicatorType: Indicator.ballPulse,
                color: Colors.white,
              ),
            ): new Text(this.widget.yes,
            style: new TextStyle(
              fontSize:
              getProportionateScreenWidth(
                  16),
              fontFamily:
                   StringData
                  .fontPr
                  ,
            )
                ,),
            textColor: ColorApp.basicWhite,

            onPressed:loading?(){}: () {
              if(widget.lo_start)
                {
                  setState(() {
                    loading=true;
                  });
                }
              this.widget.yesOnPressed();
            },
          ),
          new FlatButton(
            color:Colors.red.shade500,
            shape: RoundedRectangleBorder(borderRadius:new BorderRadius.circular(10)),
            child: Text(this.widget.no,style: new TextStyle(
              fontSize:
              getProportionateScreenWidth(
                  16),
              fontFamily: StringData
                  .fontPr
                  ,
            )
                ,),
            textColor: ColorApp.basicWhite,
            onPressed: () {
              this.widget.noOnPressed();
            },
          ),
        ],
      ),
    );
  }
}