import 'package:bitserver/Screen/bitServer/serverList/widget/page/tunelData.dart';
import 'package:bitserver/core/Strings/String.dart';
import 'package:bitserver/core/utils/size_config.dart';
import 'package:flutter/material.dart';

class DraggableSearchableListView extends StatefulWidget {
  Function callback;

  DraggableSearchableListView({this.callback});

  @override
  _DraggableSearchableListViewState createState() =>
      _DraggableSearchableListViewState();
}

class _DraggableSearchableListViewState
    extends State<DraggableSearchableListView> {
  GlobalKey<ScaffoldState> _key = new GlobalKey();

  List<TextEditingController> controllers = [];
  List<bool> loadings = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  bool padding = true;

  final ValueNotifier<bool> searchFieldVisibility = ValueNotifier<bool>(false);

  @override
  void dispose() {
    searchFieldVisibility.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<DraggableScrollableNotification>(
      onNotification: (notification) {
        if (notification.extent == 1.0) {
          searchFieldVisibility.value = true;
          setState(() {
            padding = false;
          });
        } else {
          setState(() {
            padding = true;
          });
          searchFieldVisibility.value = false;
        }
        return true;
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: padding ? getProportionateScreenWidth(30) : 0),
        child: Scaffold(
          key: _key,
          backgroundColor: Colors.transparent,
          body: DraggableScrollableActuator(
            child: Stack(
              children: <Widget>[
                DraggableScrollableSheet(
                  initialChildSize: 0.50,
                  minChildSize: 0.15,
                  maxChildSize: 1.0,
                  builder: (BuildContext context,
                      ScrollController scrollController) {
                    return Container(
                      decoration: new BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.white,
                                blurRadius: 1,
                                offset: Offset(-1, 0))
                          ],
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(
                                  getProportionateScreenWidth(30)),
                              topLeft: Radius.circular(
                                  getProportionateScreenWidth(30))),
                          gradient: new LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              stops: [0.52, 1.2],
                              colors: [Color(0xff010028), Color(0xff03274F)])),
                      child: TunelData(
                        callback: widget.callback,
                        scrollController: scrollController,
                      ),
                    );
                  },
                ),
                Positioned(
                  left: 0.0,
                  top: 0.0,
                  right: 0.0,
                  child: ValueListenableBuilder<bool>(
                      valueListenable: searchFieldVisibility,
                      builder: (context, value, child) {
                        return value
                            ? PreferredSize(
                                preferredSize: Size.fromHeight(56.0),
                                child: Container(
                                  height: 80,
                                  decoration: new BoxDecoration(
                                      gradient: new LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          stops: [
                                        0.52,
                                        1.2
                                      ],
                                          colors: [
                                        Color(0xff010028),
                                        Color(0xff010028),
                                      ])),
                                  child: Center(
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.center,
                                          child: Center(
                                            child: Text(
                                              "Select Protocol",
                                              style: new TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: StringData.fontEn,
                                                  fontSize:
                                                      getProportionateScreenWidth(
                                                          18)),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: 0,
                                          bottom: 0,
                                          right:
                                              getProportionateScreenWidth(30),
                                          child: IconButton(
                                            icon: Icon(
                                              Icons.clear,
                                              color: Colors.white,
                                            ),
                                            onPressed: () {
                                              widget.callback(false);
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            : Container();
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
