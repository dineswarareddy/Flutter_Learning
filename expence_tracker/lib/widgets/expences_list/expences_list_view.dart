import 'package:expence_tracker/models/expences_model.dart';
import 'package:flutter/material.dart';
import 'expences_details_list_cell.dart';

class ExpencesList extends StatefulWidget {
  const ExpencesList({
    required this.removeExpence,
    required this.expencesList, 
    super.key});

  final Function(ExpencesModel) removeExpence;
  final List<ExpencesModel> expencesList;

  @override
  State<ExpencesList> createState() {
    return _ExpencesListState();
  }
}

class _ExpencesListState extends State<ExpencesList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.expencesList.length, 
      itemBuilder: (context, index) => Dismissible(
        background: Container(
          color: Theme.of(context).colorScheme.error,
          margin: EdgeInsets.symmetric(horizontal: 16),
          ),
        key: ValueKey(widget.expencesList[index].id),
        onDismissed: (direction) => {
          if(direction == DismissDirection.endToStart) {
            print('it entered inside endToStart direction'),
            widget.removeExpence(widget.expencesList[index]),
          } else if(direction == DismissDirection.startToEnd) {
            print('it entered inside startToEnd direction')
          }
        },
        child: ExpencesListCell(expencesModel: widget.expencesList[index],)));
  }
}