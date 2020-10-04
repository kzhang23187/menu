import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'widgets.dart';
import '../models/models.dart';
import '../themes.dart';

final List<String> targetNutrition = ['calories', 'carbs', 'protein', 'fat'];
double foodItemCardHeight = 130.0;

class FoodItemCard extends StatelessWidget {
  final FoodItem meal;
  final BorderRadius radius = const BorderRadius.only(
      topLeft: Radius.circular(100),
      bottomLeft: Radius.circular(100),
      topRight: Radius.circular(30),
      bottomRight: Radius.circular(30));

  List<Color> _getNutritionColors(List<String> nutrition) {
    List<Color> colors = [];
    nutrition.forEach((element) => colors.add(nutritionColors[element]));
    return colors;
  }

  List<int> _getNutritionValues(FoodItem meal, List<String> targetNutrition) {
    List<int> values = [];
    targetNutrition
        .forEach((element) => values.add(meal.nutritionValues[element]));
    return values;
  }

  const FoodItemCard({Key key, this.meal}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0.0, 0, 10.0),
      child: Stack(
        alignment: Alignment(-1.3, -2),
        children: [
          Card(
            margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
            shadowColor: Colors.deepOrange,
            shape: RoundedRectangleBorder(borderRadius: radius),
            child: InkWell(
              borderRadius: radius,
              splashColor: Colors.blue.withAlpha(30),
              onTap: () {},
              child: Container(
                height: 120,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 30,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: new Border.all(
                            color: Colors.grey[100],
                            width: 2.0,
                          ),
                        ),
                        // child: ClipRRect(
                        //   borderRadius: const BorderRadius.only(
                        //       topLeft: Radius.circular(30),
                        //       bottomLeft: Radius.circular(30),
                        //       topRight: Radius.circular(30),
                        //       bottomRight: Radius.circular(30)),
                        //   child: CachedNetworkImage(
                        //     width: 70,
                        //     height: 140,
                        //     fit: BoxFit.cover,
                        //     imageUrl: meal.imageUrl,
                        //     placeholder: (context, url) =>
                        //         CircularProgressIndicator(),
                        //   ),
                        // ),
                        child: ClipOval(
                          child: CachedNetworkImage(
                            width: 70,
                            height: 140,
                            fit: BoxFit.cover,
                            imageUrl: meal.imageUrl,
                            placeholder: (context, url) =>
                                CircularProgressIndicator(),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 60,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: AutoSizeText(
                                meal.foodTitle,
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 23),
                                maxLines: 2,
                              ),
                            ),
                          ),
                          NutritionalInfo(
                            colors: _getNutritionColors(targetNutrition),
                            values: _getNutritionValues(meal, targetNutrition),
                          ),
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
      ),
    );
  }
}
