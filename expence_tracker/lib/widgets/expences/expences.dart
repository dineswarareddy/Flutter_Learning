import 'package:expence_tracker/models/expences_model.dart';
import 'package:expence_tracker/widgets/charts/chart.dart';
import 'package:expence_tracker/widgets/new_expence/new_expence.dart';
import 'package:flutter/material.dart';
import 'package:expence_tracker/widgets/expences_list/expences_list_view.dart';

class Test {
  String a;
  String b;

  Test({required this.a, required this.b});

  Test.withDefaultA({required this.a}) : b = 'name';
}

class Expences extends StatefulWidget {
  const Expences({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ExpcensState();
  }
}

class _ExpcensState extends State<Expences> {
  List<ExpencesModel> expences = [];

  void addExpence(ExpencesModel newExpence) {
    setState(() {
      expences.add(newExpence);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 3),
        content: Text('Expences added'),
        action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              setState(() {
                expences.removeLast();
              });
            }),
      ),
    );
  }

  void removeExpence(ExpencesModel expence) {
    final removedItemIndex = expences.indexOf(expence);
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Removed Expences'),
        duration: Duration(seconds: 3),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: (() {
            setState(() {
              expences.insert(removedItemIndex, expence);
            });
          }),
        ),
      ),
    );
    setState(() {
      expences.remove(expence);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Expences added'),
        action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              expences.removeLast();
            }),
      ),
    );
  }

  void showAddComponentView() {
    showModalBottomSheet(
      useSafeArea: true,
      context: context,
      builder: (ctx) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              NewExpence(addExpence: addExpence),
              Spacer(),
            ],
          ),
        );
      },
      isScrollControlled: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    Widget contentToDisplay = const Center(
      child: Text('Add some expences to view'),
    );
    if (expences.isNotEmpty) {
      contentToDisplay =
          ExpencesList(removeExpence: removeExpence, expencesList: expences);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Learning',
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showAddComponentView();
            },
            icon: const Icon(Icons.add),
            color: Colors.white,
          )
        ],
        // backgroundColor: Colors.blueAccent,
      ),
      body: width > 600
          ? Row(
              children: [
                Expanded(child: 
                  Chart(expenses: expences)
                ),
                Expanded(child: contentToDisplay),
              ],
            )
          : Column(
              children: [
                Chart(expenses: expences),
                Expanded(child: contentToDisplay),
              ],
            ),
    );
  }
}

class ExpensesBucket {
  ExpensesBucket({
    required this.category,
    required this.expences,
  });

  ExpensesBucket.forCategory(List<ExpencesModel> allExpenses, this.category)
      : expences = allExpenses
            .where((expence) => expence.category == category)
            .toList();

  final ExpencesCategory category;
  final List<ExpencesModel> expences;

  double get totalExpencesAmount {
    double total = 0;
    for (final eachExpence in expences) {
      total += eachExpence.amount;
    }
    return total;
  }
}
