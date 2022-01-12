import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:recipe_app/constants.dart';
import 'package:recipe_app/models/recipe.dart';
import 'package:recipe_app/screens/home_screen/recipe_card.dart';

class RecipeListView extends StatefulWidget {
  @override
  State<RecipeListView> createState() => _RecipeListViewState();
}

class _RecipeListViewState extends State<RecipeListView> {
  late Future<List<Recipe>> recipes;

  Future<List<Recipe>> fetchRecipes() async {
    final response = await http
        .get(Uri.parse("${dotenv.env['BACKEND_SERVER']}/api/v1/recipes"));

    final responseBody = jsonDecode(response.body);

    if (response.statusCode == 200) {
      final recipes = responseBody['recipes'] as List;
      List<Recipe> results =
          recipes.map((recipe) => Recipe.fromJson(recipe)).toList();
      return results;
    }

    return <Recipe>[];
  }

  @override
  void initState() {
    super.initState();
    recipes = fetchRecipes();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Recipe>>(
      future: recipes,
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data!.length > 0) {
          return Expanded(
            child: ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return RecipeCard(recipe: snapshot.data![index]);
              },
            ),
          );
        }

        return Container(
          color: bgColor,
          child: SpinKitRotatingCircle(size: 50.0, color: primaryColor),
        );
      },
    );
  }
}
