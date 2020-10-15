import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/widgets.dart';
import '../providers/providers.dart';
import '../models/models.dart';
import '../themes.dart';

class AddFoodItemsPage extends StatefulWidget {
  final String meal;
  final List<FoodItem> items;

  const AddFoodItemsPage({Key key, this.meal, this.items}) : super(key: key);

  @override
  _AddFoodItemsPageState createState() => _AddFoodItemsPageState();
}

class _AddFoodItemsPageState extends State<AddFoodItemsPage> {
  @override
  Widget build(BuildContext context) {
    ScrollController _controller = ScrollController();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: AppBar(
          backgroundColor: Themes.backDrop,
          title: Text("${this.widget.meal}",
              style: Theme.of(context).textTheme.headline2),
          leading: Container(),
          actions: [
            Hero(
                key: UniqueKey(),
                child: Material(
                  type: MaterialType.transparency,
                  child: IconButton(
                    color: Colors.black,
                    splashRadius: 20,
                    icon: Icon(Icons.cancel),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
                tag: widget.meal),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          // Expanded(
          //     child: FoodItemList(
          //   meal: this.widget.meal,
          //   scrollable: true,
          //   controller: _controller,
          // )),
          // Divider(thickness: 2),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Container(
          //     child: Text("Add to ${this.widget.meal}",
          //         style: Theme.of(context).textTheme.headline6),
          //   ),
          // ),
          Expanded(
            child: Consumer<Meals>(
              builder: (context, meals, model) {
                List<FoodItem> mealsList = meals.getMealsList("Available");
                return ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: mealsList.length,
                  itemBuilder: (context, index) {
                    return FoodItemCard(
                      item: mealsList[index],
                      meal: this.widget.meal,
                      icon: Icons.add,
                    );

                    // return FoodItemCard(meal: widget.items[index]);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
