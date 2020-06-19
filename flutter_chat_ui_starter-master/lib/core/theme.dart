import 'package:flutter/material.dart';

class ArchSampleTheme {
  static ThemeData get theme {
    final themeData = ThemeData.light();
    final textTheme = themeData.textTheme;
    final body1 = textTheme.body1.copyWith(decorationColor: Colors.transparent);

    return ThemeData.light().copyWith(
      primaryColor: Colors.purple[800],
      accentColor: Colors.purple[300],
      buttonColor: Colors.purple[800],
      textSelectionColor: Colors.purple[100],
      toggleableActiveColor: Colors.purple[300],
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.purple[300],
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: themeData.dialogBackgroundColor,
        contentTextStyle: body1,
        actionTextColor: Colors.purple[300],
      ),
      textTheme: textTheme.copyWith(
        body1: body1,
      ),
    );
  }
}