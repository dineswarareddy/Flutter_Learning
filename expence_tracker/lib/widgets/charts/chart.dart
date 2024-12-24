import 'package:expence_tracker/models/expences_model.dart';
import 'package:flutter/material.dart';

import 'chart_bar.dart';
import 'package:expence_tracker/widgets/expences/expences.dart';


class Chart extends StatelessWidget {
  const Chart({super.key, required this.expenses});

  final List<ExpencesModel> expenses;

  List<ExpensesBucket> get buckets {
    return [
      ExpensesBucket.forCategory(expenses, ExpencesCategory.food),
      ExpensesBucket.forCategory(expenses, ExpencesCategory.leisure),
      ExpensesBucket.forCategory(expenses, ExpencesCategory.travel),
      ExpensesBucket.forCategory(expenses, ExpencesCategory.work),
    ];
  }

  double get maxTotalExpense {
    double maxTotalExpense = 0;

    for (final bucket in buckets) {
      if (bucket.totalExpencesAmount > maxTotalExpense) {
        maxTotalExpense = bucket.totalExpencesAmount;
      }
    }

    return maxTotalExpense;
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 8,
      ),
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary.withOpacity(0.3),
            Theme.of(context).colorScheme.primary.withOpacity(0.0)
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                for (final bucket in buckets) // alternative to map()
                  ChartBar(
                    fill: bucket.totalExpencesAmount == 0
                        ? 0
                        : bucket.totalExpencesAmount / maxTotalExpense,
                  )
              ],
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: buckets
                .map(
                  (bucket) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Icon(
                        categoryIcons[bucket.category],
                        color: isDarkMode
                            ? Theme.of(context).colorScheme.secondary
                            : Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.7),
                      ),
                    ),
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}