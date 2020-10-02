import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

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
  // final ScrollController panelController;

  // const HomePage({Key key, this.panelController}) : super(key: key);
  // ScrollController get panelControl {
  //   return panelController;
  // }

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // PanelController panelControl = PanelController();
  bool newItemAdded = false;

  void removeRecipe(String name) {
    setState(() {
      dummy.remove(name);
    });
  }

  @override
  Widget build(BuildContext context) {
    BorderRadiusGeometry radius = BorderRadius.only(
      topLeft: Radius.circular(36.0),
      topRight: Radius.circular(36.0),
    );
    return Scaffold(
      body: DraggableScrollableSheet(
        maxChildSize: 0.8,
        minChildSize: 0.6,
        initialChildSize: 0.6,
        builder: (BuildContext context, ScrollController scrollController) {
          return Container(
            decoration: new BoxDecoration(
              color: Colors.grey[300], //new Color.fromRGBO(255, 0, 0, 0.0),
              borderRadius: radius,
            ),
            child: ListView(
              padding: EdgeInsets.zero,
              controller: scrollController,
              children: [
                Icon(
                  Icons.remove,
                  size: 40,
                ),
                MealSection(meal: 'Breakfast'),
                MealSection(meal: 'Lunch')
              ],
            ),
          );
        },
      ),
    );

    // body: SizedBox.expand(
    //   child: DraggableScrollableSheet(
    //     minChildSize: 0.5,
    //     maxChildSize: 1,
    //     builder: (BuildContext context, ScrollController scrollController) {
    //       return Container(
    //         color: Colors.blue[100],
    //         child: ListView.builder(
    //           controller: scrollController,
    //           itemCount: 25,
    //           itemBuilder: (BuildContext context, int index) {
    //             return ListTile(title: Text('Item $index'));
    //           },
    //         ),
    //       );
    //     },
    //   ),
    // ),
  }
}
