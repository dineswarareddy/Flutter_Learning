import 'package:flutter/material.dart';
import 'widgets/expences/expences.dart';


var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 109, 69, 204)
);

var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 35, 35, 35)
  );

void main() {
  runApp(MaterialApp(
    darkTheme: ThemeData.dark().copyWith(
      colorScheme: kDarkColorScheme,
      appBarTheme: const AppBarTheme().copyWith(
        foregroundColor: kDarkColorScheme.onPrimaryContainer,
        backgroundColor: kDarkColorScheme.primary,
      ),
      cardTheme: CardTheme().copyWith(
        color: kDarkColorScheme.secondary,
      ),
    ),
    theme: ThemeData().copyWith(
      colorScheme: kColorScheme,
      appBarTheme: const AppBarTheme().copyWith(
        foregroundColor: kColorScheme.onPrimaryContainer,
        backgroundColor: kColorScheme.primary,
      ),
      cardTheme: CardTheme().copyWith(
        color: kColorScheme.secondary,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: kColorScheme.primaryContainer
        )
      )
    ),
    home: Expences(),
  ),
  );
}
