import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/meals.dart';
import '../models/models.dart';
import '../widgets/widgets.dart';
import '../dummyData.dart';
import '../themes.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool newItemAdded = false;
  int mealDisplayIndex = 0;
  final double mealSectionHeight = 216;
  List<FoodItem> breakfast = [];
  List<FoodItem> lunch = [];
  List<FoodItem> dinner = [];
  ScrollController controller = ScrollController();

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
      body: Column(
        children: [
          Expanded(
            flex: 35,
            child: Container(
              color: Colors.white,
            ),
          ),
          Expanded(
            flex: 65,
            child: Container(
              decoration: new BoxDecoration(
                color: Themes.backDrop,
                borderRadius: radius,
              ),
              child: Consumer<Meals>(builder: (context, meals, model) {
                breakfast = meals.breakfastItems;
                lunch = meals.lunchItems;
                dinner = meals.dinnerItems;
                return Row(
                  children: [
                    Consumer<MealsPosition>(
                        builder: (context, mealsPosition, model) {
                      return MealNames(
                          controller: controller,
                          mealDisplayIndex: mealsPosition.position,
                          breakfastLength: breakfast.length,
                          lunchLength: lunch.length,
                          mealSectionHeight: mealSectionHeight);
                    }),
                    Expanded(
                      child: ClipRRect(
                        borderRadius: radius,
                        child: NotificationListener(
                          onNotification: (t) {
                            if (t is UserScrollNotification) {
                              context.read<MealsPosition>().setTabPress(false);
                            }
                            if (t is ScrollEndNotification) {
                              if (controller.position.pixels >=
                                  (breakfast.length + lunch.length) *
                                          (mealSectionHeight) -
                                      60) {
                                if (!context.read<MealsPosition>().tabPress) {
                                  context
                                      .read<MealsPosition>()
                                      .changePosition(2);
                                }
                              } else if (controller.position.pixels >=
                                  breakfast.length * mealSectionHeight - 120) {
                                if (!context.read<MealsPosition>().tabPress) {
                                  context
                                      .read<MealsPosition>()
                                      .changePosition(1);
                                }
                              } else {
                                if (!context.read<MealsPosition>().tabPress) {
                                  context
                                      .read<MealsPosition>()
                                      .changePosition(0);
                                }
                              }
                            }
                            return true;
                          },
                          child: ListView(
                              controller: controller,
                              padding: EdgeInsets.all(0.0),
                              children: [
                                Container(
                                  height:
                                      breakfast.length * mealSectionHeight + 60,
                                  child: MealSection(
                                    meal: 'Breakfast',
                                    items: breakfast,
                                  ),
                                ),
                                Container(
                                  height: lunch.length * mealSectionHeight + 60,
                                  child: MealSection(
                                    meal: 'Lunch',
                                    items: lunch,
                                  ),
                                ),
                                Container(
                                  height:
                                      dinner.length * mealSectionHeight + 60,
                                  child: MealSection(
                                    meal: 'Dinner',
                                    items: dinner,
                                  ),
                                ),
                              ]),
                        ),
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose(); // it is a good practice to dispose the controller
    super.dispose();
  }
}
