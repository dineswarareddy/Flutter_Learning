import 'package:flutter/material.dart';
// import 'package:mealsapp/data/dymmy_data.dart';
// import 'package:mealsapp/main.dart';
import 'package:mealsapp/model/meals_model.dart';
import 'package:mealsapp/provider/favorites_provider.dart';
import 'package:mealsapp/views/Drawer/main_drawer.dart';
import 'package:mealsapp/views/FiltersView/filter_screen.dart';
import 'package:mealsapp/views/MealsViews/meals_screen.dart';
import 'CategoryViews/categories.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealsapp/provider/meals_provider.dart';
import 'package:mealsapp/provider/filter_provider.dart';

  const kInitialFilters = {
    FoodType.glutenFree: false,
    FoodType.lactoseFree: false,
    FoodType.vegan: false,
    FoodType.vegetarian: false
  };

class HomeTabbarView extends ConsumerStatefulWidget {
  const HomeTabbarView({super.key});

  @override
  ConsumerState<HomeTabbarView> createState() {
    return _HomeTabbarViewState();
  }
}

class _HomeTabbarViewState extends ConsumerState<HomeTabbarView> {
  String pageTitle = 'Categories';
  int currentTabIndex = 0;
  Widget? currentScreen;


  // void manageFavorites(Meal meal) {
  //   print('manage favorites called');
  //   setState(() {
  //     if (favorites.contains(meal)) {
  //       favorites.remove(meal);
  //       showInfoMessage(false);
  //     } else {
  //       favorites.add(meal);
  //       showInfoMessage(true);
  //     }
  //   });
  // }

  void showInfoMessage(bool isItemAdded) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(isItemAdded ? 'Favorites Added' : 'Favorites Removed')));
  }

  menuSelected(String selectedScrenName) async {
    if (selectedScrenName == 'filter') {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => FilterScreen(),),);
    }
  }

   List<Meal> filterMealsBasedOnfilter() {
    return ref.watch(filterMealsProvider);
  }

  @override
  Widget build(BuildContext context) {

    final filterMeals = filterMealsBasedOnfilter();

    currentScreen = CategoriesScreen(mealsListPostFilter: filterMeals);

    if (currentTabIndex == 0) {
      pageTitle = 'Categories';
      currentScreen = CategoriesScreen(mealsListPostFilter: filterMeals);
    } else {
      pageTitle = 'Favorites';
      final favoriteMeals = ref.watch(favoriteMealsProvider);
      currentScreen = MealsScreen(
          meals: favoriteMeals);
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
