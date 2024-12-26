import 'package:flutter/material.dart';
// import 'package:mealsapp/views/CategoryViews/categories.dart';
// import 'package:mealsapp/views/Drawer/main_drawer.dart';
// import 'package:mealsapp/views/home_tabbar_view.dart';

enum foodTypes {
  glutenFree, lactoseFree, vegetarian, vegan
}

class FilterScreen extends StatefulWidget {
  const FilterScreen({required this.currentFilter, super.key});

  final Map<foodTypes, bool> currentFilter;

  @override
  State<FilterScreen> createState() {
    return FilterScreenState();
  }
}

class FilterScreenState extends State<FilterScreen> {
  var glutenFreeEnabled = false;
  var lactoseFreeEnabled = false;
  var vegetarianEnabled = false;
  var veganEnabled = false;

  @override
  void initState() {
    glutenFreeEnabled = widget.currentFilter[foodTypes.glutenFree] ?? false;
    lactoseFreeEnabled = widget.currentFilter[foodTypes.lactoseFree] ?? false;
    vegetarianEnabled = widget.currentFilter[foodTypes.vegetarian] ?? false;
    veganEnabled = widget.currentFilter[foodTypes.vegan] ?? false;
    super.initState();
  }

  glutenFreeChecked(bool switchChecked) {
    setState(() {
      glutenFreeEnabled = switchChecked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
      ),
      // drawer: MainDrawer(menuSelected: (selected){
      //   if(selected == 'meals') {
      //     Navigator.of(context).push(MaterialPageRoute(builder: (ctxt) => HomeTabbarView()))
      //   }
      // }),
      body: 
      PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          if(didPop) return;
            Navigator.of(context).pop({
              foodTypes.glutenFree: glutenFreeEnabled,
              foodTypes.lactoseFree: lactoseFreeEnabled,
              foodTypes.vegan: veganEnabled,
              foodTypes.vegetarian: vegetarianEnabled
            });
        },
        child: Column(
          children: [
            // for (var eachFilter in filterItems)
              SwitchListTile(
                value: glutenFreeEnabled,
                onChanged: (changed) {
                  setState(() {
                    glutenFreeEnabled = changed;
                  });
                },
                title: Text(
                  'Gluten-free',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: Theme.of(context).colorScheme.primary),
                ),
                subtitle: Text(
                  'Only includes gluten-free meals',
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: Theme.of(context).colorScheme.primaryContainer),
                ),
                activeColor: Theme.of(context).colorScheme.tertiary,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 25),
              ),
              SwitchListTile(
                value: lactoseFreeEnabled,
                onChanged: (changed) {
                  setState(() {
                    lactoseFreeEnabled = changed;
                  });
                },
                title: Text(
                  'Lactose-free',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: Theme.of(context).colorScheme.primary),
                ),
                subtitle: Text(
                  'Only includes lactose-free meals',
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: Theme.of(context).colorScheme.primaryContainer),
                ),
                activeColor: Theme.of(context).colorScheme.tertiary,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 25),
              ),
              SwitchListTile(
                value: vegetarianEnabled,
                onChanged: (changed) {
                  setState(() {
                    vegetarianEnabled = changed;
                  });
                },
                title: Text(
                  'Vegetarian',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: Theme.of(context).colorScheme.primary),
                ),
                subtitle: Text(
                  'Only includes vegetarian meals',
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: Theme.of(context).colorScheme.primaryContainer),
                ),
                activeColor: Theme.of(context).colorScheme.tertiary,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 25),
              ),
              SwitchListTile(
                value: veganEnabled,
                onChanged: (changed) {
                  setState(() {
                    veganEnabled = changed;
                  });
                },
                title: Text(
                  'Vegan',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: Theme.of(context).colorScheme.primary),
                ),
                subtitle: Text(
                  'Only includes vegan meals',
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: Theme.of(context).colorScheme.primaryContainer),
                ),
                activeColor: Theme.of(context).colorScheme.tertiary,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 25),
              )
          ],
        ),
      ),
    );
  }
}
