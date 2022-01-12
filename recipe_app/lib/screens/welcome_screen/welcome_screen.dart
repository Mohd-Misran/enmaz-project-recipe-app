import 'package:flutter/material.dart';
import 'package:recipe_app/components/rounded_button.dart';
import 'package:recipe_app/constants.dart';
import 'package:recipe_app/screens/login_screen/login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        body: Container(
          height: size.height,
          width: size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(height: size.height * 0.1),
              Text(
                "WELCOME TO CHEF'S SPECIAL",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                ),
              ),
              Image.asset(
                "lib/assets/icons/welcome.png",
                height: size.height * 0.45,
              ),
              RoundedButton(
                child: Text(
                  "LOGIN TO CONTINUE",
                  style: TextStyle(
                    color: primaryLightColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                backgroundColor: primaryColor,
              ),
              Text(
                "Don't have an account? Create one.",
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.underline,
                ),
              ),
              SizedBox(height: size.height * 0.1),
            ],
          ),
        ),
      ),
    );
  }
}
