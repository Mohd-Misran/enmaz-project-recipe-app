import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:recipe_app/constants.dart';
import 'package:recipe_app/models/category.dart';
import 'package:recipe_app/screens/home_screen/category_card.dart';

class CategoryListView extends StatefulWidget {
  @override
  State<CategoryListView> createState() => _CategoryListViewState();
}

class _CategoryListViewState extends State<CategoryListView> {
  late Future<List<Category>> categories;

  Future<List<Category>> fetchCategories() async {
    final response = await http
        .get(Uri.parse("${dotenv.env['BACKEND_SERVER']}/api/v1/categories"));

    final responseBody = jsonDecode(response.body);

    if (response.statusCode == 200) {
      final categories = responseBody['categories'] as List;
      List<Category> results =
          categories.map((category) => Category.fromJson(category)).toList();
      return results;
    }

    return <Category>[];
  }

  @override
  void initState() {
    super.initState();
    categories = fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return FutureBuilder<List<Category>>(
      future: categories,
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data!.length > 0) {
          return Container(
            height: size.height * 0.25,
            width: double.infinity,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return CategoryCard(
                  category: snapshot.data![index],
                );
              },
            ),
          );
        }

        return Container(
          height: size.height * 0.25,
          width: double.infinity,
          color: bgColor,
          child: SpinKitThreeBounce(size: 30.0, color: primaryColor),
        );
      },
    );
  }
}
