import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:recipe_app/components/rounded_button.dart';
import 'package:recipe_app/components/rounded_input_field.dart';
import 'package:recipe_app/constants.dart';
import 'package:recipe_app/models/user.dart';
import 'package:recipe_app/screens/home_screen/home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _callApi = false;
  bool _invalidCredentials = false;

  bool emptyFields(User user) {
    return (user.email.isEmpty || user.password.isEmpty);
  }

  Future<bool> validatePassword(User user) async {
    final response = await http.post(
      Uri.parse("${dotenv.env['BACKEND_SERVER']}/api/v1/users/login"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(<String, String>{
        "email": user.email,
        "password": user.password,
      }),
    );

    return (response.statusCode == 200);
  }

  @override
  Widget build(BuildContext context) {
    User user = new User();
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: bgColor,
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.disabled,
            child: Container(
              height: size.height,
              width: size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(height: size.height * 0.1),
                  Text(
                    "Login to your account",
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Image.asset("lib/assets/icons/login.png"),
                  RoundedInputField(
                    hintText: "Enter your email address",
                    icon: Icons.person,
                    user: user,
                  ),
                  RoundedInputField(
                    obscureText: true,
                    hintText: "Enter your password",
                    icon: Icons.lock,
                    user: user,
                  ),
                  RoundedButton(
                    child: _callApi
                        ? SpinKitCircle(size: 20.0, color: primaryColor)
                        : Text(
                            "SUBMIT",
                            style: TextStyle(
                              color: primaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                    onPressed: () async {
                      _formKey.currentState!.save();

                      if (emptyFields(user)) {
                        _formKey.currentState!.reset();
                        setState(() {
                          _invalidCredentials = true;
                        });
                        return;
                      }

                      setState(() {
                        _callApi = true;
                      });

                      bool isValidPassword = await validatePassword(user);
                      if (isValidPassword) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                        );
                      } else {
                        _formKey.currentState!.reset();
                        setState(() {
                          _callApi = false;
                          _invalidCredentials = true;
                        });
                      }
                    },
                    backgroundColor: primaryLightColor,
                  ),
                  _invalidCredentials
                      ? Text(
                          "Invalid Credentials",
                          style: TextStyle(
                            color: Colors.red[800],
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      : SizedBox.shrink(),
                  SizedBox(height: size.height * 0.1),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
