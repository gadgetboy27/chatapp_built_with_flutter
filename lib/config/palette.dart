import 'dart:ui';
import 'package:flutter/material.dart';

class Palette {
  static const Color background = Color(0xFFF0F0E4);
  static const Color secondaryBackground = Color(0xFFE7E4D3);
  static const Color green = Color(0xFF2AAF61);
  static const Color primarySwatch = Color(0xFF9E9E9E);
}

const String currentUser = "Robot Me";

final ThemeData kIOSTheme = new ThemeData(
  // primarySwatch: Colors.greenAccent[300],
  primaryColor: Colors.grey,
  primaryColorBrightness: Brightness.light,
);

final ThemeData kDefaultTheme = new ThemeData(
  // primarySwatch: Colors.purple[300],
  accentColor: Colors.orangeAccent[300],
);
