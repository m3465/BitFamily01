import 'package:bitserver/Screen/bitServer/home/code/HomCode.dart';
import 'package:bitserver/Screen/bitServer/home/code/providerSelected/selectCountry.dart';
import 'package:bitserver/Screen/bitServer/home/view/Widget/utils.dart';
import 'package:bitserver/Screen/bitServer/login/OTP/code/Class/severListGenerate.dart';
import 'package:bitserver/core/Strings/ColorApp.dart';
import 'package:bitserver/core/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CircularButtonWidget extends StatelessWidget {
  final  width;
  Function ontap;
  SeverConfig config;
  VpnState state;

  CircularButtonWidget(this.width,this.ontap,this.state);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: ontap,
          child: Container(
            height: width * 0.51,
            width: width * 0.51,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: curveGradient,
              // color: Colors.red,
            ),
            child: Center(
              child: Container(
                height: width * 0.4,
                width: width * 0.4,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: bgColor,
                ),
                child: Center(
                  child: Container(
                    height: width * 0.3,
                    width: width * 0.3,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:_color(state),
                        boxShadow: [
                          BoxShadow(
                            color:_color(state).withOpacity(.2),
                            spreadRadius: 15,
                            blurRadius: 15,
                          ),
                        ]),
                    child: Center(
                      child: Icon(state==VpnState.DISCONNECTED?Icons.wifi_lock:Icons.network_wifi, color: Colors.white, size: 50),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Provider.of<SelectCountryUserVpn>(context,
            listen: true)
            .userVpns !=
            null
            ?  Positioned(
          left: getProportionateScreenWidth(80),
          top: 30,
          child: Container(
            padding: EdgeInsets.all(8),
            height: 60,
            width: 60,
            decoration: BoxDecoration(color: bgColor, shape: BoxShape.circle),
            child: Center(
              child: CircleAvatar(
                backgroundImage: NetworkImage(Provider.of<SelectCountryUserVpn>(context,
                    listen: true)
                    .userVpns
                    .serviceMeta
                    .countryConfig
                    .link),
                radius: 40,
                backgroundColor: Colors.transparent,
              ),
            ),
          ),
        ):new Container(),
        //top left widget
      ],
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

}