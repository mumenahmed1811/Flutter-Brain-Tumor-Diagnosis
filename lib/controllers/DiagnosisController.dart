import 'package:graduation_project/controllers/UserController.dart';
import 'package:graduation_project/models/HistoryElement.dart';
import 'package:graduation_project/models/HistoryResponse.dart';
import 'package:graduation_project/responses/ResultResponse.dart';

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

class DiagnosisController {
  static final DiagnosisController _singleton = DiagnosisController._internal();
  factory DiagnosisController() {
    return _singleton;
  }
  String? token;

  User? user;

  DiagnosisController._internal();
  Future<ResultResponse?> predict(
      {required BuildContext context, required String filePath}) async {
    try{
    var headers = {'Authorization': 'Bearer ' + UserController().token!};

    var request =
        http.MultipartRequest('POST', Uri.parse(apiUrl() + 'predict'));

    request.files.add(await http.MultipartFile.fromPath('img', filePath));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    String responseBody = await response.stream.bytesToString();
    print(responseBody);
    if (response.statusCode == 200) {
      var result = ResultResponse.fromJson(json.decode(responseBody));
      return result;
      }
     else {
      failAlert(context: context, msg: "Internet Connection failure");
    }
    }catch(ex){
      failAlert(context: context, msg: "Internet Connection failure");
    }
    return ResultResponse(status: false);
  }

   Future<HistoryResponse?> getHistory({required BuildContext context}) async {
    try{
    var headers = {'Authorization': 'Bearer ' + UserController().token!};
     var request = http.Request('GET', Uri.parse(apiUrl() + 'user_history'));
     request.headers.addAll(headers);
     http.StreamedResponse response = await request.send();
     String responseBody = await response.stream.bytesToString();
     print(responseBody);
     if (response.statusCode == 200) {
       var result = HistoryResponse.fromJson(json.decode(responseBody));
       return result;
     } else {
       // check internet connection
       print(response.reasonPhrase);
       failAlert(context: context, msg: "Internet Connection failure");
     }
   }catch(ex){
  failAlert(context: context, msg: "Internet Connection failure");
  }
    return HistoryResponse(status: false);
   }

}
