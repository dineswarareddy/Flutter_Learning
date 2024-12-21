import 'package:expence_tracker/models/expences_model.dart';
import 'package:flutter/material.dart';
import 'package:expence_tracker/widgets/expences_list/expences_list_view.dart';

class Expences extends StatefulWidget {

  const Expences({super.key});

  @override
  State<StatefulWidget> createState() {
   return _ExpcensState();
  }
}

class _ExpcensState extends State<Expences> {

final List<ExpencesModel> _expences = [
  ExpencesModel(title: 'Dress', amount: 10, date: DateTime.now(), category: ExpencesCategory.travel),
  ExpencesModel(title: 'Pizza', amount: 19, date: DateTime.now(), category: ExpencesCategory.food),
  ExpencesModel(title: 'Hotel', amount: 99, date: DateTime.now(), category: ExpencesCategory.leisure)
];

void showAddComponentView() {
  showModalBottomSheet(context: context, builder: (ctx) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
      Text('First Model'),
      Spacer(),
    ],); 
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Learning', textAlign: TextAlign.left,),
        actions: [
          IconButton(onPressed: (){
            showAddComponentView();
          }, icon: const Icon(Icons.add))
        ],
        backgroundColor: Colors.blueAccent,),
      body: Column(
          children: [
            const Text('expences chat'),
            Expanded(child: ExpencesList(expencesList: _expences)),
          ],
        ),
    );
  }
}