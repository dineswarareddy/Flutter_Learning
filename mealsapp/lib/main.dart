import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
// import 'package:mealsapp/data/dymmy_data.dart';
// import 'package:mealsapp/views/CategoryViews/categories.dart';
import 'package:mealsapp/views/home_tabbar_view.dart';
// import 'package:mealsapp/views/MealsViews/meals_screen.dart';
// import 'package:mealsapp/model/meals_model.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 131, 57, 0),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home:  HomeTabbarView(), 
    );
  }
}