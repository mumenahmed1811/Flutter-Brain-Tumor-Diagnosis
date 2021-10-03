import '../models/HistoryElement.dart';

class HistoryResponse {
  bool ?status;
  List<HistoryElement> ?data;
  String ?msg;

  HistoryResponse({this.status, this.data, this.msg});

  HistoryResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data!.add(new HistoryElement.fromJson(v));
      });
    }
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['msg'] = this.msg;
    return data;
  }
}
