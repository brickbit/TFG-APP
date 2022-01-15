
import 'dart:convert';

class RecoverPasswordModel {
  final bool result;

  RecoverPasswordModel({
    required this.result,
  });

  static RecoverPasswordModel fromRawJson(String str) =>
      RecoverPasswordModel.fromJson(json.decode(str) as Map<String, dynamic>);

  String toRawJson() => json.encode(toJson());

  static RecoverPasswordModel fromJson(dynamic json) => RecoverPasswordModel(
    result: json["result"]
  );

  Map<String, dynamic> toJson() => {
    "result": result
  };
}
