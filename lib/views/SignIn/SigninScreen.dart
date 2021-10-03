import 'package:graduation_project/controllers/DiagnosisController.dart';
import 'package:graduation_project/controllers/UserController.dart';
import 'package:graduation_project/views/custom_widgets/CustomButton.dart';
import 'package:flutter/material.dart';

import '../layouts/DrawerMenu.dart';

class SigninScreen extends StatefulWidget {
  @override
  _SigninScreenState createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final _formKey = new GlobalKey<FormState>();
  var emailController = new TextEditingController();
  var passwordController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerMenu(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("Login", style: TextStyle(color: Colors.black),),
      ),
      body: Form(
        key: _formKey,
        child: Padding(padding: EdgeInsets.all(20),
          child: Column(
            children: [
              getUserEmailInput(),
              SizedBox(height: 20,),
              getUserPasswordInput(),
              SizedBox(height: 20,),

              CustomButton("Sign In", (){
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  // if all are valid then go to success screen
                  UserController().login(context: context, email: emailController.text, password: passwordController.text);
                }
              }),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField getUserEmailInput() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: emailController,

      validator: validateEmail,
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(
          Icons.mail,
          color: Colors.grey,
          size: 25.0,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 20),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: Colors.grey),
          gapPadding: 10,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: Colors.grey),
          gapPadding: 10,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: Colors.grey),
          gapPadding: 10,
        ),
      ),

    );
  }
  String ?validateEmail(String ?value){
    if(value!.isEmpty)
      return "Email Cannot be empty";
    if( value.length < 8)
      return "Email length should be >= 8";
    if(!value.contains('@') || !value.contains('.com'))
      return "Email Format is invalid";
    return null;
  }

  String ?validatePassword(String ?value){
    if(value!.isEmpty)
      return "Password Cannot be empty";
    // if(value.length < 8)
    //   return "Password length should be >= 8";
    return null;

  }
  TextFormField getUserPasswordInput() {
    return TextFormField(
      controller: passwordController,
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      validator: validatePassword,
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your Password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(
          Icons.lock,
          color: Colors.grey,
          size: 25.0,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 20),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: Colors.grey),
          gapPadding: 10,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: Colors.grey),
          gapPadding: 10,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: Colors.grey),
          gapPadding: 10,
        ),
      ),

    );
  }
}



