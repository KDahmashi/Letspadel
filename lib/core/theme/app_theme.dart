import 'package:padel/core/theme/text_theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';


class AppTheme {

  ///----- Light theme data
  static const lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF1559C3),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFFD9E2FF),
    onPrimaryContainer: Color(0xFF001944),
    secondary: Color(0xFFBB1900),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFFFDAD3),
    onSecondaryContainer: Color(0xFF3F0300),
    tertiary: Color(0xFF1559C3),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFFD9E2FF),
    onTertiaryContainer: Color(0xFF001944),
    error: Color(0xFFBA1A1A),
    errorContainer: Color(0xFFFFDAD6),
    onError: Color(0xFFFFFFFF),
    onErrorContainer: Color(0xFF410002),
    surface: Color(0xFFFFFFFF),
    onSurface: Color(0xFF001F25),
    surfaceContainerHighest: Color(0xFFE1E2EC),
    onSurfaceVariant: Color(0xFF44464F),
    outline: Color(0xFF757780),
    onInverseSurface: Color(0xFFD6F6FF),
    inverseSurface: Color(0xFF00363F),
    inversePrimary: Color(0xFFB0C6FF),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFF1559C3),
    outlineVariant: Color(0xFFC5C6D0),
    scrim: Color(0xFF000000),

  );

  ///----- Light theme data
  static final ThemeData customLightTheme = ThemeData.light(useMaterial3: true).copyWith(
    primaryColor: lightColorScheme.primary,
    colorScheme: lightColorScheme,
    dialogBackgroundColor: lightColorScheme.surface,
    dialogTheme: DialogTheme(
      backgroundColor: lightColorScheme.surface,
    ),
    timePickerTheme: TimePickerThemeData(
      backgroundColor: lightColorScheme.surface,
      dialBackgroundColor: lightColorScheme.primary,
      hourMinuteColor: lightColorScheme.primary,
      hourMinuteTextColor: lightColorScheme.primary,
      dayPeriodTextColor: lightColorScheme.primary,
      dayPeriodColor: lightColorScheme.primary,
      dialHandColor: lightColorScheme.primary,
      dialTextColor: lightColorScheme.primary,
      helpTextStyle: TextStyle(
        color: lightColorScheme.primary,
        fontSize: 14,
      ),
      hourMinuteTextStyle: TextStyle(
        color: lightColorScheme.primary,
        fontSize: 20,
      ),
      // dayPeriodTextStyle: TextStyle(
      //   color: lightColorScheme.primary,
      //   fontSize: 20,
      // ),
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: lightColorScheme.primary,
      // contentTextStyle: GoogleFonts.roboto(
      //   fontWeight: FontWeight.w400,
      //   color: lightColorScheme.background,
      //   letterSpacing: 0.5,
      //   fontSize: 14,
      // ),
      actionTextColor: lightColorScheme.onPrimary,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: lightColorScheme.surface,
      centerTitle: true,
      elevation: 2,
      shadowColor: lightColorScheme.primary,
      titleTextStyle: GoogleFonts.roboto(
        color: lightColorScheme.primary,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(
        color: lightColorScheme.primary,
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: lightColorScheme.primary,
    ),
    cardTheme: CardTheme(
      color: lightColorScheme.surface,
    ),
    textTheme: CustomTextTheme.textThemeLight,
    primaryTextTheme: CustomTextTheme.textThemeLight,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: lightColorScheme.surface,
      selectedItemColor: lightColorScheme.primary,
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: lightColorScheme.primary,
      selectionColor: lightColorScheme.primary,
      selectionHandleColor: lightColorScheme.primary,
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
      labelStyle: GoogleFonts.roboto(
        fontWeight: FontWeight.w400,
        color: lightColorScheme.primary,
        letterSpacing: 0.5,
        fontSize: 14,
      ),
      focusColor: lightColorScheme.primary,
      fillColor: lightColorScheme.surface,
      filled: true,
      suffixIconColor: lightColorScheme.primary,
      suffixStyle: CustomTextTheme.textThemeLight.titleSmall,
      hintStyle: GoogleFonts.roboto(
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
        color: lightColorScheme.outline,
        fontSize: 14,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: lightColorScheme.primary,
          width: 1.0,
        ),
      ),
    ),
    scaffoldBackgroundColor: lightColorScheme.surface,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(lightColorScheme.primary),
        foregroundColor: WidgetStateProperty.all<Color>(lightColorScheme.surface),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
      ),
    ),
  );




  ///----- Dark theme data
  static const darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    // primary: Color(0xFFB0C6FF),
    // onPrimary: Color(0xFF002D6E),
    primary: Color(0xFF002D6E),
    onPrimary: Color(0xFFB0C6FF),
    primaryContainer: Color(0xFF00429B),
    onPrimaryContainer: Color(0xFFD9E2FF),
    secondary: Color(0xFFFFB4A6),
    onSecondary: Color(0xFF660900),
    secondaryContainer: Color(0xFF8F1100),
    onSecondaryContainer: Color(0xFFFFDAD3),
    tertiary: Color(0xFFB0C6FF),
    onTertiary: Color(0xFF002D6E),
    tertiaryContainer: Color(0xFF00429B),
    onTertiaryContainer: Color(0xFFD9E2FF),
    error: Color(0xFFFFB4AB),
    errorContainer: Color(0xFF93000A),
    onError: Color(0xFF690005),
    onErrorContainer: Color(0xFFFFDAD6),
    surface: Color(0xFFD9E2FF),
    onSurface: Color(0xFFA6EEFF),
    surfaceContainerHighest: Color(0xFF44464F),
    onSurfaceVariant: Color(0xFFC5C6D0),
    outline: Color(0xFF8F9099),
    onInverseSurface: Color(0xFF001F25),
    inverseSurface: Color(0xFFA6EEFF),
    inversePrimary: Color(0xFF1559C3),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFFB0C6FF),
    outlineVariant: Color(0xFF44464F),
    scrim: Color(0xFF000000),
  );

  ///----- Dark theme data
  static final ThemeData customDarkTheme = ThemeData.dark(useMaterial3: true).copyWith(
    primaryColor: darkColorScheme.primary,
    colorScheme: darkColorScheme,
    dialogBackgroundColor: darkColorScheme.surface,
    dialogTheme: DialogTheme(
      backgroundColor: darkColorScheme.surface,
    ),
    timePickerTheme: TimePickerThemeData(
      // backgroundColor: darkColorScheme.surface,
      dialBackgroundColor: darkColorScheme.primary,
      timeSelectorSeparatorColor: WidgetStatePropertyAll(darkColorScheme.primary),
      backgroundColor: darkColorScheme.primary,
      hourMinuteColor: darkColorScheme.primary,
      hourMinuteTextColor: darkColorScheme.primary,
      dayPeriodTextColor: darkColorScheme.primary,
      dayPeriodColor: darkColorScheme.primary,
      dialHandColor: darkColorScheme.primary,
      dialTextColor: darkColorScheme.primary,
      helpTextStyle: TextStyle(
        color: darkColorScheme.primary,
        fontSize: 14,
      ),
      hourMinuteTextStyle: TextStyle(
        color: darkColorScheme.primary,
        fontSize: 20,
      ),
      // dayPeriodTextStyle: TextStyle(
      //   color: lightColorScheme.primary,
      //   fontSize: 20,
      // ),
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: darkColorScheme.primary,
      // contentTextStyle: GoogleFonts.roboto(
      //   fontWeight: FontWeight.w400,
      //   color: darkColorScheme.background,
      //   letterSpacing: 0.5,
      //   fontSize: 14,
      // ),
      actionTextColor: darkColorScheme.onPrimary,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: darkColorScheme.primary,
      centerTitle: true,
      elevation: 2,
      shadowColor: darkColorScheme.primary,
      titleTextStyle: GoogleFonts.roboto(
        color: darkColorScheme.primary,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(
        color: lightColorScheme.onPrimary,
      ),
    ),
    cardTheme: CardTheme(
      color: darkColorScheme.surface,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: darkColorScheme.primary,
    ),
    textTheme: CustomTextTheme.textThemeDark,
    primaryTextTheme: CustomTextTheme.textThemeDark,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: darkColorScheme.primary,
      selectedItemColor: darkColorScheme.onPrimary,
      unselectedItemColor: darkColorScheme.onPrimary.withOpacity(0.5),
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: darkColorScheme.primary,
      selectionColor: darkColorScheme.primary,
      selectionHandleColor: darkColorScheme.primary,
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
      labelStyle: GoogleFonts.roboto(
        fontWeight: FontWeight.w400,
        color: darkColorScheme.primary,
        letterSpacing: 0.5,
        fontSize: 14,
      ),
      helperStyle: GoogleFonts.roboto(
        fontWeight: FontWeight.w400,
        color: darkColorScheme.primary,
        letterSpacing: 0.5,
        fontSize: 14,
      ),
      prefixStyle: GoogleFonts.roboto(
        fontWeight: FontWeight.w400,
        color: darkColorScheme.primary,
        letterSpacing: 0.5,
        fontSize: 14,
      ),
      focusColor: darkColorScheme.primary,
      fillColor: darkColorScheme.surface,
      filled: true,
      suffixIconColor: darkColorScheme.primary,
      suffixStyle: CustomTextTheme.textThemeLight.titleSmall,
      hintStyle: GoogleFonts.roboto(
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
        color: darkColorScheme.primary,
        fontSize: 14,
      ),
      counterStyle: GoogleFonts.roboto(
        fontWeight: FontWeight.w400,
        color: darkColorScheme.primary,
        letterSpacing: 0.5,
        fontSize: 14,
      ),
      prefixIconColor: darkColorScheme.onPrimary,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: darkColorScheme.primary,
          width: 1.0,
        ),
      ),
    ),
    scaffoldBackgroundColor: darkColorScheme.surface,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(darkColorScheme.primary),
        foregroundColor: WidgetStateProperty.all<Color>(darkColorScheme.surface),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
      ),
    ),
  );


}



