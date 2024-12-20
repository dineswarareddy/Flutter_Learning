import 'package:flutter/material.dart';
import 'gradient_container.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor:  Color.fromARGB(99, 59, 255, 98),
        body: LinearWidget( Color.fromARGB(255, 120, 40, 0), Color.fromARGB(255, 100, 32, 0)),

//  colorsForGradient: [
//               Color.fromARGB(255, 120, 40, 0),
//               Color.fromARGB(255, 100, 32, 0),
//               Color.fromARGB(255, 200, 222, 0)
//             ]


      ),
    ),
  );
}

