import 'package:flutter/material.dart';
import 'package:mealsapp/data/dymmy_data.dart';
import 'package:mealsapp/main.dart';
import 'package:mealsapp/model/meals_model.dart';
import 'package:mealsapp/views/Drawer/main_drawer.dart';
import 'package:mealsapp/views/FiltersView/filter_screen.dart';
import 'package:mealsapp/views/MealsViews/meals_screen.dart';
import 'CategoryViews/categories.dart';

  const kInitialFilters = {
    foodTypes.glutenFree: false,
    foodTypes.lactoseFree: false,
    foodTypes.vegan: false,
    foodTypes.vegetarian: false
  };

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


  Map<foodTypes, bool> filtersSelected = kInitialFilters;

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

  menuSelected(String selectedScrenName) async {
    if (selectedScrenName == 'filter') {
      final result = await Navigator.of(context).push<Map<foodTypes, bool>>(
        MaterialPageRoute(
          builder: (ctxt) => FilterScreen(currentFilter: filtersSelected),
        ),
      );
      setState(() {
          filtersSelected = result ?? kInitialFilters;
      });
      print('value receied post pop back $result');
    }
  }

   List<Meal> filterMealsBasedOnfilter() {
    final availabeMeals = dummyMeals.where((item) { 
      if(filtersSelected[foodTypes.glutenFree]! && !item.isGlutenFree) {
        return false;
      }
      if(filtersSelected[foodTypes.lactoseFree]! && !item.isLactoseFree) {
        return false;
      }
      if(filtersSelected[foodTypes.vegetarian]! && !item.isVegetarian) {
        return false;
      }
      if(filtersSelected[foodTypes.vegan]! && !item.isVegan) {
        return false;
      }
      return true;
    }).toList();
    return availabeMeals;
  }

  @override
  Widget build(BuildContext context) {

    final filterMeals = filterMealsBasedOnfilter();

    currentScreen = CategoriesScreen(mealsListPostFilter: filterMeals,
     favoriteToggled: (mealItem) {
      manageFavorites(mealItem);
    });

    if (currentTabIndex == 0) {
      pageTitle = 'Categories';
      currentScreen = CategoriesScreen(mealsListPostFilter: filterMeals,
       favoriteToggled: (mealItem) {
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
        drawer: MainDrawer(menuSelected: menuSelected),
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
