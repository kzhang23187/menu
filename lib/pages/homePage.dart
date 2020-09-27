import 'dart:async';

import 'package:flutter/material.dart';
import '../widgets/recipeListWidget.dart';

List<String> dummy = [
  "taco 1",
  "taco 2",
  "taco 3",
  "taco 4",
  "taco 5",
  "taco 6",
  "taco 7"
];

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = ScrollController();
  bool newItemAdded = false;
  void removeRecipe(String name) {
    setState(() {
      dummy.remove(name);
    });
  }

  @override
  Widget build(BuildContext context) {
    Timer(Duration(milliseconds: 500), () {
      if (newItemAdded) {
        _controller.animateTo(
          _controller.position.maxScrollExtent,
          duration: Duration(milliseconds: 500),
          curve: Curves.fastLinearToSlowEaseIn,
        );
        setState(() {
          newItemAdded = false;
        });
      } else {
        _controller.animateTo(_controller.offset, duration: null, curve: null);
      }
    });

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  "Today's Meals",
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
            Container(
              height: 2 * MediaQuery.of(context).size.height / 5,
              child: ListView.builder(
                controller: _controller,
                itemCount: dummy.length,
                itemBuilder: (context, index) {
                  return Container(
                      margin: const EdgeInsets.all(3.0),
                      padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.blue, width: 2)),
                      child: RecipeListItem(dummy[index], removeRecipe));
                },
                // separatorBuilder: (context, index) => Divider(),
              ),
              // child: ListView(
              //   children: <Widget>[
              //     RecipeListItem(),
              //     Text("Taco 2"),
              //     Text("Taco 3")
              //   ],
              // ),
            ),
            Container(
                child: IconButton(
                    icon: Icon(Icons.add_circle),
                    onPressed: () {
                      setState(() {
                        dummy.add("chicken");
                        newItemAdded = true;
                      });
                    })),
          ],
        ),
      ),
    );
  }
}
