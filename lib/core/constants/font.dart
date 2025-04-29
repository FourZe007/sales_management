import 'package:flutter/material.dart';

class TextFontFamily {
  static const String arial = 'Arial';
  static const String roboto = 'Roboto';
  static const String montserrat = 'Montserrat';
  static const String openSans = 'OpenSans';
  static const String lato = 'Lato';
  static const String sourceSansPro = 'SourceSansPro';
}

class TextFontStyle {
  static TextStyle moreText = TextStyle(
    fontFamily: TextFontFamily.roboto,
    fontSize: 14,
    color: Colors.black,
  );

  static TextStyle textButton = TextStyle(
    fontFamily: TextFontFamily.roboto,
    fontSize: 14,
    color: Colors.blue,
    decoration: TextDecoration.underline,
  );

  static TextStyle textfieldPlaceholder = TextStyle(
    fontFamily: TextFontFamily.roboto,
    fontSize: 16,
    color: Colors.black,
  );

  static TextStyle subtitleRB = TextStyle(
    fontFamily: TextFontFamily.roboto,
    fontSize: 16,
    color: Colors.black,
  );

  static TextStyle titleRB = TextStyle(
    fontFamily: TextFontFamily.roboto,
    fontSize: 24,
    color: Colors.black,
  );

  static TextStyle titleBRB = TextStyle(
    fontFamily: TextFontFamily.roboto,
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static TextStyle normalText = TextStyle(
    fontFamily: TextFontFamily.roboto,
    fontSize: 20,
    color: Colors.black,
  );
}
