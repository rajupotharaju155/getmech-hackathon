import 'package:flutter/material.dart';

const primaryColor = Color(0xFFFCA311);
const primaryLightColor = Color(0xFFFDB849);
const secondaryColor = Color(0xFF14213D);
const kBackgroundColor = Color(0xFFE5E5E5);
const kDisabledColor = Color(0xFFA3A3A3);
const textPrimaryColor = Color(0xFF0F0F0F);
Map<int, Color> color = {
  50: Color.fromRGBO(252, 163, 17, .1),
  100: Color.fromRGBO(252, 163, 17, .2),
  200: Color.fromRGBO(252, 163, 17, .3),
  300: Color.fromRGBO(252, 163, 17, .4),
  400: Color.fromRGBO(252, 163, 17, .5),
  500: Color.fromRGBO(252, 163, 17, .6),
  600: Color.fromRGBO(252, 163, 17, .7),
  700: Color.fromRGBO(252, 163, 17, .8),
  800: Color.fromRGBO(252, 163, 17, .9),
  900: Color.fromRGBO(252, 163, 17, 1),
};

MaterialColor customAppPrimary = MaterialColor(0xFFFCA311, color);