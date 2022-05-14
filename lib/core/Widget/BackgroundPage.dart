import 'package:flutter/material.dart';

class BackgroundPage extends StatelessWidget {
  BackgroundPage({this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: new BoxDecoration(
          gradient: new LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops:[
                0.52,1.2
              ] ,
              colors: [
                Color(0xff010028),
                Color(0xff03274F)
              ]
          )
      ),
      child: new Scaffold(backgroundColor: Colors.transparent,
        body: child,
      ),
    );
  }
}
