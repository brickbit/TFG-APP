
import 'dart:convert';
import 'package:http/http.dart';
import 'package:tfg_app/data/model/degree_model.dart';
import '../../domain/provider/degree_provider.dart';

class DegreeProviderImpl implements DegreeProvider {
  @override
  Future<Response> getDegrees(String path) {
    return get(Uri.parse(path));
  }

  @override
  Future<Response> updateDegree(String path, DegreeModel degree) {
    var body = degree.toJson();

    return post(
      Uri.parse(path),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(body),
    );
  }

  @override
  Future<Response> createDegree(String path, DegreeModel degree) {
    var body = degree.toJson();

    return post(
      Uri.parse(path),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(body),
    );
  }

  @override
  Future<Response> deleteDegree(String path) {
    return post(
      Uri.parse(path),
      headers: {'Content-Type': 'application/json'},
    );
  }
}
