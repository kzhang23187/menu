import 'package:flutter/material.dart';

class AddMealsPage extends StatelessWidget {
  final String meal;

  const AddMealsPage({Key key, this.meal}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Hero(child: Icon(Icons.add_circle), tag: meal)),
    );
  }
}
