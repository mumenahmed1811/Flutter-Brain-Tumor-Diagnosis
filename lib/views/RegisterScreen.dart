import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '/controllers/UserController.dart';
import '/helpers/design.dart';

import '/helpers/media.dart';
import 'package:flutter/material.dart';
import 'LoginScreen.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  void initState() {
    super.initState();
  }

  bool isLoading = false;
  final _formKey = new GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  var nameController = TextEditingController();
  var emailController = TextEditingController();

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
                      "Register New Account",
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
                              height: 25,
                            ),
                            Container(
                              child: Text(
                                "Create a new account and reach our services",
                                style: TextStyle(
                                    color: getTextGreyColor(),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 20),
                              child: Form(
                                key: _formKey,
                                child: Column(
                                  children: [
                                    getUserTextInput(
                                        label: "Name",
                                        starColor:
                                            Theme.of(context).accentColor,
                                        icon: Icons.person,
                                        validator: validateName,
                                        hintText: 'Enter your name',
                                        controller: nameController),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    getUserTextInput(
                                      label: "E-mail Address",
                                      starColor: Theme.of(context).accentColor,
                                      icon: Icons.email_outlined,
                                      validator: validateEmail,
                                      hintText:
                                          'Enter your e-mail Address',
                                      controller: emailController,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    getUserInputLabel(
                                        label: "Password",
                                        starColor:
                                            Theme.of(context).accentColor),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
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
                                        cursorColor: Colors.black,
                                        validator: validatePassword,
                                        controller: passwordController,
                                        obscureText: true,
                                        decoration: InputDecoration(
                                          hintText: "Enter your password",
                                          border: InputBorder.none,
                                          prefixIcon: Icon(
                                            Icons.lock_open,
                                            color: getIconGreyColor(),
                                          ),

                                          contentPadding: EdgeInsets.fromLTRB(
                                              20.0, 10.0, 20.0, 10.0),
                                        ),
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
                                            label: 'Sign Up',
                                            onPressed: () async {
                                              if (isLoading) return;
                                              if (_formKey.currentState!
                                                  .validate()) {
                                                _formKey.currentState!.save();
                                                setState(() {
                                                  isLoading = true;
                                                });
                                                UserController()
                                                    .register(
                                                  context: context,
                                                  name: nameController.text,
                                                  email: emailController.text,
                                                  password:
                                                      passwordController.text,
                                                )
                                                    .then((value) {
                                                  setState(() {
                                                    isLoading = false;
                                                  });
                                                });
                                              }
                                            },
                                            backgroundColor:
                                                Theme.of(context).accentColor)),
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
                                            label: 'Login',
                                            onPressed: () async {
                                              Navigator.push(context,
                                                  routeAnimated(LoginScreen()));
                                            },
                                            backgroundColor: Colors.white)),
                                  ],
                                ),
                              ),
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

  String? validateEmail(String? value) {
    if (value!.isEmpty) return "Email Cannot be empty";
    if (value.length < 8) return "Email length should be >= 8";
    if (!value.contains('@') || !value.contains('.com'))
      return "Email Format is invalid";
    return null;
  }

  String? validatePassword(String? value) {
    if (value!.isEmpty) return "Password Cannot be empty";
    return null;
  }

  String? validateName(String? value) {
    if (value!.isEmpty) return "Name Cannot be empty";
    if (value.length < 8) return "Name length should be >= 8";
    return null;
  }
}
