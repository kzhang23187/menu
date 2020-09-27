import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                "Today's Meals",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 30),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 2,
              child: ListView(
                children: <Widget>[
                  Text("taco 1"),
                  Text("Taco 2"),
                  Text("Taco 3")
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
