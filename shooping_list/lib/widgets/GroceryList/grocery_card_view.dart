import 'package:flutter/material.dart';
import 'package:shooping_list/modal/grocery_item.dart';

class GroceryCardView extends StatelessWidget {
  const GroceryCardView({required this.groceryItem, super.key});
  final GroceryItem groceryItem;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        spacing: 20,
        children: [
          SizedBox(height: 25,
          width: 25,
          child: DecoratedBox(decoration: BoxDecoration(color: groceryItem.category.themeColor)),),
          Text(groceryItem.name, style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.white)),
          Spacer(),
          Text('${groceryItem.quantity}'),
          ],
      ),
    );
  }
}
