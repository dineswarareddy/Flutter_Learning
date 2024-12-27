import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shooping_list/modal/grocery_item.dart';
// import 'package:shooping_list/data/dummy_items.dart';

class GroceryItemsNotifier extends StateNotifier<List<GroceryItem>> {
  GroceryItemsNotifier() : super([]);

  void addItem(GroceryItem grocery) {
    state = [...state, grocery];
  }

  void removeItem(GroceryItem grocery) {
    state = state.where((item) {
      return item.id != grocery.id;
    }).toList(); 
  }
}

final groceryItemsProvider = StateNotifierProvider<GroceryItemsNotifier, List<GroceryItem>>((ref) =>
 GroceryItemsNotifier()
 );
