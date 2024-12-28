import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shooping_list/data/categories.dart';
import 'package:shooping_list/modal/category.dart';
import 'package:shooping_list/modal/grocery_item.dart';
import 'package:shooping_list/provider/grocery_items_provider.dart';
import 'package:http/http.dart' as http;

class AddGroceryScreen extends ConsumerWidget {
  final TextEditingController nameTextEditController = TextEditingController();
  final TextEditingController quantityTextEditController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String _enteredItemName = '';
  int _enteredQuantity = 1;
  Category? selectedCategory = categories[Categories.vegetables];

  AddGroceryScreen({super.key});

  void validateInputs(BuildContext context, WidgetRef ref) {
    if (_formKey.currentState!.validate()) {
      print('validation success');
      _formKey.currentState!.save();
      final groceryItemToAdd = GroceryItem(
        id: DateTime.now().toString(),
        name: _enteredItemName,
        quantity: _enteredQuantity,
        category: selectedCategory!,
      );
      ref.read(groceryItemsProvider.notifier).addItem(groceryItemToAdd);
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Item added to list'),
        ),
      );
    } else {
      print('validation failed');
    }
  }

  void resetInputs() {
    _formKey.currentState!.reset();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    fetchUsers();
    return Scaffold(
      appBar: AppBar(title: Text('Add Item')),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: 12,
            children: [
              TextFormField(
                maxLength: 50,
                decoration: InputDecoration(labelText: 'Enter name'),
                controller: nameTextEditController,
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value.trim().length < 2) {
                    return 'Name required';
                  } else {
                    return null;
                  }
                },
                onSaved: (newValue) {
                  _enteredItemName = newValue!;
                },
              ),
              Row(spacing: 16, children: [
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: 'Enter Quantity'),
                    // controller: quantityTextEditController,
                    initialValue: _enteredQuantity.toString(),
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          int.tryParse(value) == null) {
                        return 'Enter Quantity';
                      }
                      return null;
                    },
                    onSaved: (newValue) {
                      _enteredQuantity = int.tryParse(newValue!) ?? 1;
                    },
                  ),
                ),
                Expanded(
                  child: DropdownButtonFormField(
                      value: selectedCategory,
                      items: categories.entries
                          .map(
                            (category) => DropdownMenuItem(
                              value: category.value,
                              child: Row(spacing: 8, children: [
                                Container(
                                    width: 16,
                                    height: 16,
                                    color: category.value.themeColor),
                                Text(
                                  category.value.categoryName,
                                )
                              ]),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        selectedCategory = value!;
                      }),
                )
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {
                        resetInputs();
                      },
                      child: Text('Reset')),
                  ElevatedButton(
                      onPressed: () {
                        validateInputs(context, ref);
                      },
                      child: Text('Submit'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
