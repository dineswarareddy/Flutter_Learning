import 'package:flutter/material.dart';
import 'package:mealsapp/model/meals_model.dart';
import 'package:mealsapp/views/MealDetails/meal_details_screen.dart';
import 'meals_card_view.dart';

class MealsScreen extends StatelessWidget {
  final String? screenTitle;
  final List<Meal> meals;
  final Function(Meal meal) favoriteToggled;
  const MealsScreen(
      {required this.favoriteToggled,
      required this.meals,
      this.screenTitle,
      super.key});

  navigateToMealsDetailsScreen(
      {required BuildContext context, required Meal mealToDisplay}) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctxt) => MealDetailsScreen(
            favoriteToggled: favoriteToggled, mealDetails: mealToDisplay),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (ctxt, index) => MealsListCardView(
          mealSelected: () {
            navigateToMealsDetailsScreen(
                context: context, mealToDisplay: meals[index]);
          },
          mealToDiplay: meals[index]),
    );

    if (meals.isEmpty) {
      content = Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('No meals under selected category',
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge
                    ?.copyWith(color: Theme.of(context).colorScheme.onSurface)),
            SizedBox(height: 15),
            Text(
              'try selecting another category',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Theme.of(context).colorScheme.onSurface),
            )
          ],
        ),
      );
    }

    // if screenTitle?.
    if (screenTitle == null) {
      return content;
    } else {
      return Scaffold(
          appBar: AppBar(
            title: Text(screenTitle ?? ""),
          ),
          body: content);
    }
  }
}
