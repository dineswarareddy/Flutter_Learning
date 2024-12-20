// import 'package:basic_view_app/blue_text_container.dart';
import 'package:flutter/material.dart';
import 'dice_view.dart';

final startAlignment = Alignment.topLeft;
final endAlignment = Alignment.bottomRight;

class LinearWidget extends StatelessWidget {
  LinearWidget(this.color1, this.color2, { super.key });
  final Color color1;
  final Color color2;

  var currentDiceImage = 'Assets/Images/dice-1.png';

  // final List<Color> colorsForGradient;

LinearWidget.purple({ super.key }): color1 = Colors.red, color2 = Colors.green;
  @override
  Widget build(BuildContext context) {
    return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [color1, color2], begin: startAlignment,
            end: endAlignment),
          ),
          child: Center(
            child: DiceRollOver()           
            // BlueTextContainer('Testing correctly')
          ),
        );
  }
}
