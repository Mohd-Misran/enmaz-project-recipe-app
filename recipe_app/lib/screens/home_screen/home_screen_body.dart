import 'package:flutter/material.dart';
import 'package:recipe_app/constants.dart';
import 'package:recipe_app/screens/home_screen/category_list_view.dart';
import 'package:recipe_app/screens/home_screen/recipe_list_view.dart';

class HomeScreenBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
          child: Text(
            "Categories",
            style: TextStyle(
              fontSize: 28,
              color: primaryDarkColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        CategoryListView(),
        SizedBox(height: 20),
        Container(
          margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
          child: Text(
            "Recipes",
            style: TextStyle(
              fontSize: 28,
              color: primaryDarkColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        RecipeListView(),
      ],
    );
  }
}
