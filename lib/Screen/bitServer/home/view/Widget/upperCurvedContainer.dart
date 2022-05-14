import 'package:bitserver/Screen/bitServer/home/view/Widget/topRow.dart';
import 'package:bitserver/Screen/bitServer/home/view/Widget/utils.dart';
import 'package:bitserver/core/Widget/custom_clipper.dart';
import 'package:bitserver/core/utils/size_config.dart';
import 'package:flutter/material.dart';

class UpperCurvedContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyCustomClipper(),
      child: Container(
        height: 150,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: curveGradient,
          borderRadius: BorderRadius.only(topLeft:Radius.circular(getProportionateScreenWidth(30) ),topRight: Radius.circular(getProportionateScreenWidth(30) )
    )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding:  EdgeInsets.all(getProportionateScreenHeight(20)),
              child: TopRow(),
            ),
            // Text('BitServer', style: vpnStyle),
            // SizedBox(height: 20,)
            // _bottomRow(),
          ],
        ),
      ),
    );
  }
}
