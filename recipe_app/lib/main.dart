import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:recipe_app/screens/splash_screen/splash_screen.dart';

void main() async {
  await dotenv.load(fileName: 'lib/assets/config.env');
  runApp(RecipeApp());
}

class RecipeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'FuzzyBubbles'),
      home: SplashScreen(),
    );
  }
}
