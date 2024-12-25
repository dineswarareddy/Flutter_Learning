import 'package:flutter/material.dart';

class IngredientsListView extends StatelessWidget {
  const IngredientsListView({required this.ingredients, super.key});

  final List<String> ingredients;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(spacing: 20, 
      children: [
        Text(
          'Ingredients',
          style: TextStyle(
              color: const Color.fromARGB(255, 248, 151, 32),
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
        Column(
          children: <Widget>[
            for (var ingredient in ingredients)
              Text(
                ingredient,
                style: TextStyle(color: Colors.white),
              ),
          ],
        )
      ]),
    );
  }
}
