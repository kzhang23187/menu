import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/providers.dart';
import '../models/models.dart';
import '../widgets/widgets.dart';

class FoodItemList extends StatelessWidget {
  final String meal;
  final bool scrollable;
  final controller;
  const FoodItemList(
      {Key key, this.meal, this.scrollable = false, this.controller})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<Meals>(
      builder: (context, meals, model) {
        List<FoodItem> mealsList = meals.getMealsList(meal);
        return Container(
          height: mealsList.length * foodItemCardHeight,
          alignment: Alignment.centerRight,
          child: ListView.builder(
            controller: this.controller,
            padding: EdgeInsets.zero,
            physics: this.scrollable
                ? AlwaysScrollableScrollPhysics()
                : NeverScrollableScrollPhysics(),
            itemCount: mealsList.length,
            itemBuilder: (context, index) {
              final item = mealsList[index];
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) {
                  Provider.of<Meals>(context, listen: false)
                      .removeFoodItem(index, meal);
                  Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text("${item.foodTitle} removed")));
                },
                background: Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                    color: Colors.red),
                child: FoodItemCard(
                  item: mealsList[index],
                  meal: meal,
                  icon: Icons.favorite_border,
                ),
              );

              // return FoodItemCard(meal: widget.items[index]);
            },
          ),
        );
      },
    );
  }
}
