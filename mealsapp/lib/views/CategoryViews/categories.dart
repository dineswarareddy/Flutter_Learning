// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mealsapp/data/dymmy_data.dart';
import 'package:mealsapp/views/CategoryViews/category_card.dart';
import 'package:mealsapp/model/category_model.dart';
import 'package:mealsapp/model/meals_model.dart';
import '../MealsViews/meals_screen.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({required this.mealsListPostFilter, required this.favoriteToggled, super.key});

  final List<Meal> mealsListPostFilter;
  final Function(Meal meal) favoriteToggled;
  itemTappedTarget(
      {required Category category, required BuildContext context}) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          favoriteToggled: favoriteToggled,
            meals: getMealsForCategory(category.id),
            screenTitle: category.title),
      ),
    );
  }

  List<Meal> getMealsForCategory(String categoryId) {
    return mealsListPostFilter
        .where((item) => item.categories.contains(categoryId))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    print('available categories count: ${availableCategories.length}');
    return Scaffold(
      body: GridView.builder(
        padding: EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 1.5),
        itemCount: availableCategories.length,
        itemBuilder: (ctx, index) => CategoryGripViewCard(
            itemTapped: () {
              itemTappedTarget(
                  category: availableCategories[index], context: context);
            },
            categoryItem: availableCategories[index]),
      ),
    );
  }
}
