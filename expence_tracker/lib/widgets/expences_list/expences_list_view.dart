import 'package:expence_tracker/models/expences_model.dart';
import 'package:flutter/material.dart';
import 'expences_details_list_cell.dart';

class ExpencesList extends StatefulWidget {
  const ExpencesList({
    required this.expencesList, 
    super.key});

  final List<ExpencesModel> expencesList;

  @override
  State<StatefulWidget> createState() {
    return _ExpencesListState();
  }
}

class _ExpencesListState extends State<ExpencesList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.expencesList.length, 
      itemBuilder: (context, index) => Dismissible(
        key: Key(widget.expencesList[index].id),
        onDismissed: (direction) => {
          if(direction == DismissDirection.endToStart) {
            print('it entered inside endToStart direction'),
            setState(() {
              widget.expencesList.removeAt(index);
            })
          } else if(direction == DismissDirection.startToEnd) {
            print('it entered inside startToEnd direction')
          }
        },
        child: ExpencesListCell(expencesModel: widget.expencesList[index],)));
  }
}