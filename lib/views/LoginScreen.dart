import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '/controllers/UserController.dart';
import '/helpers/design.dart';
import '/helpers/media.dart';
import 'package:flutter/material.dart';
import 'PredictScreen.dart';
import 'RegisterScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController passwordController = new TextEditingController();
  var nameController = new TextEditingController();
  var emailController = new TextEditingController();
  final _formKey = new GlobalKey<FormState>();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: Scaffold(
            appBar: AppBar(
              toolbarHeight: 60,
              title: Container(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      "Login",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  SizedBox(height: 5),
                  splittedLine(context, width: 120)
                ],
              )),
              automaticallyImplyLeading: false,
            ),
            body: LoadingOverlay(
                opacity: 0.15,
                progressIndicator: SpinKitWave(
                  color: Colors.cyan,
                  size: 50.0,
                ),
                isLoading: isLoading,
                child: Container(
                    width: getScreenWidth(context),
                    height: getScreenHeight(context),
                    color: Colors.white,
                    child: Container(
                      width: getScreenWidth(context, percentage: 0.8),
                      padding: EdgeInsets.only(right: 15, left: 15),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 50,
                            ),
                            SizedBox(height: 10),
                            Container(
                              child: Text(
                                "Welcome back! login to your account",
                                style: TextStyle(
                                    color: getTextGreyColor(),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 20),
                              child: Form(
                                  key: _formKey,
                                  child: Column(
                                    children: [
                                      getUserTextInput(
                                        hintText:
                                            "Enter your e-mail address",
                                        label: "E-mail Address ",
                                        starColor:
                                            Theme.of(context).accentColor,
                                        icon: Icons.person,
                                        validator: validateEmail,
                                        controller: emailController,
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      getUserInputLabel(
                                          label: "Password ",
                                          starColor:
                                              Theme.of(context).accentColor),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                                spreadRadius: 1,
                                                blurRadius: 7,
                                                offset: Offset(0, 2),
                                                color: getTextGreyColor()),
                                          ],
                                        ),
                                        child: TextFormField(
                                          controller: passwordController,
                                          cursorColor: Colors.black,
                                          obscuringCharacter: "*",
                                          validator: validatePassword,
                                          obscureText: true,
                                          decoration: InputDecoration(
                                              prefixIcon: Icon(
                                                Icons.lock_open,
                                                color: getIconGreyColor(),
                                              ),
                                              hintText:
                                                  "Enter your Password here",
                                              border: InputBorder.none),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      SizedBox(
                                          width: getScreenWidth(context,
                                              percentage: 0.7),
                                          height: getScreenHeight(context,
                                              percentage: 0.07),
                                          child: customFormButton(
                                              label: 'Login',
                                              onPressed: () async {
                                                //Navigator.of(context).push(routeAnimated(HomeScreen()));

                                                if (_formKey.currentState!
                                                    .validate()) {
                                                  if (isLoading)
                                                    return;
                                                  setState(() {
                                                    isLoading = true;
                                                  });
                                                  _formKey.currentState!.save();

                                                  UserController()
                                                      .login(
                                                          context: context,
                                                          email: emailController
                                                              .text,
                                                          password:
                                                              passwordController
                                                                  .text)
                                                      .then((value) {
                                                    setState(() {
                                                      isLoading = false;
                                                    });
                                                  });
                                                }
                                              },
                                              backgroundColor: Theme.of(context)
                                                  .accentColor)),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      SizedBox(
                                          width: getScreenWidth(context,
                                              percentage: 0.7),
                                          height: getScreenHeight(context,
                                              percentage: 0.07),
                                          child: customFormButton(
                                              color: Colors.black,
                                              label: 'Sign Up',
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    routeAnimated(
                                                        RegisterScreen()));
                                              },
                                              backgroundColor: Colors.white)),
                                    ],
                                  )),
                            ),
                            SizedBox(
                              height:
                                  getScreenHeight(context, percentage: 0.15),
                            )
                          ],
                        ),
                      ),
                    )))));
  }

  String? validatePassword(String? value) {
    if (value!.isEmpty) return "Password Cannot be empty";
    return null;
  }

  String? validateEmail(String? value) {
    if (value!.isEmpty) return "Email Cannot be empty";
    if (value.length < 8) return "Email length should be >= 8";
    if (!value.contains('@') || !value.contains('.com'))
      return "Email Format is invalid";
    return null;
  }
}