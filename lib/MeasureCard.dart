import 'package:bmi_calculator/RoundButton.dart';
import 'package:flutter/material.dart';

class MeasureCard extends StatelessWidget {
  const MeasureCard({Key? key,required this.decrement,
  required this.increment, required this.measure,
  required this.title, required this.unit}) : super(key: key);

  final String title;
  final int measure;
  final String unit;
  final void Function() increment;
  final void Function() decrement;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(measure.toString(), style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 40,
            ),),
            Text(unit),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          RoundButton(onPress: decrement, content: '-'),
          RoundButton(onPress: increment, content: '+')
        ],
        ),

      ],

    );
  }
}
