import 'package:flutter/material.dart';
import 'package:recipe_app/constants.dart';

class RoundedFoodLabel extends StatelessWidget {
  final String label;

  RoundedFoodLabel({
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: primaryLightColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}
