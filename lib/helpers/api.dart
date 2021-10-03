
import 'package:http/http.dart' as http;
import 'data.dart';
import 'dart:async';

import 'design.dart';

Future<String> post(context,{required Map<String,String> requestBody,required String apiName}) async{
  try {
    var request =
        http.MultipartRequest('POST', Uri.parse(apiUrl() + apiName));

    request.fields.addAll(requestBody);

    http.StreamedResponse response = await request.send();
    String responseBody = await response.stream.bytesToString();
    print(response.statusCode);
    if (response.statusCode == 200) {
// handle if arrived successfully
      return responseBody;
    } else {
      failAlert(context: context, msg: "Internet Connection failure");
      return "";
    }
  } catch (ex) {
    failAlert(context: context, msg: ex.toString());
    return "";
  }
}

//
// Future<String> postAuth(context,{required Map<String,String> requestBody,required String apiName}) async{
//   try {
//
//     var request =
//     http.MultipartRequest('POST', Uri.parse(apiUrl() + apiName));
//
//     request.headers.addAll({
//       'Authorization': 'Bearer '+ UserController().token
//     });
//
//     request.fields.addAll(requestBody);
//
//     http.StreamedResponse response = await request.send();
//     String responseBody = await response.stream.bytesToString();
//     print(response.statusCode);
//     if (response.statusCode == 200) {
//       // handle if arrived successfully
//       return responseBody;
//     } else {
//       failAlert(context: context, msg: "Internet Connection failure");
//       return "";
//     }
//   } catch (ex) {
//     failAlert(context: context, msg: ex.toString());
//     return "";
//   }
// }

//
// Future<String> getAuth(context,{@required Map<String,String> requestBody,@required String apiName}) async{
//
//   try {
//     var request =
//     http.MultipartRequest('GET', Uri.parse(apiUrl() + apiName));
//
//     request.headers.addAll({
//       'Authorization': 'Bearer '+ UserController().token
//     });
//
//     request.fields.addAll(requestBody);
//
//     http.StreamedResponse response = await request.send();
//     String responseBody = await response.stream.bytesToString();
//     print(response.statusCode);
//     if (response.statusCode == 200) {
//       // handle if arrived successfully
//       return responseBody;
//     } else {
//       failAlert(context: context, msg: "Internet Connection failure");
//       return "";
//     }
//   } catch (ex) {
//     failAlert(context: context, msg: ex.toString());
//     return "";
//   }
// }
