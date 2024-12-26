import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealsapp/data/dymmy_data.dart';

final mealsProvider = Provider((ref) {
  return dummyMeals;
});