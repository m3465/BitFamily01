import 'package:bitserver/core/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

const kPrimaryColor = Color(0xFFFF7643);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

const kAnimationDuration = Duration(milliseconds: 200);


const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";

final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: BorderSide(color:Colors.deepPurpleAccent),
  );
}
void replaceNewPage(context,Widget nameClass) {
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (_) => nameClass),
  );}

  void startNewPage(context,Widget nameClass,{bool anim}) async {
    Navigator.push(context, PageTransition(type:PageTransitionType.rightToLeft,duration: Duration(milliseconds: 80), child: nameClass,curve: Curves.easeIn));

  }
  void startNewPageAnim(context,Widget nameClass,) async {
    Navigator.push(context, PageTransition(type:PageTransitionType.rightToLeft,duration: Duration(milliseconds: 80), child: nameClass,curve: Curves.easeIn));

  }
void popAnim(context,Widget nameClass,) async {
  Navigator.push(context, PageTransition(type:PageTransitionType.leftToRight,duration: Duration(milliseconds: 20), child: nameClass,curve: Curves.easeIn));

}
  void notLandScape()
  {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
  String replaceFarsiNumber(String input) {
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9',','];
    const farsi = ['۰', '۱', '۲', '۳', '۴', '۵', '۶', '۷', '۸', '۹','،'];

    for (int i = 0; i < english.length; i++) {
      input = input.replaceAll(english[i], farsi[i]);
    }

    return input;
  }
String replaceFarsiNumberToEnglishNumber(String input) {
  const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9',','];
  const farsi = ['۰', '۱', '۲', '۳', '۴', '۵', '۶', '۷', '۸', '۹','،'];

  for (int i = 0; i < farsi.length; i++) {
    input = input.replaceAll(farsi[i], english[i]);
  }

  return input;
}



String PersianPrice(String Num)
{

  return (int.parse(Num)/1000000.0).toString();

}
