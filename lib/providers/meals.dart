import 'package:flutter/material.dart';
import '../models/models.dart';

class Meals extends ChangeNotifier {
  String action = "";

  /// Internal, private state of the cart.
  final List<FoodItem> _breakfastItems = [
    FoodItem(
        foodTitle: "Scrambled Eggs with Pepper and Homemade Ketchup",
        imageUrl:
            "https://upload.wikimedia.org/wikipedia/commons/archive/2/20/20140610213944%21Scrambed_eggs.jpg",
        nutritionValues: {
          'carbs': 1200,
          'protein': 24,
          'fat': 3,
          'calories': 111
        }),
    FoodItem(
        foodTitle: "Pancakes",
        imageUrl:
            "https://upload.wikimedia.org/wikipedia/commons/4/43/Blueberry_pancakes_%283%29.jpg",
        nutritionValues: {
          'carbs': 23,
          'protein': 10,
          'fat': 6,
          'calories': 120
        }),
  ];
  final List<FoodItem> _lunchItems = [
    FoodItem(
        foodTitle: "Sandwich",
        imageUrl:
            "https://upload.wikimedia.org/wikipedia/commons/thumb/9/94/Salad_platter.jpg/440px-Salad_platter.jpg",
        nutritionValues: {
          'carbs': 12,
          'protein': 12,
          'fat': 12,
          'calories': 12
        }),
    FoodItem(
        foodTitle: "Chips",
        imageUrl:
            "https://upload.wikimedia.org/wikipedia/commons/thumb/9/94/Salad_platter.jpg/440px-Salad_platter.jpg",
        nutritionValues: {
          'carbs': 13,
          'protein': 13,
          'fat': 13,
          'calories': 13
        }),
  ];
  final List<FoodItem> _dinnerItems = [
    FoodItem(
        foodTitle: "Lasagna",
        imageUrl:
            "https://upload.wikimedia.org/wikipedia/commons/thumb/9/94/Salad_platter.jpg/440px-Salad_platter.jpg",
        nutritionValues: {
          'carbs': 23,
          'protein': 23,
          'fat': 23,
          'calories': 23
        }),
    FoodItem(
        foodTitle: "Chicken Caesar Salad With Thousand Island Dressing",
        imageUrl:
            "https://upload.wikimedia.org/wikipedia/commons/thumb/9/94/Salad_platter.jpg/440px-Salad_platter.jpg",
        nutritionValues: {
          'carbs': 13,
          'protein': 13,
          'fat': 13,
          'calories': 13
        }),
  ];

  List<FoodItem> _availableItems = [
    FoodItem(
        foodTitle: "Lasagna Super Delicious",
        imageUrl:
            "https://upload.wikimedia.org/wikipedia/commons/thumb/9/94/Salad_platter.jpg/440px-Salad_platter.jpg",
        nutritionValues: {
          'carbs': 23,
          'protein': 23,
          'fat': 23,
          'calories': 23
        }),
    FoodItem(
        foodTitle:
            "Chicken Caesar Salad With Thousand Island Dressing Super Delicious",
        imageUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/9/94/Salad_platter.jpg/440px-Salad_platter.jpg",
        nutritionValues: {
          'carbs': 13,
          'protein': 13,
          'fat': 13,
          'calories': 13
        }),
  ];

  /// An unmodifiable view of the items in the cart.
  List<FoodItem> get breakfastItems => _breakfastItems;

  List<FoodItem> getMealsList(String meal) {
    switch (meal) {
      case "Breakfast":
        return _breakfastItems;
      case "Lunch":
        return _lunchItems;
      case "Dinner":
        return _dinnerItems;
      case "Available":
        return _availableItems;
    }
    return null;
  }

  /// Adds [item] to cart appropriate item list.
  void add(FoodItem item, String meal) {
    switch (meal) {
      case "Breakfast":
        _breakfastItems.add(item);
        break;
      case "Lunch":
        _lunchItems.add(item);
        break;
      case "Dinner":
        _dinnerItems.add(item);
        break;
    }
    action = "add";

    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

  /// Removes [item] to cart appropriate item list.
  void removeFoodItem(int index, String meal) {
    // This call tells the widgets that are listening to this model to rebuild.
    switch (meal) {
      case "Breakfast":
        _breakfastItems.removeAt(index);
        break;
      case "Lunch":
        _lunchItems.removeAt(index);
        break;
      case "Dinner":
        _dinnerItems.removeAt(index);
        break;
    }
    action = "remove";
    notifyListeners();
  }
}
