import 'package:bitserver/Screen/Intro/intro_view.dart';
import 'package:bitserver/Screen/SplashScreen/SplashLoading.dart';
import 'package:bitserver/Screen/bitServer/home/code/HomCode.dart';
import 'package:bitserver/Screen/bitServer/login/OTP/code/provider/CountryUserVpn.dart';
import 'package:bitserver/Screen/bitServer/serverList/cls/Tunels.dart';
import 'package:bitserver/core/Strings/ColorApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'Screen/bitServer/home/code/providerSelected/SelectVpnState.dart';
import 'Screen/bitServer/home/code/providerSelected/homeState.dart';
import 'Screen/bitServer/home/code/providerSelected/selectCountry.dart';
import 'Screen/bitServer/login/EnterNumber/code/provider/EnterCodeStateManagement.dart';
import 'Screen/bitServer/login/OTP/code/provider/OTPStateManagement.dart';
import 'core/provider/AppStateNotifier.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  runApp((MultiProvider(child: MyApp(),providers:[
    ChangeNotifierProvider<EnterCodeStateManagement>(create: (_) => EnterCodeStateManagement()),
    ChangeNotifierProvider<CountryUserVpn>(create: (_) => CountryUserVpn()),
    ChangeNotifierProvider<OTPStateManagement>(create: (_) => OTPStateManagement()),
    ChangeNotifierProvider<SelectCountryUserVpn>(create: (_) => SelectCountryUserVpn()),
    ChangeNotifierProvider<HomeState>(create: (_) => HomeState()),
    ChangeNotifierProvider<AppStateNotifier>(create: (_) => AppStateNotifier()),
    ChangeNotifierProvider<SelectVpnState>(create: (_) => SelectVpnState()),
    ChangeNotifierProvider<TunelsProvider>(create: (_) => TunelsProvider()),
  ],)
  ));
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    strengths.forEach((strength) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    });
    return MaterialColor(color.value, swatch);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyVps',
      debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: createMaterialColor(ColorApp.backGrand),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        accentColor: ColorApp.basicBlack,
          scaffoldBackgroundColor: ColorApp.backGrand

      ),
        darkTheme: ThemeData(
            primarySwatch: createMaterialColor(ColorApp.backGrand),
            visualDensity: VisualDensity.adaptivePlatformDensity,
            accentColor: ColorApp.basicWhite,
            scaffoldBackgroundColor: ColorApp.backGrand
        ),
      home: SplashLoadingPage(),
    );
  }
}

