import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import './widgets.dart';

class MealCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment(-1.3, -2),
      children: [
        Card(
          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
          shadowColor: Colors.deepOrange,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(100),
                  bottomLeft: Radius.circular(100),
                  topRight: Radius.zero,
                  bottomRight: Radius.circular(30))),
          child: InkWell(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(100),
                bottomLeft: Radius.circular(100),
                topRight: Radius.zero,
                bottomRight: Radius.circular(30)),
            splashColor: Colors.blue.withAlpha(30),
            onTap: () {},
            child: Container(
              width: 400,
              height: 120,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 30,
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(
                          "https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/001_Tacos_de_carnitas%2C_carne_asada_y_al_pastor.jpg/1200px-001_Tacos_de_carnitas%2C_carne_asada_y_al_pastor.jpg"),
                    ),
                  ),
                  Expanded(
                    flex: 60,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 7,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: AutoSizeText(
                                'Mexican Chicken Tacos',
                                style: TextStyle(fontSize: 23),
                                maxLines: 2,
                              ),
                            ),
                          ),
                        ),
                        // Text(
                        //   'Chicken Tacos Style',
                        //   style: const TextStyle(fontSize: 30),
                        //   textAlign: TextAlign.left,
                        //   // softWrap: true,
                        // ),
                        Expanded(
                          flex: 3,
                          child: NutritionalInfo(
                            colors: [
                              Colors.green,
                              Colors.blue,
                              Colors.red,
                              Colors.orange
                            ],
                            values: [320, 42, 30, 12],
                          ),
                        )
                        // Row(
                        //   children: [
                        //     NutritionIndicator(
                        //         value: 320, color: Colors.green[300]),
                        //     NutritionIndicator(
                        //         value: 320, color: Colors.green[300]),
                        //     NutritionIndicator(
                        //         value: 320, color: Colors.green[300]),
                        //     NutritionIndicator(
                        //         value: 320, color: Colors.green[300]),
                        //   ],
                        // )
                      ],
                    ),
                  ),
                  // Spacer(),
                  Expanded(
                    flex: 12,
                    child: Center(
                      child: IconButton(
                          alignment: Alignment.bottomLeft,
                          icon: Icon(Icons.favorite_border),
                          onPressed: () {}),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
