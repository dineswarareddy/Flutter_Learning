import 'package:flutter/material.dart';

class StepView extends StatelessWidget {
  const StepView({required this.steps, super.key});

  final List<String> steps;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: [
            Text(
              'Steps',
              style: TextStyle(
                  color: const Color.fromARGB(255, 248, 151, 32),
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            for (var eachStep in steps)
              Column(
                children: [
                  Text(
                    eachStep,
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              )
      
            //  steps.forEach((item) => Text('dgrg'))
          ]),
    );
  }
}
