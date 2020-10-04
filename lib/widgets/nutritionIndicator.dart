import 'package:flutter/material.dart';

class NutritionalInfo extends StatelessWidget {
  final List<int> values;
  final List<Color> colors;

  const NutritionalInfo({Key key, this.values, this.colors}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        for (var i = 0; i < values.length; i++)
          NutritionIndicator(value: values[i], color: colors[i])
      ],
    );
  }
}

class NutritionIndicator extends StatelessWidget {
  final int value;
  final Color color;

  const NutritionIndicator({Key key, this.value, this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 5),
        CircleAvatar(
          backgroundColor: color,
          radius: 7,
        ),
        SizedBox(width: 2),
        Text('${this.value}'),
        SizedBox(width: 5),
      ],
    );
  }
}
