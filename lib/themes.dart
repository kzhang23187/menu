import 'dart:collection';

import 'package:flutter/material.dart';

class Themes {
  static HashMap<String, Color> nutritionColors = HashMap.from({
    'calories': Colors.red,
    'protein': Colors.blue,
    'fat': Colors.orange,
    'carbs': Colors.green
  });

  static Color backDrop = Colors.grey[300];
}
