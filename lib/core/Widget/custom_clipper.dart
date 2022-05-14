import 'package:flutter/cupertino.dart';

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // I am using bezier curves to compe up with perfect curve for clipping

    Path path = Path()
      ..moveTo(0, size.height)
      ..cubicTo(size.width * 1 / 4, size.height * 14 / 15, size.width * 0.250,
          size.height * 2 / 4, size.width * 0.5, size.height * 2 / 4)
      ..cubicTo(size.width * 0.750, size.height * 2 / 4, size.width * 0.750,
          size.height * 14 / 15, size.width, size.height)
          ..lineTo(size.width, 0)
          ..lineTo(0, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}