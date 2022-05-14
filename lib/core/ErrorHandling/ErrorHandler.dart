import 'dart:convert';

import 'package:dio/dio.dart';

class ErrorHandle {

  static Future<List<String>> HandleError(Response rsp) async {
    List<String>s=new List();
    final decoded = jsonDecode(rsp.toString()) as Map;
    final data = decoded['data'] as Map;
    for (final name in data.keys) {
      final value = data[name];
      s.add('${value[0]}');
    }
    return s;
  }


}