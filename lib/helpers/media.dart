import 'package:flutter/cupertino.dart';

bool isRotated(BuildContext context){
  print(getScreenHeight(context));
  if (MediaQuery.of(context).orientation == Orientation.landscape)
    return true;
  return false;
}
getScreenHeight(BuildContext context,{double percentage = 1.0}){
  return MediaQuery.of(context).size.height * percentage;
}

getScreenWidth(BuildContext context,{double percentage = 1.0}){
  return MediaQuery.of(context).size.width * percentage;
}