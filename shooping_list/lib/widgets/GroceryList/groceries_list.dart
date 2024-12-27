import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shooping_list/provider/grocery_items_provider.dart';
// import 'grocery_card_view.dart';
import 'package:shooping_list/widgets/AddGroceries/add_grocery_screen.dart';

class GroceriesList extends ConsumerWidget {
  const GroceriesList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groceryList = ref.watch(groceryItemsProvider);
    Widget contentToDisplay = Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Add items to the list by tapping \'+\'',
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
    if (groceryList.isNotEmpty) {
      contentToDisplay = ListView.builder(
        itemCount: groceryList.length,
        itemBuilder: (ctxt, index) => Dismissible(
          key: ValueKey(groceryList[index].id),
          child: ListTile(
            leading: Container(
              height: 24,
              width: 24,
              color: groceryList[index].category.themeColor,
            ),
            title: Text(groceryList[index].name),
            trailing: Text('${groceryList[index].quantity}'),
          ),
          onDismissed: (direction) {
            ref
                .read(groceryItemsProvider.notifier)
                .removeItem(groceryList[index]);
          },
          //  GroceryCardView(groceryItem: groceryList[index])
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Groceries'),
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (ctxt) => AddGroceryScreen()),
                );
              }),
        ],
      ),
      body: contentToDisplay,
    );
  }
}
