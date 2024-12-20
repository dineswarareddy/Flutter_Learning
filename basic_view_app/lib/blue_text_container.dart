
import 'package:flutter/material.dart';

class BlueTextContainer extends StatelessWidget {

 const BlueTextContainer(String textToDisplay, {super.key}): textReceived = textToDisplay;

  final String textReceived;

  @override
  Widget build(BuildContext context) {
     return Text(textReceived,
                style: TextStyle(
                    backgroundColor: Color.fromARGB(255, 11, 7, 255),
                    fontSize: 22,
                    color: Colors.amber)
                    );
  }
}
