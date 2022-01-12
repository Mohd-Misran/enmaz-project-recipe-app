import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final Widget child;
  final Color backgroundColor;
  final Function() onPressed;

  const RoundedButton({
    required this.child,
    required this.onPressed,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        width: size.width * 0.8,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(29),
          child: ElevatedButton(
            child: child,
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              primary: backgroundColor,
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            ),
          ),
        ));
  }
}
