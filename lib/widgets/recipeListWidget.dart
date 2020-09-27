import 'package:flutter/material.dart';

class RecipeListItem extends StatelessWidget {
  final String recipeName;
  final removeRecipe;
  RecipeListItem(this.recipeName, this.removeRecipe);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Checkbox(value: false, onChanged: null),
        Flexible(
          child: Text(
            this.recipeName,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          ),
        ),
        IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              removeRecipe(recipeName);
            }),
      ],
    );
  }
}
