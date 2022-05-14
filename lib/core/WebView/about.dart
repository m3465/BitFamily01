import 'dart:async';

import 'package:bitserver/core/Strings/ColorApp.dart';
import 'package:bitserver/core/utils/size_config.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class InAppWebViewPage extends StatefulWidget {
  String url;

  InAppWebViewPage({this.url});

  @override
  _InAppWebViewPageState createState() => new _InAppWebViewPageState();
}

class _InAppWebViewPageState extends State<InAppWebViewPage> {
  // InAppWebViewController _webViewController;
  final _key = UniqueKey();
  int _page = 1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: new BoxDecoration(
            borderRadius:
            BorderRadius.circular(getProportionateScreenWidth(30)),
            color: ColorApp.backGrand),

        child: Scaffold(
            body:IndexedStack(
              index: _page,
              children: [
                Column(children: <Widget>[
                  Expanded(
                    child: Container(
                      // child: WebView(
                      //   key: _key,
                      //   initialUrl: widget.url,
                      //   javascriptMode: JavascriptMode.unrestricted,
                      //   onPageFinished: (finish) {
                      //     setState(() {
                      //       _page = 0;
                      //     });
                      //   },
                      //
                      //
                      // ),
                      // child: InAppWebView(
                      //   initialUrl: widget.url,
                      //
                      //   initialOptions: InAppWebViewGroupOptions(
                      //     crossPlatform: InAppWebViewOptions(
                      //       mediaPlaybackRequiresUserGesture: false,
                      //       debuggingEnabled: true,
                      //     ),
                      //   ),
                      //   onWebViewCreated: (InAppWebViewController controller) {
                      //     _webViewController = controller;
                      //   },
                      //   onLoadStop: (InAppWebViewController controller, String url) {
                      //     setState(() {
                      //       _page = 0;
                      //     });
                      //   },
                      //
                      //   // androidOnPermissionRequest: (InAppWebViewController controller, String origin, List<String> resources) async {
                      //   //   return PermissionRequestResponse(resources: resources, action: PermissionRequestResponseAction.GRANT);
                      //   // }
                      // ),
                    ),
                  ),
                ]),
                Container(
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ],
            )
        ),
      ),
    );
  }
}