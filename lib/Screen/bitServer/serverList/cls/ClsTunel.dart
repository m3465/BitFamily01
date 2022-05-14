class ClsTunel {
  List<DataTunels> data;
  int statusCode;
  bool success;

  ClsTunel({this.data, this.statusCode, this.success});

  ClsTunel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<DataTunels>();
      json['data'].forEach((v) {
        data.add(new DataTunels.fromJson(v));
      });
    }
    statusCode = json['statusCode'];
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['statusCode'] = this.statusCode;
    data['success'] = this.success;
    return data;
  }
}

class DataTunels{
  String country;
  String remoteHost;
  String credentials;
  String code;
  int localPort;
  int forwardPort;

  DataTunels(
      {this.country,
        this.remoteHost,this.code,
        this.credentials,
        this.localPort,
        this.forwardPort});

  DataTunels.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    remoteHost = json['remoteHost'];
    code = json['code'];
    credentials = json['credentials'];
    localPort = json['localPort'];
    forwardPort = json['forward_port'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country'] = this.country;
    data['remoteHost'] = this.remoteHost;
    data['code'] = this.code;
    data['credentials'] = this.credentials;
    data['localPort'] = this.localPort;
    data['forward_port'] = this.forwardPort;
    return data;
  }
}
