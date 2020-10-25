import 'dart:math';

import 'package:flutter/material.dart';
import '../providers/providers.dart';
import 'package:provider/provider.dart';

class MealNames extends StatefulWidget {
  final ScrollController controller;
  final int mealDisplayIndex;
  final int breakfastLength;
  final int lunchLength;
  final double mealSectionHeight;

  MealNames(
      {Key key,
      this.controller,
      this.mealDisplayIndex,
      this.breakfastLength,
      this.lunchLength,
      this.mealSectionHeight})
      : super(key: key);
  @override
  _MealNamesState createState() => _MealNamesState();
}

class _MealNamesState extends State<MealNames> {
  int mealDisplayIndex;
  @override
  void initState() {
    super.initState();
    mealDisplayIndex = widget.mealDisplayIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 3,
            child: GestureDetector(
              onTap: () {
                // setState(() {
                //   widget.controller.animateTo(
                //     0.0,
                //     curve: Curves.easeOut,
                //     duration: const Duration(milliseconds: 300),
                //   );
                //   mealDisplayIndex = 0;
                // });
                widget.controller.animateTo(
                  0.0,
                  curve: Curves.easeOut,
                  duration: const Duration(milliseconds: 300),
                );
                context.read<MealsPosition>().changePosition(0);
                context.read<MealsPosition>().setTabPress(true);
              },
              child: Consumer<MealsPosition>(
                  builder: (context, mealsPosition, model) {
                return MealName(
                    targetIndex: 0,
                    currentIndex: mealsPosition.position,
                    mealName: "Breakfast");
              }),
            ),
          ),
          Expanded(
            flex: 3,
            child: GestureDetector(
              onTap: () {
                // setState(() {
                //   widget.controller.animateTo(
                //     widget.breakfastLength * (widget.mealSectionHeight) + 60,
                //     curve: Curves.easeOut,
                //     duration: const Duration(milliseconds: 300),
                //   );
                //   mealDisplayIndex = 1;
                // });
                widget.controller.animateTo(
                  widget.breakfastLength * (widget.mealSectionHeight) + 60,
                  curve: Curves.easeOut,
                  duration: const Duration(milliseconds: 300),
                );
                context.read<MealsPosition>().changePosition(1);
                context.read<MealsPosition>().setTabPress(true);
              },
              child: Consumer<MealsPosition>(
                  builder: (context, mealsPosition, model) {
                return MealName(
                    targetIndex: 1,
                    currentIndex: mealsPosition.position,
                    mealName: "Lunch");
              }),
            ),
          ),
          Expanded(
            flex: 3,
            child: GestureDetector(
              onTap: () {
                // setState(() {
                //   widget.controller.animateTo(
                //     (widget.breakfastLength + widget.lunchLength) *
                //             (widget.mealSectionHeight) +
                //         60 * 2,
                //     curve: Curves.easeOut,
                //     duration: const Duration(milliseconds: 300),
                //   );

                //   mealDisplayIndex = 2;
                // });
                widget.controller.animateTo(
                  (widget.breakfastLength + widget.lunchLength) *
                          (widget.mealSectionHeight) +
                      60 * 2,
                  curve: Curves.easeOut,
                  duration: const Duration(milliseconds: 300),
                );
                context.read<MealsPosition>().changePosition(2);
                context.read<MealsPosition>().setTabPress(true);
              },
              child: Consumer<MealsPosition>(
                  builder: (context, mealsPosition, model) {
                return MealName(
                    targetIndex: 2,
                    currentIndex: mealsPosition.position,
                    mealName: "Dinner");
              }),
            ),
          ),
        ],
      ),
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
