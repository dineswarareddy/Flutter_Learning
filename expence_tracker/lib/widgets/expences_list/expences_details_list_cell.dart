import 'package:expence_tracker/models/expences_model.dart';
import 'package:flutter/material.dart';

class ExpencesListCell extends StatelessWidget {

  const ExpencesListCell({required this.expencesModel, super.key});

  final ExpencesModel expencesModel;
  
  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 235, 199, 241),
      child:
     Padding(padding: EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 10),
      child: 
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(expencesModel.title,
          style: Theme.of(context).textTheme.titleLarge),
          SizedBox(height: 4),
          Row(children: [
            Text('\$${expencesModel.amount.toStringAsFixed(2)}'),
            Spacer(),
            Icon(categoryIcons[expencesModel.category]),
            Text(expencesModel.formatedDate),
          ],
          )
        ],
      ),
      ),
    );
  }
}