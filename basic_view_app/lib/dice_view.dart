import 'package:flutter/material.dart';
import 'dart:math';

class DiceRollOver extends StatefulWidget {
  const DiceRollOver({super.key});

  @override
  State<DiceRollOver> createState() {
    return _DiceRollOverState();
  }
}

class _DiceRollOverState extends State<DiceRollOver> {
  final randomizer = Random();
  final startAlignment = Alignment.topLeft;
  final endAlignment = Alignment.bottomRight;
  var currentDiceNumber = 2;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset('Assets/Images/dice-$currentDiceNumber.png', width: 150),
        SizedBox(height: 30),
        TextButton(
            onPressed: rollDiceButtonAction,
            style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                padding: const EdgeInsets.all(16),
                textStyle: const TextStyle(fontSize: 22)),
            child: Text('Roll dice'))
      ],
    );
  }

  void rollDiceButtonAction() {
    setState(() {
      currentDiceNumber = randomizer.nextInt(7);
    });
  }
}
