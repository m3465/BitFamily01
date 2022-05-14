import 'dart:convert';

class SeverListGenerate {
  List<DataServerList> data;
  String statusCode;
  bool success;

  SeverListGenerate({this.data, this.statusCode, this.success});

  SeverListGenerate.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<DataServerList>();
      json['data'].forEach((v) {
        if (v!=null)
        data.add(new DataServerList.fromJson(v));
      });
    }
    statusCode = json['statusCode'].toString();
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['statusCode'] = this.statusCode.toString();
    data['success'] = this.success;
    return data;
  }
}

class DataServerList {
  String id;
  String userId;
  String ip;
  String serviceId;
  String price;
  String expireDate;
  String port;
  SeverConfig serviceMeta;
  String status;
  String expireDay;
  String createdAt;
  String updatedAt;

  DataServerList(
      {this.id,
        this.userId,
        this.serviceId,
        this.price,
        this.expireDate,this.expireDay,
        this.serviceMeta,
        this.status,
        this.createdAt,
        this.updatedAt});

  DataServerList.fromJson(Map<String, dynamic> json) {
    try {
      print(json['id'].toString());
      id = json['id'].toString();
      userId = json['user_id'].toString();
      serviceId = json['service_id'].toString();
      price = json['price'].toString();
      ip = json['ip'].toString();
      expireDate = json['expire_date'].toString();
      port = json['port'].toString();
      expireDay = json['Expire_day'].toString();
      serviceMeta = SeverConfig.fromJson(jsonDecode(json['service_meta']));

      status = json['status'].toString();
      createdAt = json['created_at'].toString();
      updatedAt = json['updated_at'].toString();
    }
    catch(e)
    {

    }
    }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id.toString();
    data['user_id'] = this.userId.toString();
    data['service_id'] = this.serviceId.toString();
    data['price'] = this.price.toString();
    data['port'] = this.port.toString();
    data['expire_date'] = this.expireDate.toString();
    data['Expire_day'] = this.expireDay.toString();
    data['service_meta'] =jsonEncode( this.serviceMeta.toJson());
    data['status'] = this.status.toString();
    data['created_at'] = this.createdAt.toString();
    data['updated_at'] = this.updatedAt.toString();
    return data;
  }
}

class SeverConfig {
  String id;
  String title;
  String country;
  String description;
  String price;
  String days;
  String charge;
  String token;
  String config;
  CountryConfig countryConfig;

  SeverConfig(
      {this.id,
        this.title,
        this.country,
        this.price,
        this.description,
        this.countryConfig,
        this.days,
        this.charge,
        this.token,
        this.config});

  SeverConfig.fromJson(Map<String, dynamic> json) {
    countryConfig = CountryConfig.fromJson(jsonDecode(json['meta'])['country']);
    id = json['id'].toString();
    title = json['title'].toString();
    country = json['country'].toString();
    price = json['price'].toString();
    description = json['description'].toString();
    days = json['days'].toString();
    charge = json['charge'].toString();
    token = json['token'].toString();
    config = json['config'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id.toString();
    data['title'] = this.title.toString();
    data['country'] = this.country.toString();
    data['meta']= jsonEncode({"country":this.countryConfig.toJson()});
    data['price'] = this.price.toString();
    data['description'] = this.description.toString();
    data['days'] = this.days.toString();
    data['charge'] = this.charge.toString();
    data['token'] = this.token.toString();
    data['config'] = this.config.toString();

    return data;
  }
}
class CountryConfig {
  String code;
  String fa;
  String link;

  CountryConfig(
      {this.code,
        this.fa,
});

  CountryConfig.fromJson(Map<String, dynamic> json) {
    fa = json['fa'].toString();
    code = json['code'].toString();
    link = json['link']!=null?json['link']:"";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fa'] = this.fa;
    data['code'] = this.code;
    data['link'] = this.link;
    return data;
  }
}