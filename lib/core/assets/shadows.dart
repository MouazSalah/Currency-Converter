import 'package:flutter/material.dart';

class AppShadow {
  static List<BoxShadow> defaultShadow = [
    BoxShadow(
      color: const Color.fromRGBO(158, 158, 158, 1).withOpacity(0.1),
      offset: const Offset(0.0, 2.0),
      blurRadius: 3.0,
      spreadRadius: 0.0,
    )
  ];

  static List<BoxShadow> bottomBarShadow = [
    BoxShadow(
      color: Colors.black.withOpacity(0.1),
      offset: const Offset(0.0, 5.0),
      blurRadius: 10.0,
      spreadRadius: 0.0,
    )
  ];
}
