import 'package:flutter/material.dart';
import 'widgets/expences/expences.dart';


var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 109, 69, 204)
  );

void main() {
  runApp(MaterialApp(
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
