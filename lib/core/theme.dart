// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color kcPrimary = Color(0xFF1D2733);
const Color kcDarkPrimary = Color(0xFF0F1620);
const Color kcLightPrimary = Color(0xFF1D2733);
const Color kcDarkGrey = Color(0xFF3F4751);
const Color kcDarkGreyLight = Color(0xC8CFD1D4);
const Color kcBlue = Color(0xFF4CB0FA);

const Color kcWhite = Color(0xFFFFFFFF);
const Color kcGreen = Color(0xFF4CAF50);
const Color kcRed = Color(0xFFE57373);
const Color kcBlack = Color(0xFF000000);

ThemeData theme(BuildContext context) => Theme.of(context);

class AppTheme {
  static ThemeData get theme => ThemeData(
        scaffoldBackgroundColor: kcDarkPrimary,
        useMaterial3: true,
        fontFamily: GoogleFonts.roboto().fontFamily,
        radioTheme: RadioThemeData(
          fillColor: WidgetStateProperty.all(kcPrimary),
        ),
        primaryColor: kcPrimary,
        primarySwatch: _lightMaterialColor,
        dialogTheme: const DialogTheme(surfaceTintColor: kcDarkPrimary, backgroundColor: kcDarkPrimary),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: _lightMaterialColor,
          accentColor: kcPrimary,
          backgroundColor: kcWhite,
          brightness: Brightness.dark,
        ),
        highlightColor: Colors.transparent,
        brightness: Brightness.dark,
        indicatorColor: kcBlue,
      );

  // for primary material colors
  static MaterialColor get _lightMaterialColor => MaterialColor(
        kcPrimary.value,
        const <int, Color>{
          50: kcPrimary,
          100: kcPrimary,
          200: kcPrimary,
          300: kcPrimary,
          400: kcPrimary,
          500: kcPrimary,
          600: kcPrimary,
          700: kcPrimary,
          800: kcPrimary,
          900: kcPrimary,
        },
      );
}
