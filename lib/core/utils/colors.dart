import 'package:flutter/material.dart';

class BrilloColors {
  BrilloColors._();
  static const Color primary = Color(0xFF0B7957);
  static const Color prim = Color(0xFF0B7957);

  static const Color primaryLight = Color(0xFF9dffd4);
  static const Color primLight = Color(0x14004694);
  static const Color primaryFade = Color(0xFF5da983);
  static const Color deepgrey = Color(0xFF59565F);
  static const Color grey = Color(0xFF79777E);
  static const Color green = Color(0xFF0B7957);
  static const Color lightGreen = Color(0xFFF6FEFC);
  static const Color brightGreen = Color.fromRGBO(29, 197, 36, 1);
  static const Color purple = Color(0xFFA9BDFF);
  static const Color lightGrey = Color(0xFFA6A6A6);
  static const Color white = Color(0xFFFFFFFF);
  static const Color milkWhite = Color(0xFFF5F5F5);
  // static const Color senderBubble = Color(0XFFF8F7FC);
  static const Color senderBubble = Color.fromRGBO(0, 70, 148, .07);
  static const Color receiverBubble = Color(0XFFF6FEFC);
  static const Color warning = Color(0xFFE58B0B);
  static const Color red = Color(0xFFD8372C);
  static const Color redLight = Color(0xFFFCE9E9);
  static const Color black = Color(0xFF353535);
  static const Color greyFill = Color(0xFFf8f8f8);
  static const Color bubbleGrey = Color(0xFFf1f0f5);
  static const MaterialColor primarysWatch = MaterialColor(
    _greenPrimaryValue,
    <int, Color>{
      50: Color(0xFFE3F2FD),
      100: Color(0xFFBBDEFB),
      200: Color(0xFF9dffd4),
      300: Color(0xFF9dffd4),
      400: Color(0xFF1d6200),
      500: Color(_greenPrimaryValue),
      600: Color(_greenPrimaryValue),
      700: Color(0xFF87f5be),
      800: Color(0xFF5da983),
      900: Color(0xFF1d6200),
    },
  );
  static const int _greenPrimaryValue = 0xFF1d6200;
}
