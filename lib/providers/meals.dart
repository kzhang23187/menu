import 'package:flutter/material.dart';
import '../models/models.dart';

class Meals extends ChangeNotifier {
  String action = "";

  /// Internal, private state of the cart.
  final List<FoodItem> breakfastItems = [
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
  final List<FoodItem> lunchItems = [
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
  final List<FoodItem> dinnerItems = [
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

  List<FoodItem> availableItems = [
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
  // List<FoodItem> get breakfastItems => _breakfastItems;
  // List<FoodItem> get lunchItems => _lunchItems;
  // List<FoodItem> get dinnerItems => _dinnerItems;

  List<FoodItem> getMealsList(String meal) {
    switch (meal) {
      case "Breakfast":
        return breakfastItems;
      case "Lunch":
        return lunchItems;
      case "Dinner":
        return dinnerItems;
      case "Available":
        return availableItems;
    }
    return null;
  }

  /// Adds [item] to cart appropriate item list.
  void add(FoodItem item, String meal) {
    switch (meal) {
      case "Breakfast":
        breakfastItems.add(item);
        break;
      case "Lunch":
        lunchItems.add(item);
        break;
      case "Dinner":
        dinnerItems.add(item);
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
        breakfastItems.removeAt(index);
        break;
      case "Lunch":
        lunchItems.removeAt(index);
        break;
      case "Dinner":
        dinnerItems.removeAt(index);
        break;
    }
    action = "remove";
    notifyListeners();
  }

  void removeFoodItemName(FoodItem item, String meal) {
    // This call tells the widgets that are listening to this model to rebuild.
    switch (meal) {
      case "Breakfast":
        breakfastItems.remove(item);
        break;
      case "Lunch":
        lunchItems.remove(item);
        break;
      case "Dinner":
        dinnerItems.remove(item);
        break;
      case "Available":
        availableItems.remove(item);
        break;
    }
    action = "remove";
    notifyListeners();
  }
}

class MealsPosition extends ChangeNotifier {
  int position = 0;
  bool tabPress = false;

  void setTabPress(val) {
    tabPress = val;
  }

  void changePosition(newPosition) {
    position = newPosition;
    notifyListeners();
  }
}
