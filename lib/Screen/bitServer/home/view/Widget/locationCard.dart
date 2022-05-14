import 'package:bitserver/core/package/autoSizeText/auto_size_text.dart';
import 'package:bitserver/Screen/bitServer/home/code/providerSelected/selectCountry.dart';
import 'package:bitserver/Screen/bitServer/home/view/Widget/utils.dart';
import 'package:bitserver/core/Strings/String.dart';
import 'package:bitserver/core/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class LocationCard extends StatelessWidget {
  final title;
  final cardBgColor;
  final flag;
  final country;

  LocationCard(this.title, this.cardBgColor, this.flag, this.country);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        width: double.infinity,
        decoration: new BoxDecoration(
            borderRadius: BorderRadius.circular(60),

            color: Color(0xff01001C)
        ),
        height: getProportionateScreenHeight(75),
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            fit: StackFit.expand,
            children: [
              SvgPicture.asset("assets/images/selectCategory.svg",
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fill,
                  height: double.infinity),
              Center(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: getProportionateScreenWidth(20),
                    backgroundImage:flag!=null? NetworkImage(flag):AssetImage("assets/images/serverCountry.png"),
                  ),
                  title: AutoSizeText(
                    country,
                    style: new TextStyle(color:Colors.white,fontSize:getProportionateScreenWidth(16),fontFamily:StringData.fontEnBold),
                    maxLines: 1,
                    maxFontSize: 60,
                    minFontSize: 5,
                  ),
                  trailing: new Text("Change",style: new TextStyle(color:Colors.white,fontSize:getProportionateScreenWidth(16),fontFamily:StringData.fontPr),
                    ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
