import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';


const String fontFamilyApp = 'Cocon';
// Custom Text Styles Class For Both Dark and Light Theme
class CustomTextTheme {

  static const _textColorLight = Color(0xff0f0e17);
  static const _textColorDark = Color(0xFFFFFFFF);

  static TextTheme get textThemeLight {
    return _textTheme(textColor: _textColorLight);
  }

  static TextTheme get textThemeDark {
    return _textTheme(textColor: _textColorDark);
  }

  // Private Method For Text Theme so that we can change the vale for Both Dark And Light Theme
  static TextTheme _textTheme({required Color textColor}) {
    const FontWeight light = FontWeight.w200;
    const FontWeight medium = FontWeight.w500;
    const FontWeight regular = FontWeight.w400;

    return TextTheme(
      displayLarge: GoogleFonts.cairo(
        // fontFamily: fontFamilyApp,
        fontSize: 96,
        color: textColor,
        fontWeight: light,
        letterSpacing: -1.5,
      ),
      displayMedium: GoogleFonts.cairo(
        // fontFamily: fontFamilyApp,
        color: textColor,
        fontSize: 60,
        fontWeight: light,
        letterSpacing: -0.5,
      ),
      displaySmall: GoogleFonts.cairo(
        // fontFamily: fontFamilyApp,
        color: textColor,
        fontSize: 48,
        fontWeight: regular,
        letterSpacing: 0.0,
      ),
      headlineMedium: GoogleFonts.cairo(
        // fontFamily: fontFamilyApp,
        color: textColor,
        fontSize: 34,
        fontWeight: regular,
        letterSpacing: 0.25,
      ),
      headlineSmall: GoogleFonts.cairo(
        // fontFamily: fontFamilyApp,
        color: textColor,
        fontSize: 24,
        fontWeight: regular,
        letterSpacing: 0.0,
      ),
      titleLarge: GoogleFonts.cairo(
        // fontFamily: fontFamilyApp,
        color: textColor,
        fontSize: 20,
        fontWeight: medium,
        letterSpacing: 0.15,
      ),
      bodyLarge: GoogleFonts.cairo(
        // fontFamily: fontFamilyApp,
        color: textColor,
        fontSize: 16,
        fontWeight: regular,
        letterSpacing: 0.5,
      ),
      bodyMedium: GoogleFonts.cairo(
        // fontFamily: fontFamilyApp,
        color: textColor,
        fontSize: 14,
        fontWeight: regular,
        letterSpacing: 0.25,
      ),
      titleMedium: GoogleFonts.cairo(
        // fontFamily: fontFamilyApp,
        color: textColor,
        fontSize: 15,
        fontWeight: regular,
        letterSpacing: 0.5,
      ),
      titleSmall: GoogleFonts.cairo(
        // fontFamily: fontFamilyApp,
        color: textColor,
        fontSize: 14,
        fontWeight: regular,
        letterSpacing: 0.5,
      ),
      labelLarge: GoogleFonts.cairo(
        // fontFamily: fontFamilyApp,
        color: textColor,
        fontSize: 14,
        fontWeight: medium,
        letterSpacing: 1.25,
      ),
      bodySmall: GoogleFonts.cairo(
        // fontFamily: fontFamilyApp,
        color: textColor,
        fontSize: 12,
        fontWeight: regular,
        letterSpacing: 0.4,
      ),
      labelMedium: GoogleFonts.cairo(
        // fontFamily: fontFamilyApp,
        color: textColor,
        fontSize: 15,
        fontWeight: regular,
        letterSpacing: 0.5,
      ),
      labelSmall: GoogleFonts.cairo(
        // fontFamily: fontFamilyApp,
        color: textColor,
        fontSize: 10,
        fontWeight: regular,
        letterSpacing: 1.5,
      ),
    );
  }
}
