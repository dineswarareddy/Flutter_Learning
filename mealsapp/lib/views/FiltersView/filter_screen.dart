import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealsapp/provider/filter_provider.dart';
// import 'package:mealsapp/views/CategoryViews/categories.dart';
// import 'package:mealsapp/views/Drawer/main_drawer.dart';
// import 'package:mealsapp/views/home_tabbar_view.dart';
import 'package:riverpod/riverpod.dart';

class FilterScreen extends ConsumerWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
 final activeFilters = ref.watch(filterProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
      ),

      body: Column(
          children: [
            // for (var eachFilter in filterItems)
            SwitchListTile(
              value: activeFilters[FoodType.glutenFree] ?? false,
              onChanged: (changed) {
                ref.read(filterProvider.notifier).
                toggleFilter(type: FoodType.glutenFree, isActive: changed);
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
              contentPadding: EdgeInsets.symmetric(horizontal: 25),
            ),
            SwitchListTile(
              value: activeFilters[FoodType.lactoseFree] ?? false,
              onChanged: (changed) {
                ref.read(filterProvider.notifier).
                toggleFilter(type: FoodType.lactoseFree, isActive: changed);
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
              contentPadding: EdgeInsets.symmetric(horizontal: 25),
            ),
            SwitchListTile(
              value: activeFilters[FoodType.vegetarian] ?? false,
              onChanged: (changed) {
                ref.read(filterProvider.notifier).
                toggleFilter(type: FoodType.vegetarian, isActive: changed);
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
              contentPadding: EdgeInsets.symmetric(horizontal: 25),
            ),
            SwitchListTile(
              value: activeFilters[FoodType.vegan] ?? false,
              onChanged: (changed) {
                ref.read(filterProvider.notifier).
                toggleFilter(type: FoodType.vegan, isActive: changed);
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
              contentPadding: EdgeInsets.symmetric(horizontal: 25),
            )
          ],
        ),
      );
  }
}
