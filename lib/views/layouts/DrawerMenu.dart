import '../PredictScreen.dart';
import '/controllers/UserController.dart';
import '/views/History/HistoryScreen.dart';

import '../../helpers/design.dart';
import '../../helpers/media.dart';
import 'package:flutter/material.dart';

import '../AboutScreen.dart';

class DrawerMenu extends StatelessWidget {
  final String currentPage;

  DrawerMenu({this.currentPage = ""});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      width: getScreenWidth(context),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 15,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      child: Text(
                        "Brain Tumor Diagnosis",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.cyan),
                      ),
                    ),
                    // splittedLine(context,inlineWidth: 80)
                  ],
                ),
              ),
              Spacer(),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.cyan,
                    size: 35,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),

          SizedBox(
            height: 20,
          ),
          DrawerElement(
            label: "Classify Image",
            icon: Icons.home,
            screen: PredictScreen(),
          ),
          SizedBox(
            height: 20,
          ),
          DrawerElement(
              label: "History",
              icon: Icons.car_repair,
              screen: HistoryScreen()),
          SizedBox(
            height: 20,
          ),
          DrawerElement(
              label: "About Us", icon: Icons.search, screen: AboutScreen()),
          SizedBox(
            height: 20,
          ),
          Center(
            child: SizedBox(width: getScreenWidth(context,percentage: 0.6),child: customFormButton(
                label: "Logout",
                onPressed: () {
                  UserController().logout(context);
                },
                backgroundColor: Colors.cyan,color: Colors.white),
          ),)
        ],
      ),
    );
  }
}

class DrawerElement extends StatelessWidget {
  final IconData icon;
  final String label;
  final Widget screen;
  DrawerElement(
      {required this.label, required this.icon, required this.screen});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(routeAnimated(screen));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            child: Icon(
              icon,
              color: Colors.cyan,
              size: 40,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            label,
            style: TextStyle(
                color: Colors.cyan, fontSize: 22),
          ),
        ],
      ),
    );
  }
}
