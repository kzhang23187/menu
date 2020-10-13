import 'package:flutter/material.dart';
import '../widgets/widgets.dart';
import '../themes.dart';

class GroceryListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: AppBar(
          toolbarHeight: 70,
          backgroundColor: Themes.backDrop,
          title: Text(
            'Grocery List',
            style: Theme.of(context).textTheme.headline2,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return GroceryListItem();

          // return FoodItemCard(meal: widget.items[index]);
        },
      ),
    );
  }
}
