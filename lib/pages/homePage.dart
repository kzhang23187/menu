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
  // List<ScrollController> controllers = [
  //   ScrollController(),
  //   ScrollController(),
  //   ScrollController()
  // ];
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
              List<FoodItem> breakfast = meals.breakfastItems;
              List<FoodItem> lunch = meals.lunchItems;
              List<FoodItem> dinner = meals.dinnerItems;
              return Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          flex: 3,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                controller.animateTo(
                                  0.0,
                                  curve: Curves.easeOut,
                                  duration: const Duration(milliseconds: 300),
                                );
                                mealDisplayIndex = 0;
                              });
                            },
                            child: MealName(
                                targetIndex: 0,
                                currentIndex: mealDisplayIndex,
                                mealName: "Breakfast"),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                controller.animateTo(
                                  breakfast.length * (mealSectionHeight) + 60,
                                  curve: Curves.easeOut,
                                  duration: const Duration(milliseconds: 300),
                                );
                                mealDisplayIndex = 1;
                              });
                            },
                            child: MealName(
                                targetIndex: 1,
                                currentIndex: mealDisplayIndex,
                                mealName: "Lunch"),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: GestureDetector(
                            onTap: () {
                              controller.animateTo(
                                (breakfast.length + lunch.length) *
                                        (mealSectionHeight) +
                                    60 * 2,
                                curve: Curves.easeOut,
                                duration: const Duration(milliseconds: 300),
                              );
                              setState(() {
                                mealDisplayIndex = 2;
                              });
                            },
                            child: MealName(
                                targetIndex: 2,
                                currentIndex: mealDisplayIndex,
                                mealName: "Dinner"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: radius,
                      child: ListView(
                          controller: controller,
                          padding: EdgeInsets.all(0.0),
                          children: [
                            Container(
                              height: breakfast.length * mealSectionHeight + 60,
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
                              height: dinner.length * mealSectionHeight + 60,
                              child: MealSection(
                                meal: 'Dinner',
                                items: dinner,
                              ),
                            ),
                          ]),
                    ),
                  ),
                  // Expanded(
                  //   child: IndexedStack(index: mealDisplayIndex, children: [
                  //     MealSection(
                  //       controller: this.controllers[0],
                  //       meal: 'Breakfast',
                  //       items: breakfast,
                  //     ),
                  //     MealSection(
                  //       controller: this.controllers[1],
                  //       meal: 'Lunch',
                  //       items: lunch,
                  //     ),
                  //     MealSection(
                  //       controller: this.controllers[2],
                  //       meal: 'Dinner',
                  //       items: dinner,
                  //     ),
                  //   ]),
                  // ),
                ],
              );
            }),
          ),
        ),
      ],
    )
//       body: Stack(
//         // return Stack(
//         children: [
//           Positioned(
//               top: 300, bottom: 150, left: 300, right: 0, child: Text("HELLO")),
//           DraggableScrollableSheet(
//             maxChildSize: 0.9,
//             minChildSize: 0.5,
//             initialChildSize: 0.5,
//             builder: (BuildContext context, ScrollController scrollController) {
//               return ClipRRect(
//                 //to clip widget painting to be in the curved border section
//                 borderRadius: radius,
//                 child: Container(
//                   decoration: new BoxDecoration(
//                     color: Themes.backDrop,
//                     borderRadius: radius,
//                   ),
//                   child: ListView(
//                     padding: EdgeInsets.zero,
//                     controller: scrollController,
//                     children: [
//                       SizedBox(height: 10),
//                       MealSection(
//                         meal: 'Breakfast',
//                         items: breakfast,
//                       ),
//                       MealSection(
//                         meal: 'Lunch',
//                         items: lunch,
//                       ),
//                       MealSection(
//                         meal: 'Dinner',
//                         items: dinner,
//                       ),
//                       SizedBox(height: 10)
//                     ],
//                   ),
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
        );
  }
}

class MealName extends StatelessWidget {
  const MealName({
    Key key,
    @required this.targetIndex,
    this.currentIndex,
    this.mealName,
  }) : super(key: key);

  final int targetIndex;
  final int currentIndex;
  final String mealName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: RotatedBox(
        quarterTurns: 3,
        child: targetIndex == currentIndex
            ? Text(mealName,
                style: Theme.of(context).textTheme.headline6.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.red[300],
                    fontSize: 25))
            : Text(mealName,
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(color: Colors.grey[500])),
      ),
    );
  }
}
