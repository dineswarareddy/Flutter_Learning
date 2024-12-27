import 'package:flutter/material.dart';

enum Categories {
  vegetables,
  fruit, 
  meat, 
  dairy, 
  carbs, 
  sweets, 
  spices, 
  convenience, 
  hygiene, 
  other
}

class Category {
  final String categoryName;
  final Color themeColor;

  const Category(this.categoryName, this.themeColor);
}