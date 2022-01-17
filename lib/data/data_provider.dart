import 'dart:convert';

import 'package:http/http.dart';
import 'package:tfg_app/data/model/degree_model.dart';

abstract class DataProvider {
  Future<Response> getDegrees(String path);
  Future<Response> updateDegree(String path, DegreeModel degree);
}

class DataProviderImpl implements DataProvider {
  @override
  Future<Response> getDegrees(String path) {
    return get(Uri.parse(path));
  }

  @override
  Future<Response> updateDegree(String path, DegreeModel degree) {
    var body = degree.toJson();

    return post(Uri.parse(path),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(body));
  }
}
