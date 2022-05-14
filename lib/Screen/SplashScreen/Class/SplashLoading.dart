class ClsSplash {
  Data data;
  int statusCode;
  bool success;

  ClsSplash({this.data, this.statusCode, this.success});

  ClsSplash.fromJson(Map<String, dynamic> json) {
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
  var version;
  bool active;
  List<Images> images;

  Data({this.version, this.active, this.images});

  Data.fromJson(Map<String, dynamic> json) {
    version = json['version'];
    active = json['active'];
    if (json['images'] != null) {
      images = new List<Images>();
      json['images'].forEach((v) {
        images.add(new Images.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['version'] = this.version;
    data['active'] = this.active;
    if (this.images != null) {
      data['images'] = this.images.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Images {
  String image;
  String link;

  Images({this.image, this.link});

  Images.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['link'] = this.link;
    return data;
  }
}
