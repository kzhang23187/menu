export 'groceryListPage.dart';
export 'profilePage.dart';
export 'homePage.dart';
export 'nutritionPage.dart';

import 'package:flutter/material.dart';

class NewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'New Screen',
        ),
      ),
      body: Container(
        child: FlatButton(
          child: Text("Push new Screen"),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => NewPage(),
              ),
            );
          },
        ),
      ),
    );
  }
}
