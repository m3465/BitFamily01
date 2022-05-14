import 'package:flutter/cupertino.dart';

class DateUtil {

  int getDay(String Item) {
    var Years = Item.substring(6, Item.length);
    var Month = Item.substring(3, Item.length - Years.length - 1);
    var day = Item.substring(0, Item.length - Years.length - Month.length - 2);
    return int.parse(day);
  }

  int getMonth(String Item) {
    var Years = Item.substring(6, Item.length);
    var Month = Item.substring(3, Item.length - Years.length - 1);
    var day = Item.substring(0, Item.length - Years.length - Month.length - 2);
    int a = int.parse(Month);
    if (a < 10) a = 10 - (10 - a);
    return a;
  }

  int getYears(String Item) {
    var Years = Item.substring(6, Item.length);
    var Month = Item.substring(3, Item.length - Years.length - 1);
    var day = Item.substring(0, Item.length - Years.length - Month.length - 2);
    return int.parse(Years);
  }







}