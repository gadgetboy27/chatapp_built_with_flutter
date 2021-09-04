import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:friendlychat/screens/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'config/palette.dart';

void main() {
  runApp(new FriendlychatApp()); 
}

class FriendlychatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp( 
      title: "FriendlyChat",
      debugShowCheckedModeBanner: false,
      theme: 
        // defaultTargetPlatform == TargetPlatform.iOS
        // ? kIOSTheme
        // : kDefaultTheme,
        ThemeData(
          appBarTheme: const AppBarTheme(backgroundColor: Palette.background),
          scaffoldBackgroundColor:Palette.background,
          primaryColor: Colors.white,
          accentColor: Palette.green,
          iconTheme: const IconThemeData(color: Colors.black),
          fontFamily: GoogleFonts.montserrat().fontFamily,
          textTheme: GoogleFonts.montserratTextTheme(),
        ),
      home: new HomeScreen(),
    );
  }
}