import 'package:flutter/material.dart';

Map<int, Color> color = {
  50: Color.fromRGBO(122, 193, 117, .1),
  100: Color.fromRGBO(122, 193, 117, .2),
  200: Color.fromRGBO(122, 193, 117, .3),
  300: Color.fromRGBO(122, 193, 117, .4),
  400: Color.fromRGBO(122, 193, 117, .5),
  500: Color.fromRGBO(122, 193, 117, .6),
  600: Color.fromRGBO(122, 193, 117, .7),
  700: Color.fromRGBO(122, 193, 117, .8),
  800: Color.fromRGBO(122, 193, 117, .9),
  900: Color.fromRGBO(122, 193, 117, 1),
};
MaterialColor colorVerde = MaterialColor(0xff7ac175, color);

final ThemeData appThemeData = ThemeData(
  primaryColor: Color(0xff7ac175),
  primarySwatch: colorVerde,
  visualDensity: VisualDensity.adaptivePlatformDensity,
);
