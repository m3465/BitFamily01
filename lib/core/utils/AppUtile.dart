import 'dart:io';

import 'package:flutter/material.dart';

class AppUtils
{
  static fieldFocusChange(BuildContext context, FocusNode currentFocus,FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}