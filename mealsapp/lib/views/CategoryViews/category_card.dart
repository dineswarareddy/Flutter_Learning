import 'package:flutter/material.dart';
import 'package:mealsapp/model/category_model.dart';

class CategoryGripViewCard extends StatelessWidget {
  const CategoryGripViewCard({
    required this.itemTapped, 
    required this.categoryItem, 
    super.key});
  final void Function() itemTapped;
  final Category categoryItem;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('item tapped');
        itemTapped();
      },
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          gradient: LinearGradient(
            colors: [
              categoryItem.color.withValues(alpha: 0.5),
              categoryItem.color.withValues(alpha: 1),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: 
        Padding(
          padding: EdgeInsets.all(16),
          child: 
        Text(categoryItem.title, 
          style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Theme.of(context).colorScheme.onSurface)
      ),
        )
      ),
    );
  }
}
