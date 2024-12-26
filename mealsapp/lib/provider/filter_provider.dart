import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealsapp/provider/meals_provider.dart';

enum FoodType {
  glutenFree, lactoseFree, vegetarian, vegan
}

class FilterNotifier extends StateNotifier<Map<FoodType, bool>> {
  FilterNotifier() : super({
    FoodType.glutenFree: false,
    FoodType.lactoseFree: false,
    FoodType.vegetarian: false,
    FoodType.vegan: false
  });

  toggleFilter({required FoodType type, required bool isActive}) {
    state = {...state, type: isActive};
  }

  setAllFilter(Map<FoodType, bool> filters) {
    state = filters;
  }
}

final filterProvider = StateNotifierProvider<FilterNotifier, Map<FoodType, bool>>((ref) => FilterNotifier());

final filterMealsProvider = Provider((ref) {
  final dummyMealList = ref.watch(mealsProvider);
  final filtersSelected = ref.watch(filterProvider);
  return dummyMealList.where((item) { 
      if(filtersSelected[FoodType.glutenFree]! && !item.isGlutenFree) {
        return false;
      }
      if(filtersSelected[FoodType.lactoseFree]! && !item.isLactoseFree) {
        return false;
      }
      if(filtersSelected[FoodType.vegetarian]! && !item.isVegetarian) {
        return false;
      }
      if(filtersSelected[FoodType.vegan]! && !item.isVegan) {
        return false;
      }
      return true;
    }).toList();
});