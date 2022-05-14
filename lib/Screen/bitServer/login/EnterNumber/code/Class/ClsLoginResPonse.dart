import 'package:bitserver/Screen/bitServer/login/EnterNumber/code/Class/ClsLogin.dart';
import 'package:bitserver/Screen/bitServer/login/EnterNumber/code/provider/EnterCodeStateManagement.dart';
import 'package:bitserver/Screen/bitServer/login/OTP/code/OTPPage.dart';
import 'package:bitserver/core/CachTool/catchTool.dart';
import 'package:bitserver/core/Config/Config.dart';
import 'package:bitserver/core/ErrorHandling/ErrorHandler.dart';
import 'package:bitserver/core/Widget/message.dart';
import 'package:bitserver/core/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ClsLoginResponse{

 static void getHttp(String phone,BuildContext context,GlobalKey<ScaffoldState>key,bool repeat) async {
    try {
      Dio _dio=Config.createDio();

      String a=phone;

      a=a.replaceAll(" ", "");

      Provider.of<EnterCodeStateManagement>(context,listen: false).loadingChange(true);

      if(a.length==11){
        var header=Config.header;
        String kk=a+header;
        print(kk);
        if((32-kk.length)>-1)
          kk+=a.substring(0,32-kk.length);
        var keys=kk;
        var jsonHeader={
          "key":keys.toString()
        };


        Response response;

        var rand=await compute(encrypt,jsonHeader);
        response = await _dio.post(Config.login, data: {"mobile":a,
          "rand":rand.toString()
        });
        if (response.statusCode==200)
        {
          ClsLogin login=ClsLogin.fromJson(response.data);
          await CatchTool.Set_setionid(login.data.sessionId.toString());
          await CatchTool.Set_Mobile(a);
          String b=await CatchTool.Get_Mobile();
          Provider.of<EnterCodeStateManagement>(context,listen: false).loadingChange(false);
          if(!repeat)
          replaceNewPage(context, OTPPage());

        }

      }else
      {
        Provider.of<EnterCodeStateManagement>(context,listen: false).loadingChange(false);
        createSnackBarError(
            key: key,
            showPage: false,
            message:"Please Enter Correct number"
        );
      }


    }  on DioError catch (e) {
      debugPrint(e.response.toString());
      Provider.of<EnterCodeStateManagement>(context,listen: false).loadingChange(false);
      ErrorHandle.HandleError(e.response).then((e){
        createSnackBarError(
            key: key,
            showPage: false,
            message:e[0].toString()
        );
      });


    }
  }
}