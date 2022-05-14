import 'package:bitserver/core/package/autoSizeText/auto_size_text.dart';
import 'package:bitserver/Screen/bitServer/home/code/HomCode.dart';
import 'package:bitserver/Screen/bitServer/home/view/Widget/utils.dart';
import 'package:bitserver/core/Strings/ColorApp.dart';
import 'package:bitserver/core/Strings/String.dart';
import 'package:bitserver/core/utils/size_config.dart';
import 'package:flutter/material.dart';

class ConnectedStatusText extends StatelessWidget {
  VpnState state;
  int Index;
  ConnectedStatusText({this.state,this.Index});

  @override
  Widget build(BuildContext context)
  {
    print(Index);
    return Align(
      alignment: Alignment.center,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("وضعیت",style: connectedStyle,),
            ],
          ),
          SizedBox(height: getProportionateScreenHeight(10),),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 300,
                child: AutoSizeText(
                 Index==0? "برای اتصال به پورت اختصاصی ترید کلیک کنید":connectionState(state: state),
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                    color: _color(state),
                    fontFamily: StringData.fontPr,

                  ),
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  maxFontSize: 18,
                  minFontSize: 5,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  Color _color (VpnState state)
  {
    if(state==VpnState.DISCONNECTED)
      {
        return ColorApp.error;
      }
    else if(state==VpnState.CONNECTED)
      {
        return ColorApp.success;
      }else {
      return ColorApp.warning;
    }
  }
  
  String connectionState({VpnState state}) {
    switch (state) {
      case VpnState.CONNECTED:
        return 'شما به پورت اختصاصی ترید متصل شده اید';
      case VpnState.WAIT:
        return 'در حال متصل شدن به پورت اختصاصی ترید , لطفا منتظر بمانید';
      case VpnState.ASSIGN_IP:
        return 'در حال تنظیم کردن پورت اختصاصی ترید , لطفا منتظر بمانید';
      case VpnState.AUTH:
        return 'در حال عبور از تحریم ترید , لطفا منتظر بمانید';
      case VpnState.RECONNECTING:
        return 'در حال متصل شدن دوباره به پورت اختصاصی ترید , لطفا منتظر بمانید';

      default:
        return 'لطفا منتظر بمانید';
    }
  }

}
