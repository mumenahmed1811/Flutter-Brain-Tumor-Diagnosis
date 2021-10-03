import 'package:graduation_project/models/HistoryResponse.dart';
import 'package:graduation_project/models/Result.dart';

class ResultResponse {
  bool ?status;
  Result ?data;
  String ?msg;

  ResultResponse({this.status, this.data, this.msg});

  ResultResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Result.fromJson(json['data']) : null;
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['msg'] = this.msg;
    return data;
  }
}
