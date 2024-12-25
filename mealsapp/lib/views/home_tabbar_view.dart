import 'package:flutter/material.dart';
import 'package:mealsapp/main.dart';
import 'package:mealsapp/model/meals_model.dart';
import 'package:mealsapp/views/Drawer/main_drawer.dart';
import 'package:mealsapp/views/MealsViews/meals_screen.dart';
import 'CategoryViews/categories.dart';

class HomeTabbarView extends StatefulWidget {
  const HomeTabbarView({super.key});

  @override
  State<HomeTabbarView> createState() {
    return _HomeTabbarViewState();
  }
}

class _HomeTabbarViewState extends State<HomeTabbarView> {
  String pageTitle = 'Categories';
  int currentTabIndex = 0;
  Widget? currentScreen;
  List<Meal> favorites = [];
  void manageFavorites(Meal meal) {
    print('manage favorites called');
    setState(() {
      if (favorites.contains(meal)) {
        favorites.remove(meal);
        showInfoMessage(false);
      } else {
        favorites.add(meal);
        showInfoMessage(true);
      }
    });
  }

  void showInfoMessage(bool isItemAdded) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(isItemAdded ? 'Favorites Added' : 'Favorites Removed')));
  }

  @override
  Widget build(BuildContext context) {
    currentScreen = CategoriesScreen(favoriteToggled: (mealItem) {
      manageFavorites(mealItem);
    });

    if (currentTabIndex == 0) {
      pageTitle = 'Categories';
      currentScreen = CategoriesScreen(favoriteToggled: (mealItem) {
        manageFavorites(mealItem);
      });
    } else {
      pageTitle = 'Favorites';
      currentScreen = MealsScreen(
          favoriteToggled: (mealItem) {
            manageFavorites(mealItem);
          },
          meals: favorites);
    }

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: MainDrawer(),
        appBar: AppBar(title: Text(pageTitle)),
        body: currentScreen,
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentTabIndex,
            onTap: (index) {
              setState(() {
                currentTabIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.set_meal), label: 'Categories'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.star), label: 'Favorites')
            ]),
      ),
    );
  }
}
