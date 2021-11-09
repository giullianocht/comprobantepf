import 'package:flutter/material.dart';

Map<int, Color> color = {
  50: Color.fromRGBO(6, 36, 36, .1),
  100: Color.fromRGBO(6, 36, 36, .2),
  200: Color.fromRGBO(6, 36, 36, .3),
  300: Color.fromRGBO(6, 36, 36, .4),
  400: Color.fromRGBO(6, 36, 36, .5),
  500: Color.fromRGBO(6, 36, 36, .6),
  600: Color.fromRGBO(6, 36, 36, .7),
  700: Color.fromRGBO(6, 36, 36, .8),
  800: Color.fromRGBO(6, 36, 36, .9),
  900: Color.fromRGBO(6, 36, 36, 1),
};

MaterialColor colorVerdeOscuro = MaterialColor(0xff062424, color);

final ThemeData appThemeData = ThemeData(
  primaryColor: colorVerdeOscuro,
  primarySwatch: colorVerdeOscuro,
  visualDensity: VisualDensity.adaptivePlatformDensity,
);
