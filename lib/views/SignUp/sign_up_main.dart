import 'package:flutter/material.dart';
import '../SignUp/sign_up_body.dart';

class SignUpMain extends StatefulWidget {
  @override
  _SignUpMainState createState() => _SignUpMainState();
}

class _SignUpMainState extends State<SignUpMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("Sign Up", style: TextStyle(color: Colors.black),),
      ),
      body: SignUpBody(),
    );
  }
}
