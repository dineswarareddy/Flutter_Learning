import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({required this.menuSelected, super.key});

  final Function(String) menuSelected;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primaryContainer,
                  Theme.of(context)
                      .colorScheme
                      .primaryContainer
                      .withValues(alpha: 0.5),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(spacing: 20, children: [
              Icon(Icons.fastfood,
                  color: Theme.of(context).colorScheme.primary),
              Text('Cooking Up!',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Theme.of(context).colorScheme.primary)),
            ]),
          ),
          ListTile(
            leading: Icon(Icons.restaurant, size: 25, color: Theme.of(context).colorScheme.primary),
            title: Text('Meals', style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.pop(context);
              menuSelected('meals');
            },
          ),
          ListTile(
            leading: Icon(Icons.settings, size: 25, color: Theme.of(context).colorScheme.primary),
            title: Text('Filter', style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.pop(context);
              menuSelected('filter');
            },
          )
        ],
      ),
    );
  }
}
