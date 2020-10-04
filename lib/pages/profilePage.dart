import 'package:flutter/material.dart';

import 'pages.dart';

class FourthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Title'),
      ),
      body: Center(
        child: Hero(
            tag: "Breakfast",
            child: IconButton(
              icon: Icon(Icons.add_circle),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddMealsPage(meal: "Breakfast")));
              },
            )),
      ),
    );
  }
}
