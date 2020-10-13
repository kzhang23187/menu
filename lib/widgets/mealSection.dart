import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'widgets.dart';

import '../providers/providers.dart';
import '../models/models.dart';
import '../pages/pages.dart';

class MealSection extends StatefulWidget {
  final String meal;
  final List<FoodItem> items;

  const MealSection({Key key, this.meal, this.items}) : super(key: key);

  @override
  _MealSectionState createState() => _MealSectionState();
}

class _MealSectionState extends State<MealSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
              child: Text(
                '${this.widget.meal}',
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
            Material(
              type: MaterialType.transparency,
              child: Hero(
                  child: Material(
                    type: MaterialType.transparency,
                    child: IconButton(
                        splashRadius: 20,
                        icon: Icon(Icons.add_circle),
                        onPressed: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (c, a1, a2) => AddFoodItemsPage(
                                  meal: widget.meal, items: widget.items),
                              transitionsBuilder: (c, anim, a2, child) =>
                                  FadeTransition(opacity: anim, child: child),
                              transitionDuration: Duration(milliseconds: 500),
                            ),
                            // MaterialPageRoute(
                            //     builder: (BuildContext context) =>
                            //         AddMealsPage(meal: widget.meal)),
                          );
                        }),
                  ),
                  tag: widget.meal),
              // child: IconButton(
              //     splashColor: Colors.red,
              //     splashRadius: 20,
              //     iconSize: 40,
              //     icon: Icon(Icons.add_circle),
              //     onPressed: () {}),
            ),
          ],
        ),
        FoodItemList(
          meal: widget.meal,
        )
      ],
    );
  }
}
