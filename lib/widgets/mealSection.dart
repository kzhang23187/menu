import 'package:flutter/material.dart';
import 'widgets.dart';
import '../models/models.dart';

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
              child: Text('${this.widget.meal}',
                  style: const TextStyle(fontSize: 35)),
            ),
            IconButton(
                iconSize: 40, icon: Icon(Icons.add_circle), onPressed: () {}),
          ],
        ),
        Container(
          height: widget.items.length * foodItemCardHeight,
          alignment: Alignment.centerRight,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            physics: NeverScrollableScrollPhysics(),
            itemCount: widget.items.length,
            itemBuilder: (context, index) {
              final item = widget.items[index];
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) {
                  setState(() {
                    widget.items.removeAt(index);
                  });
                  Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text("${item.foodTitle} removed")));
                },
                background: Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                    color: Colors.red),
                child: FoodItemCard(meal: widget.items[index]),
              );

              // return FoodItemCard(meal: widget.items[index]);
            },
          ),
        ),

        //   child: Column(
        //       //create dynamically with list of recipe items
        //       children: [for (var item in items) FoodItemCard(meal: item)]),
        // ),
      ],
    );
  }
}
