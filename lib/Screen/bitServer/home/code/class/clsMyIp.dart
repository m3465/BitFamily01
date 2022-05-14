class ClsMyIp {
  DataIp data;
  int statusCode;
  bool success;

  ClsMyIp({this.data, this.statusCode, this.success});

  ClsMyIp.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new DataIp.fromJson(json['data']) : null;
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

class DataIp {
  Ip ip;

  DataIp({this.ip});

  DataIp.fromJson(Map<String, dynamic> json) {
    ip = json['ip'] != null ? new Ip.fromJson(json['ip']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.ip != null) {
      data['ip'] = this.ip.toJson();
    }
    return data;
  }
}

class Ip {
  String status;
  String continent;
  String continentCode;
  String country;
  String countryCode;
  String region;
  String regionName;
  String city;
  String district;
  String zip;
  double lat;
  double lon;
  String timezone;
  int offset;
  String currency;
  String isp;
  String org;
  String as;
  String asname;
  String reverse;
  bool mobile;
  bool proxy;
  bool hosting;
  String query;
  String os;
  String browser;

  Ip(
      {this.status,
        this.continent,
        this.continentCode,
        this.country,
        this.countryCode,
        this.region,
        this.regionName,
        this.city,
        this.district,
        this.zip,
        this.lat,
        this.lon,
        this.timezone,
        this.offset,
        this.currency,
        this.isp,
        this.org,
        this.as,
        this.asname,
        this.reverse,
        this.mobile,
        this.proxy,
        this.hosting,
        this.query,
        this.os,
        this.browser});

  Ip.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    continent = json['continent'];
    continentCode = json['continentCode'];
    country = json['country'];
    countryCode = json['countryCode'];
    region = json['region'];
    regionName = json['regionName'];
    city = json['city'];
    district = json['district'];
    zip = json['zip'];
    lat = json['lat'];
    lon = json['lon'];
    timezone = json['timezone'];
    offset = json['offset'];
    currency = json['currency'];
    isp = json['isp'];
    org = json['org'];
    as = json['as'];
    asname = json['asname'];
    reverse = json['reverse'];
    mobile = json['mobile'];
    proxy = json['proxy'];
    hosting = json['hosting'];
    query = json['query'];
    os = json['os'];
    browser = json['browser'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['continent'] = this.continent;
    data['continentCode'] = this.continentCode;
    data['country'] = this.country;
    data['countryCode'] = this.countryCode;
    data['region'] = this.region;
    data['regionName'] = this.regionName;
    data['city'] = this.city;
    data['district'] = this.district;
    data['zip'] = this.zip;
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    data['timezone'] = this.timezone;
    data['offset'] = this.offset;
    data['currency'] = this.currency;
    data['isp'] = this.isp;
    data['org'] = this.org;
    data['as'] = this.as;
    data['asname'] = this.asname;
    data['reverse'] = this.reverse;
    data['mobile'] = this.mobile;
    data['proxy'] = this.proxy;
    data['hosting'] = this.hosting;
    data['query'] = this.query;
    data['os'] = this.os;
    data['browser'] = this.browser;
    return data;
  }
}
