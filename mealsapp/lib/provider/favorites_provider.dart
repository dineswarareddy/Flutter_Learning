import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealsapp/model/meals_model.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super([]);

  bool toggleMealsAsFavorite(Meal meal) {
    final isMealAlreadyFavorited = state.contains(meal);
    if(isMealAlreadyFavorited) {
      state = state.where((eachMeal) => eachMeal.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favoriteMealsProvider = StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) => 
  FavoriteMealsNotifier(),
);