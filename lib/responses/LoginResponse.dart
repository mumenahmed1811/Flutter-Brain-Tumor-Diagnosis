import '../models/User.dart';

class LoginResponse {
  bool ?status;
  String ?msg;
  User ?user;

  LoginResponse({this.status, this.msg, this.user});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    user = json['data'] != null ? new User.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.user != null) {
      data['data'] = this.user!.toJson();
    }
    return data;
  }
}