import 'package:graduation_project/controllers/UserController.dart';
import 'package:graduation_project/helpers/design.dart';
import 'package:graduation_project/helpers/media.dart';
import 'package:graduation_project/views/AboutScreen.dart';
import 'package:graduation_project/views/LoginScreen.dart';

import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loading_overlay/loading_overlay.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(50, 62, 75, 1),
      body: LoadingOverlay(
          opacity: 0.15,
          progressIndicator: SpinKitWave(
            color: Colors.cyan,
            size: 50.0,
          ),
          isLoading: isLoading,
          child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/images/splash_logo.png"),
                fit: BoxFit.none,
              )),
              height: double.infinity,
              width: getScreenWidth(context),
              padding: EdgeInsets.all(10),
              child: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                    //Image.asset("assets/images/splash_logo.png")
                    SizedBox(
                      height: getScreenHeight(context, percentage: 0.86),
                    ),
                    SizedBox(
                        width: getScreenWidth(context, percentage: 0.4),
                        height: getScreenHeight(context, percentage: 0.07),
                        child: customFormButton(
                            label: 'Start Now',
                            onPressed: () async {
                              if (!isLoading) {
                                setState(() {
                                  isLoading = true;
                                });

                                UserController().me(context).then((value) {
                                  setState(() {
                                    isLoading = false;
                                  });
                                });
                              }
                            },
                            backgroundColor: Colors.white,
                            color: Theme.of(context).accentColor)),
                    isRotated(context)
                        ? SizedBox(
                            height: getScreenHeight(context, percentage: 0.2),
                          )
                        : SizedBox()
                  ])))),
    );
  }
}
