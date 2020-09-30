import 'dart:async';
import 'package:sliding_up_panel/sliding_up_panel.dart';

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
  final PanelController panelController;

  const HomePage({Key key, this.panelController}) : super(key: key);
  PanelController get panelControl {
    return panelController;
  }

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // PanelController panelControl = PanelController();
  final _controller = ScrollController();
  bool newItemAdded = false;
  String text = 'THIS IS THE INITIAL TEXT';
  void removeRecipe(String name) {
    setState(() {
      dummy.remove(name);
    });
  }

  @override
  Widget build(BuildContext context) {
    BorderRadiusGeometry radius = BorderRadius.only(
      topLeft: Radius.circular(24.0),
      topRight: Radius.circular(24.0),
    );
    return Scaffold(
      body: SlidingUpPanel(
        controller: widget.panelControl,
        borderRadius: radius,
        defaultPanelState: PanelState.CLOSED,
        maxHeight: MediaQuery.of(context).size.height - 200,
        minHeight: 3 * MediaQuery.of(context).size.height / 5,
        panel: Container(
          decoration: new BoxDecoration(
            color: Colors.green, //new Color.fromRGBO(255, 0, 0, 0.0),
            borderRadius: radius,
          ),
          child: Column(
            children: [
              Icon(Icons.drag_handle),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child:
                        Text('Breakfast', style: const TextStyle(fontSize: 25)),
                  ),
                  IconButton(
                      iconSize: 25,
                      icon: Icon(Icons.add_circle_outline),
                      onPressed: () {}),
                ],
              ),
              Container(
                alignment: Alignment.centerRight,
                child: Stack(
                  alignment: Alignment(-1.3, -2),
                  children: [
                    Card(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      shadowColor: Colors.deepOrange,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              bottomLeft: Radius.circular(30),
                              topRight: Radius.zero,
                              bottomRight: Radius.circular(30))),
                      child: InkWell(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            bottomLeft: Radius.circular(30),
                            topRight: Radius.zero,
                            bottomRight: Radius.circular(30)),
                        splashColor: Colors.blue.withAlpha(30),
                        onTap: () {},
                        child: Container(
                          width: 350,
                          height: 120,
                          child:
                              Center(child: Text('A card that can be tapped')),
                        ),
                      ),
                    ),
                    CircleAvatar(radius: 55),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Text('Lunch', style: const TextStyle(fontSize: 25)),
                  ),
                  IconButton(
                      iconSize: 25,
                      icon: Icon(Icons.add_circle_outline),
                      onPressed: () {}),
                ],
              ),
            ],
          ),
        ),
        body: Container(
          child: Center(
            child: Text(''),
          ),
        ),
      ),

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
    );
  }
}
