import 'package:graduation_project/views/LoginScreen.dart';
import 'package:graduation_project/views/PredictScreen.dart';

import '../responses/RegisterResponse.dart';

import '/models/User.dart';

import '/views/SplashScreen.dart';
import '/helpers/design.dart';
import 'package:flutter/material.dart';
import '/responses/LoginResponse.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import '/helpers/data.dart';
import 'dart:convert';

class UserController {
  static final UserController _singleton = UserController._internal();
  factory UserController() {
    return _singleton;
  }
  String? token;

  User? user;

  UserController._internal();

  Future<void> login(
      {required BuildContext context,
      required String email,
      required String password}) async {
    // try {
      // request
      var request =
          http.MultipartRequest('POST', Uri.parse(apiUrl() + 'login'));
      request.fields.addAll({'email': email, 'password': password});

      // send request
      http.StreamedResponse response = await request.send();

      // receive request
      String responseBody = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        // handle if arrived successfully
        var result = LoginResponse.fromJson(json.decode(responseBody));
        if (result.status == true) {
          // handle if user entered data successfully (store token and assign data to the controller globally accessed
          user = result.user!;
          token = result.user!.token!;
          var prefs = await getPrefs().then((value) => value);
          prefs.setString('token', token!);
          successAlert(context: context, msg: result.msg!);
          Navigator.of(context)
              .pushReplacement(routeAnimated(new PredictScreen()));
        } else {
          failAlert(context: context, msg: result.msg!);
        }
      } else {
        failAlert(context: context, msg: "Internet Connection failure");
      }
    // } catch (ex) {
      //
      // print(ex.toString());
     // failAlert(context: context, msg: "Internet Connection failure");
    // }
  }

  Future<void> me(BuildContext context) async {
    // Make as Constructor

    try {
      await getPrefs().then((prefs) async {
        if (prefs.containsKey("token")) {
          var headers = {
            'Authorization': 'Bearer ' + prefs.getString("token")!
          };
          var request = http.Request('POST', Uri.parse(apiUrl() + 'me'));
          request.headers.addAll(headers);

          http.StreamedResponse response = await request.send();
          String responseBody = await response.stream.bytesToString();

          if (response.statusCode == 200) {
            var result = LoginResponse.fromJson(json.decode(responseBody));
            if (result.status == true) {
              token = prefs.getString("token");
              this.user = result.user;
              this.user!.token = token;
              // redirect to home page
              Navigator.of(context)
                  .pushReplacement(routeAnimated(new PredictScreen()));
            } else {
              print(response.statusCode);
              failAlert(context: context, msg: "Internet Connection failure");
              // redirect to login page
              Navigator.of(context)
                  .pushReplacement(routeAnimated(new LoginScreen()));
            }
          } else {
            failAlert(context: context, msg: "Internet Connection failure");
            // pop up a msg with a problem or internet connection
          }
        } else {

          Navigator.push(context, routeAnimated(new LoginScreen()));
          // redirect to login screen
        }
      });
    } catch (ex) {
      //
      failAlert(context: context, msg: "Internet Connection failure");
    }
  }

  Future<void> register(
      {required BuildContext context,
      required String name,
      required String email,
      required String password}) async {
    try {
      // validate inputs there
      var request =
          http.MultipartRequest('POST', Uri.parse(apiUrl() + 'register'));
      request.fields
          .addAll({'name': name, 'email': email, 'password': password});

      http.StreamedResponse response = await request.send();

      String responseBody = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        // handle if arrived successfully

        var result = RegisterResponse.fromJson(json.decode(responseBody));
        if (result.status == true) {
          successAlert(context: context, msg: result.msg!);
          Navigator.of(context).pushReplacement(routeAnimated(LoginScreen()));
        } else {
          failAlert(context: context, msg: result.msg!);
        }
      } else {
        failAlert(context: context, msg: "Internet Connection failure");
      }
    } catch (ex) {
      print(ex.toString());
      failAlert(context: context, msg: "Internet Connection failure");
    }
  }

  void logout(context) {
    getPrefs().then((value) {
      value.clear();
      Navigator.of(context).pushReplacement(routeAnimated(new LoginScreen()));
    });
  }
}
