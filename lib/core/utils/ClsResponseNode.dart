class ResponseNode{
  String nameFunction;
  var msg;
  String success;
  String code;

  ResponseNode.fromJson(Map<String,dynamic>json)
  {
    nameFunction =json['name'].toString().trim();
    msg = json['msg'];
    success = json['success'].toString().trim();
    code = json['code'].toString().trim();
  }
}