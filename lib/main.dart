import 'package:flutter/material.dart';

import 'pages/homePage.dart';
import 'pages/groceryListPage.dart';
import 'pages/profilePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int selectedPage = 0;

  final _pageOptions = [
    HomePage(),
    ThirdPage(),
    FourthPage(),
    ThirdPage(),
    FourthPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOptions[selectedPage],
      floatingActionButton: new FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: new Icon(Icons.search),
        elevation: 4.0,
      ),
      bottomNavigationBar: BottomAppBar(
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Container(
                child: IconButton(
                    iconSize: selectedPage == 0 ? 32.0 : 24.0,
                    icon: selectedPage == 0
                        ? Icon(Icons.home, color: Colors.red)
                        : Icon(Icons.home, color: Colors.grey),
                    onPressed: () {
                      setState(() {
                        selectedPage = 0;
                      });
                    }),
              ),
            ),
            Expanded(
              child: IconButton(
                  icon: Icon(Icons.fastfood),
                  onPressed: () {
                    setState(() {
                      selectedPage = 1;
                    });
                  }),
            ),
            Expanded(child: new Text('')),
            Expanded(
              child: IconButton(
                  icon: Icon(Icons.list),
                  onPressed: () {
                    setState(() {
                      selectedPage = 2;
                    });
                  }),
            ),
            Expanded(
              child: IconButton(
                  icon: Icon(Icons.portrait),
                  onPressed: () {
                    selectedPage = 3;
                  }),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
