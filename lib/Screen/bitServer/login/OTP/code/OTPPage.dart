import 'package:bitserver/Screen/bitServer/login/OTP/code/provider/OTPStateManagement.dart';
import 'package:bitserver/Screen/bitServer/login/OTP/view/OTPView.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OTPPage extends StatefulWidget {
  @override
  _OTPPagePageState createState() => _OTPPagePageState();
}

class _OTPPagePageState extends State<OTPPage> {

  @override
  Widget build(BuildContext context) =>OTPView();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Provider.of<OTPStateManagement>(context,listen: false).loadingChange(false);
  }
}
