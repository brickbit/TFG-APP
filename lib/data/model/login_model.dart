import 'dart:convert';

class LoginModel {
  final LoginResponseOk? responseOk;
  final LoginResponseKo? responseKo;

  LoginModel({
    required this.responseOk,
    required this.responseKo,
  });

  static LoginModel fromRawJson(String str) =>
      LoginModel.fromJson(json.decode(str) as Map<String, dynamic>);

  String toRawJson() => json.encode(toJson());

  static LoginModel fromJson(dynamic json) => LoginModel(
        responseOk: json["responseOk"] == null
            ? null
            : LoginResponseOk.fromJson(
                json["responseOk"] as Map<String, dynamic>),
        responseKo: json["responseKo"] == null
            ? null
            : LoginResponseKo.fromJson(
                json["responseOk"] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        // ignore: prefer_null_aware_operators
        "ResponseOk": responseOk == null ? null : responseOk?.toJson(),
        // ignore: prefer_null_aware_operators
        "ResponseKo": responseKo == null ? null : responseKo?.toJson(),
      };
}

class LoginResponseOk {
  final String jwt;

  LoginResponseOk({
    required this.jwt,
  });

  factory LoginResponseOk.fromRawJson(String str) =>
      LoginResponseOk.fromJson(json.decode(str) as Map<String, dynamic>);

  String toRawJson() => json.encode(toJson());

  factory LoginResponseOk.fromJson(Map<String, dynamic> json) =>
      LoginResponseOk(jwt: json["jwt"] as String);

  Map<String, dynamic> toJson() => {"jwt": jwt};
}

class LoginResponseKo {
  final int code;

  LoginResponseKo({
    required this.code,
  });

  factory LoginResponseKo.fromRawJson(String str) =>
      LoginResponseKo.fromJson(json.decode(str) as Map<String, dynamic>);

  String toRawJson() => json.encode(toJson());

  factory LoginResponseKo.fromJson(Map<String, dynamic> json) =>
      LoginResponseKo(code: json["code"] as int);

  Map<String, dynamic> toJson() => {"code": code};
}
