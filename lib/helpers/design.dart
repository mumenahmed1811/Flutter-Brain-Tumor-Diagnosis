
import 'package:flutter/material.dart';

import 'media.dart';


// Alerts
void failAlert({required BuildContext context,required String msg}){
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: Duration(seconds: 5),
      content: Text(msg),
      backgroundColor: Colors.red,
    ),
  );
}
void successAlert({required BuildContext context,required String msg}){
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: Duration(seconds: 5),
      content: Text(msg),
      backgroundColor: Theme.of(context).accentColor,
    ),
  );
}

// Widgets

Widget splittedLine(BuildContext context,{double width = 150,double ?inlineWidth,double height = 3}){
  inlineWidth = inlineWidth != null? inlineWidth:width * 0.8;
  return Container(
      width: width,
      color:getTextGreyColor(),
      child:Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [Container(width: inlineWidth,height: height,color: Theme.of(context).accentColor,)],)
  );
}

textField(context,
    {required String label,
      Color ?starColor,
      required IconData icon,
      required var onChanged}) {
  starColor = Theme.of(context).accentColor;
  return SizedBox(
      width: getScreenWidth(context, percentage: 0.9),
      child: Container(
        child: Column(
          children: [
            getUserInputLabel(label: label, starColor: starColor),
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
              child: TextField(
                cursorColor: Colors.black,
                obscuringCharacter: "*",
                onChanged: onChanged,
                decoration: InputDecoration(
                  hintStyle: TextStyle(color: Theme.of(context)
                      .bottomAppBarColor),
                  hintText: label,
                  prefixIcon: Icon(
                    icon,
                    color: getIconGreyColor(),
                  ),
                  border: InputBorder.none,
                ),

              ),
            )
          ],
        ),
      ));
}


Widget customFormButton({required String label,double fontSize = 20, Color color = Colors.white,required var onPressed,required Color backgroundColor}){
  return ElevatedButton(
    onPressed: onPressed,
    child: Text(
      label,
      style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold,color: color),
    ),
    style: ElevatedButton.styleFrom(
        primary: backgroundColor,
        shape: StadiumBorder()),
  );
}
Widget getUserTextInput(
    {required String label,
    required Color starColor,
    required IconData icon,
    required Function validator,
    required String hintText,
    required var controller
    }) {
  return Container(
    child: Column(
      children: [
        getUserInputLabel(label: label, starColor: starColor),
        getUserTextContainer(validator: validator, icon: icon,hintText: hintText, controller: controller),
      ],
    ),
  );
}

Widget getUserTextContainer(
    {required IconData icon, required var validator,required String hintText,required controller}) {
  return Container(
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
      controller: controller,
      cursorColor: Colors.black,
      obscuringCharacter: "*",
      validator: validator,
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: getIconGreyColor(),
        ),
        hintText: hintText,
        border: InputBorder.none
      ),
    ),
  );
}

Widget getUserInputLabel({required String label, required Color starColor}) {
  return Container(
    margin: EdgeInsets.only(bottom: 7,right: 5),
    child: Row(
      children: [
        Text("* ",
            style: TextStyle(color: starColor, fontWeight: FontWeight.bold)),
        Text(label, style: getInputTextStyle()),
      ],
    ),
  );
}

// Colors and Styles
TextStyle getInputTextStyle() {
  return TextStyle(
      fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold);
}

Color getTextGreyColor() {
  return Color.fromRGBO(221, 221, 221, 1);
}

Color getIconGreyColor() {
  return Color.fromRGBO(230, 230, 230, 1);
}

ThemeData getThemeData() {
  return ThemeData(
    secondaryHeaderColor: Color.fromRGBO(13, 116, 127, 1),
    //primaryColor: Color(0xFF2e4082),
    accentColor: Color.fromRGBO(50, 224, 196, 1),
    //cardColor: Color(0xFF807b78),
    fontFamily: 'Cairo',
    bottomAppBarColor: Color.fromRGBO(13, 115, 119, 1)
  );
}



// routing with Animation
Route routeAnimated(var screen) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => screen,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
