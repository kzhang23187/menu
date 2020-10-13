import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class GroceryListItem extends StatefulWidget {
  final String name;
  final bool val;
  final List<String> amounts;

  const GroceryListItem({Key key, this.name, this.val, this.amounts})
      : super(key: key);
  @override
  _GroceryListItemState createState() => _GroceryListItemState();
}

class _GroceryListItemState extends State<GroceryListItem> {
  bool val = false;
  String unit = "50 g";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              //change variable in some provider data structure
              val = !val;
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    val
                        ? Icon(
                            Icons.check_circle,
                            size: 30,
                          )
                        : Icon(
                            Icons.check_circle_outline,
                            size: 30,
                          ),
                    Expanded(
                      flex: 7,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: AutoSizeText(
                          "Whole Chicken",
                          textAlign: TextAlign.center,
                          style: val
                              ? TextStyle(
                                  inherit: true,
                                  fontSize: 35,
                                  fontWeight: FontWeight.normal,
                                  decoration: TextDecoration.lineThrough)
                              : Theme.of(context).textTheme.headline5,
                          wrapWords: true,
                          softWrap: true,
                          maxLines: 2,
                        ),
                      ),
                    ),
                    DropdownButton(
                      value: unit,
                      icon: Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(color: Colors.deepPurple),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                      ),
                      onChanged: (String newValue) {
                        setState(() {
                          unit = newValue;
                        });
                      },
                      items: <String>['50 g', '50 ml', '50 oz', '50 cups']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                // Divider(
                //   indent: 15,
                //   thickness: 2,
                //   endIndent: 15,
                // ),
              ],
            ),
          ),
        ),
        Divider(
          indent: 15,
          thickness: 2,
          endIndent: 15,
        ),
      ],
    );
  }
}
