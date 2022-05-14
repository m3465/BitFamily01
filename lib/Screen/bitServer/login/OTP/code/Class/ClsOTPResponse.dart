import 'package:bitserver/Screen/bitServer/home/code/HomCode.dart';
import 'package:bitserver/Screen/bitServer/login/OTP/code/Class/SeverListGenerateManager.dart';
import 'package:bitserver/Screen/bitServer/login/OTP/code/Class/severListGenerate.dart';
import 'package:bitserver/Screen/bitServer/login/OTP/code/OTPPage.dart';
import 'package:bitserver/Screen/bitServer/login/OTP/code/provider/CountryUserVpn.dart';
import 'package:bitserver/Screen/bitServer/login/OTP/code/provider/OTPStateManagement.dart';
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

import 'RegisterHandler.dart';

class ClsOTPResponse{



static void otpRequest(String code,BuildContext context,GlobalKey<ScaffoldState>key) async
 {
   Dio _dio=Config.createDio();

   Response response;
   String a=await CatchTool.Get_Mobile();
   String b=await CatchTool.Get_setionid();

   try{
     response=await _dio.post(Config.verify,data: {"code":code,"mobile":a.toString(),"session_id":b.toString()});
     Provider.of<OTPStateManagement>(context,listen: false).loadingChange(true);

     if (response.statusCode==200)
     {
       print(response.data);
       RegisterHandler lg=RegisterHandler.fromJson(response.data);
       if (lg.data.token!=null)
       {
         int Token=await CatchTool.Set_TokenBitServer(lg.data.token);
         int name=await CatchTool.Set_Name(lg.data.user.name);
         int id= await CatchTool.Set_Mobile(lg.data.user.phone!=null?lg.data.user.phone:"");
         CatchTool.Set_email(lg.data.user.email);
         CatchTool.Set_Mobile(lg.data.user.phone!=null?lg.data.user.phone:"");
         CatchTool.Set_Name(lg.data.user.name);


           Response responseServerList= await _dio.post(Config.myServices,data: {"_token":lg.data.token});
           /////////DObare dorost kon
           if (responseServerList.statusCode==200)
           {
             SeverListGenerateManager walletProviderManager=SeverListGenerateManager();
             SeverListGenerate maneger3=SeverListGenerate.fromJson(responseServerList.data);
             walletProviderManager.init(maneger3);
             Provider.of<CountryUserVpn>(context,listen: false).initWallet(walletProviderManager);
             Provider.of<OTPStateManagement>(context,listen: false).loadingChange(false);

             replaceNewPage(context, HOmeCode());

           }else
             {
               replaceNewPage(context, HOmeCode());
             }

       }

     }}
   on DioError catch (e)
   {

     print(e.response);
     // Provider.of<OTPStateManagement>(context,listen: false).loadingChange(false);
     // ErrorHandle.HandleError(e.response).then((e){
     //   createSnackBarError(
     //       key: key,
     //       showPage: false,
     //       message:"لطفا شماره موبایل خود صحیح وارد کنید"
     //   );
     //     });



   }


 }

}