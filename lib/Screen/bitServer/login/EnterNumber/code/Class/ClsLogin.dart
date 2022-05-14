class ClsLogin {
  Data data;
  int statusCode;
  bool success;

  ClsLogin({this.data, this.statusCode, this.success});

  ClsLogin.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    statusCode = json['statusCode'];
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['statusCode'] = this.statusCode;
    data['success'] = this.success;
    return data;
  }
}

class Data {
  int sessionId;
  String Token;


  Data({this.sessionId,this.Token});

  Data.fromJson(Map<String, dynamic> json) {
    sessionId = json['session_id'];
    Token = json['token']!=null?json['token']:"";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['session_id'] = this.sessionId;
    if(data['token']!=null)
    data['token']=this.Token;
    return data;
  }
}