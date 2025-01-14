import 'package:flutter/material.dart';
import 'package:mealsapp/model/meals_model.dart';
import 'package:mealsapp/views/MealDetails/ingredients_list_view.dart';
import 'package:mealsapp/views/MealDetails/steps_view.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealsapp/provider/favorites_provider.dart';

class MealDetailsScreen extends ConsumerWidget {
  MealDetailsScreen({required this.mealDetails, super.key});
  final Meal mealDetails;
  bool isItemAdded = false;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    showFavoriteModificationMessage() {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content:
              Text(isItemAdded ? 'Favorites Added' : 'Favorites Removed')));
    }

    final favorites = ref.watch(favoriteMealsProvider);
    final isFavorite = favorites.contains(mealDetails);
    return Scaffold(
      appBar: AppBar(
        title: Text(mealDetails.title),
        actions: [
          IconButton(
            onPressed: () {
              isItemAdded = ref
                  .read(favoriteMealsProvider.notifier)
                  .toggleMealsAsFavorite(mealDetails);
              showFavoriteModificationMessage();
            },
            icon: AnimatedSwitcher(
              duration: Duration(milliseconds: 500),
              transitionBuilder: (child, animation) {
                return RotationTransition(turns: animation, child: child);
              },
              child: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border_sharp,
                  key: ValueKey(isFavorite)),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Hero(
              tag: mealDetails.id,
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(mealDetails.imageUrl),
                width: double.infinity,
                height: 250,
                fit: BoxFit.fill,
              ),
            ),
            IngredientsListView(ingredients: mealDetails.ingredients),
            StepView(steps: mealDetails.steps)
          ],
        ),
      ),
    );
  }
}
