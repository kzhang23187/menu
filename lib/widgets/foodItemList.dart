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
  final List<FoodItem> mealsList;
  const FoodItemList(
      {Key key,
      this.meal,
      this.scrollable = false,
      this.controller,
      this.mealsList})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return
        // return Container(
        //   height: mealsList.length * foodItemCardHeight,
        //   alignment: Alignment.centerRight,
        //   child:
        ListView.builder(
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
          confirmDismiss: (DismissDirection direction) async {
            return await showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text("Confirm"),
                  content:
                      const Text("Are you sure you wish to delete this item?"),
                  actions: <Widget>[
                    FlatButton(
                        onPressed: () => Navigator.of(context).pop(true),
                        child: const Text("DELETE")),
                    FlatButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: const Text("CANCEL"),
                    ),
                  ],
                );
              },
            );
          },
          background: Container(
              padding: EdgeInsets.only(right: 20.0),
              child: Text(
                "Delete",
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
              alignment: Alignment.centerRight,
              margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
              color: Colors.red),
          child: FoodItemCard(
            item: mealsList[index],
            meal: meal,
            icon: null,
          ),
        );
      },
      // ),
    );
  }
}
