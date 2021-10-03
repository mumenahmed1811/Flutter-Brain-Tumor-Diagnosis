class GeneralResponse {
  bool ?status;
  String ?msg;
  Map<String,dynamic> ?data;
  GeneralResponse({this.status, this.msg,this.data});

  GeneralResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = new Map<String,dynamic>();
      json['data'].forEach((k,v) {
        data![k] = v;
      });
    }
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    data['data'] = this.msg;
    return data;
  }
}
