import 'package:flutter/material.dart';

class MealItemMetaData extends StatelessWidget {
  const MealItemMetaData({super.key, 
    required this.icon, 
    required this.info});

final IconData icon;
final String info;
    @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.white,),
        SizedBox(width: 8),
        Text(info, style: TextStyle(color: Colors.white),)
      ],
    );
  }
}
