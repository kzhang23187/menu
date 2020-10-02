import 'package:flutter/material.dart';
import 'widgets.dart';

class MealSection extends StatelessWidget {
  final String meal;

  const MealSection({Key key, this.meal}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
              child: Text('${this.meal}', style: const TextStyle(fontSize: 35)),
            ),
            IconButton(
                iconSize: 40, icon: Icon(Icons.add_circle), onPressed: () {}),
          ],
        ),
        Container(
          alignment: Alignment.centerRight,
          child: Column(
            //create dynamically with list of breakfast recipes
            children: [
              MealCard(),
              SizedBox(height: 10),
              MealCard(),
              SizedBox(height: 10),
              MealCard(),
              SizedBox(height: 10),
              MealCard(),
            ],
          ),
        ),
      ],
    );
  }
}
