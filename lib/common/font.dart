import 'dart:ui';
import 'package:flutter/material.dart';

final String notoSans = 'NotoSans';

TextStyle titleLarge = TextStyle(fontFamily: 'NotoSans', fontWeight: FontWeight.w800, fontSize: 24);
TextStyle bodyBig = TextStyle(fontFamily: 'NotoSans', fontWeight: FontWeight.w800, fontSize: 30);
TextStyle bodyLarge = TextStyle(fontFamily: 'NotoSans', fontWeight: FontWeight.w600, fontSize: 16);
TextStyle bodyMedium = TextStyle(fontFamily: 'NotoSans', fontWeight: FontWeight.w400, fontSize: 14);

extension TextExtension on TextStyle {
  TextStyle get white => copyWith(color: Colors.white);
  TextStyle get black => copyWith(color: Colors.black);
  TextStyle get grey => copyWith(color: Colors.grey);
  TextStyle get black87 => copyWith(color: Colors.black87);
}
