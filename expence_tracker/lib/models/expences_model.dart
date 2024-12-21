import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();
enum ExpencesCategory {
  food, travel, leisure, work
}

const Map<ExpencesCategory,IconData> categoryIcons = {
  ExpencesCategory.food: Icons.lunch_dining,
  ExpencesCategory.travel: Icons.flight_takeoff,
  ExpencesCategory.leisure: Icons.movie,
  ExpencesCategory.work: Icons.work
};


class ExpencesModel {
final formatter = DateFormat.yMd();

ExpencesModel({
  required this.title, 
  required this.amount, 
  required this.date,
  required this.category}) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final ExpencesCategory category;

  String get formatedDate {
    return formatter.format(date);
  }
}