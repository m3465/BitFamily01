import 'package:bitserver/Screen/bitServer/home/view/Widget/utils.dart';
import 'package:bitserver/core/Strings/String.dart';
import 'package:flutter/material.dart';

class TopRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            height: 50,
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.filter_list,
                  size: 28,
                  color: Colors.white70,
                ),
                SizedBox(width: 12),
                Text(
                  'لیست پورت های ترید',
                  style: new TextStyle(color:Colors.white,fontSize: 14,fontFamily:StringData.fontPr),
                )
              ],
            ),
          ),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: (){

              Navigator.of(context).pop();
            },
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Icon(
                  Icons.arrow_forward,
                  size: 26,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
