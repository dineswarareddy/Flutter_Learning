import 'package:flutter/material.dart';
import 'package:mealsapp/model/meals_model.dart';
import 'package:mealsapp/views/MealDetails/ingredients_list_view.dart';
import 'package:mealsapp/views/MealDetails/steps_view.dart';
import 'package:transparent_image/transparent_image.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({required this.favoriteToggled, required this.mealDetails, super.key});
  final Meal mealDetails;

  final Function(Meal meal) favoriteToggled;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mealDetails.title),
        actions: [
          IconButton(onPressed: () {
            favoriteToggled(mealDetails);
          }, icon: Icon(Icons.favorite)),
        ],
      ),
      body: 
      SingleChildScrollView(
      child: Column(
        spacing: 20,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FadeInImage(
            placeholder: MemoryImage(kTransparentImage), 
            image:NetworkImage(mealDetails.imageUrl),
            width: double.infinity,
            height: 250,
            fit: BoxFit.fill,
          ),
          IngredientsListView(ingredients: mealDetails.ingredients),
          StepView(steps: mealDetails.steps)
        ],
      ),
            ),
    );
  }
}
