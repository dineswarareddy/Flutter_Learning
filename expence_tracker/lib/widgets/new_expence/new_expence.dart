import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:expence_tracker/models/expences_model.dart';

class NewExpence extends StatefulWidget {
  const NewExpence({required this.addExpence, super.key});

  final Function(ExpencesModel expence) addExpence;

  @override
  State<NewExpence> createState() {
    return _NewExpenceState();
  }
}

class _NewExpenceState extends State<NewExpence> {
  var inputText = '';
  DateTime? selectedDate;
  final formatter = DateFormat.yMd();

  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  String? selectedDateString;
  ExpencesCategory selectedDropDownValue = ExpencesCategory.leisure;

  valueChangedInText(String input) {
    inputText = input;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
  }

  calendarIconPressed() async {
    DateTime now = DateTime.now();
    selectedDate = await showDatePicker(
        context: context,
        currentDate: now,
        firstDate: DateTime(now.year - 1, now.month, now.day),
        lastDate: now);
    if (selectedDate != null) {
      setState(() {
        selectedDateString = formatter.format(selectedDate!);
      });
    }
  }

  List<DropdownMenuItem> get dropDownMenuItems {
    return ExpencesCategory.values
        .map(
          (eachCategory) => DropdownMenuItem(
            value: eachCategory,
            child: Text(eachCategory.name.toUpperCase()),
          ),
        )
        .toList();
  }

  void cancelAddExpences() {
    Navigator.pop(context);
  }

  submitButtonAction() {
    var enteredAmount = double.tryParse(_amountController.text);
    bool isAmountValid = enteredAmount != null && enteredAmount > 0;
    if (_titleController.text.trim().isNotEmpty &&
        isAmountValid &&
        selectedDate != null) {
      final newExpence = ExpencesModel(
          title: _titleController.text,
          amount: enteredAmount,
          date: selectedDate!,
          category: selectedDropDownValue);
      widget.addExpence(newExpence);
      Navigator.pop(context);
    } else {
      // show error message
      showDialog(
        context: context,
        builder: (ctxt) => AlertDialog(
          title: Text('Invalid inputs'),
          content: Text('Enter valid inputs for fields'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(8, 48, 8, 8),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            onChanged: valueChangedInText,
            decoration: InputDecoration(labelText: 'Expence name'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Amount',
                    prefixText: '\$ ',
                  ),
                  controller: _amountController,
                  keyboardType: TextInputType.numberWithOptions(),
                ),
              ),
              SizedBox(width: 16),
              Text((selectedDateString != null)
                  ? selectedDateString!
                  : 'No date selected'),
              IconButton(
                  onPressed: calendarIconPressed,
                  icon: Icon(Icons.calendar_month)),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              DropdownButton(
                value: selectedDropDownValue,
                items: dropDownMenuItems,
                onChanged: ((value) {
                  setState(() {
                    selectedDropDownValue = value;
                  });
                }),
              ),
              Spacer(),
              TextButton(onPressed: cancelAddExpences, child: Text('Cancel')),
              ElevatedButton(
                  onPressed: submitButtonAction, child: Text('Press to save')),
            ],
          )
        ],
      ),
    );
  }
}
