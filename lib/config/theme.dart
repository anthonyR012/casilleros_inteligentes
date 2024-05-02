// contansts color
import 'package:flutter/material.dart';
const String gestorImageBase = "assets/gestorImages";
const String gestorJsonBase = "assets/json";
const Color backgroundColor = Color(0xFF1F1D2B);
const Color orangeColor = Color(0xFFFF6A64);
const Color whiteColor = Color(0xFFFFFFFF);
const Color blackColor = Color(0xFF1F1F1F);
const Color grayColor = Color(0xFF605F5F);
const LinearGradient gradient = LinearGradient(colors: [
  Color(0xFF28FF8B),
  Color(0xFF587DFF),
]);


const double h1Size = 34;
const double h2Size = 26;
const double h3Size = 17;
const double h4Size = 15;
const double h5Size = 11;
const double bodySize = 13;
const double messageSize = 15;
const double minimalMonserratSize = 12;
const double roundedMain = 10;



final _borderNoSelected = OutlineInputBorder(
    borderRadius: BorderRadius.circular(roundedMain),
    borderSide: const BorderSide(
      width: 1,
      style: BorderStyle.solid,
    ));

final _borderSelected = OutlineInputBorder(
    borderRadius: BorderRadius.circular(roundedMain),
    borderSide: const BorderSide(
      width: 1,
      style: BorderStyle.solid,
      color: whiteColor,
    ));

const _floatingLigth =
    FloatingActionButtonThemeData(backgroundColor: grayColor);

final _imputLigth = InputDecorationTheme(
  enabledBorder: _borderNoSelected,
  focusedBorder: _borderSelected,
  fillColor: grayColor,
  filled: true,
  contentPadding: const EdgeInsets.all(15),
  labelStyle: const TextStyle(color: whiteColor),
);

const _iconLigth = IconThemeData(color: orangeColor);
const _appBarLigth = AppBarTheme(
  color: whiteColor,
);

final _elevatedButton = ElevatedButtonThemeData(
  style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all(Colors.transparent),
    foregroundColor: MaterialStateProperty.all(whiteColor),
    textStyle: MaterialStateProperty.all(const TextStyle(fontSize: h3Size)),
  ),
);
// Theme ligth
final ligthTheme = ThemeData(
    appBarTheme: _appBarLigth,
    scaffoldBackgroundColor: backgroundColor,
    floatingActionButtonTheme: _floatingLigth,
    elevatedButtonTheme: _elevatedButton,
    inputDecorationTheme: _imputLigth,
    iconTheme: _iconLigth);
