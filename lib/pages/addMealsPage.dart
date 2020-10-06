import 'package:flutter/material.dart';

class AddMealsPage extends StatelessWidget {
  final String meal;

  const AddMealsPage({Key key, this.meal}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        actions: [
          Hero(
              key: UniqueKey(),
              child: Material(
                type: MaterialType.transparency,
                child: IconButton(
                  splashRadius: 20,
                  icon: Icon(Icons.cancel),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
              tag: meal),
        ],
      ),
      body: Center(child: Text("hi")),
    );
  }
}
