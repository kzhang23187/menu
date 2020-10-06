import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import '../widgets/widgets.dart';
import '../models/models.dart';
import '../dummyData.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool newItemAdded = false;

  void removeRecipe(String name) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    BorderRadiusGeometry radius = BorderRadius.only(
      topLeft: Radius.circular(36.0),
      topRight: Radius.circular(36.0),
    );
    return Scaffold(
      body: Stack(
        // return Stack(
        children: [
          Positioned(
              top: 300, bottom: 150, left: 300, right: 0, child: Text("HELLO")),
          DraggableScrollableSheet(
            maxChildSize: 0.8,
            minChildSize: 0.5,
            initialChildSize: 0.5,
            builder: (BuildContext context, ScrollController scrollController) {
              return ClipRRect(
                //to clip widget painting to be in the curved border section
                borderRadius: radius,
                child: Container(
                  decoration: new BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: radius,
                  ),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    controller: scrollController,
                    children: [
                      SizedBox(height: 10),
                      MealSection(
                        meal: 'Breakfast',
                        items: breakfast,
                      ),
                      MealSection(
                        meal: 'Lunch',
                        items: lunch,
                      ),
                      MealSection(
                        meal: 'Dinner',
                        items: dinner,
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
