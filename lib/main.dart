import '../views/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'views/LoginScreen.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Brain Tumor Diagnosis',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(255, 255, 255, 1),
        accentColor: Colors.cyan,
        backgroundColor: Color.fromRGBO(0,0,0,1),
      ),
      home: SplashScreen(),
    );
  }
}
