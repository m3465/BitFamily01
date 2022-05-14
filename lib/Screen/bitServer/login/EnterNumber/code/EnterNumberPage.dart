import 'package:bitserver/Screen/bitServer/login/EnterNumber/code/provider/EnterCodeStateManagement.dart';
import 'package:bitserver/Screen/bitServer/login/EnterNumber/view/EnterNumberView.dart';
import 'package:bitserver/Screen/bitServer/login/OTP/code/provider/OTPStateManagement.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EnterNumberPage extends StatefulWidget {
  @override
  _EnterNumberPageState createState() => _EnterNumberPageState();
}

class _EnterNumberPageState extends State<EnterNumberPage> {



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<EnterCodeStateManagement>(context,listen: false).setNumber("");
      Provider.of<EnterCodeStateManagement>(context,listen: false).loadingChange(false);
      Provider.of<OTPStateManagement>(context,listen: false).loadingChange(false);
      Provider.of<OTPStateManagement>(context,listen: false).setCode("");
      Provider.of<OTPStateManagement>(context,listen: false).setTimer(59);    });

  }

  @override
  Widget build(BuildContext context) =>EnterNumberView();
}
