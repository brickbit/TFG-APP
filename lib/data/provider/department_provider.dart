
import 'dart:convert';
import 'package:http/http.dart';
import '../../domain/provider/department_provider.dart';
import '../model/department_model.dart';

class DepartmentProviderImpl implements DepartmentProvider {
  @override
  Future<Response> getDepartments(String path) {
    return get(Uri.parse(path));
  }

  @override
  Future<Response> updateDepartment(String path, DepartmentModel department) {
    var body = department.toJson();

    return post(
      Uri.parse(path),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(body),
    );
  }

  @override
  Future<Response> createDepartment(String path, DepartmentModel department) {
    var body = department.toJson();

    return post(
      Uri.parse(path),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(body),
    );
  }

  @override
  Future<Response> deleteDepartment(String path) {
    return post(
      Uri.parse(path),
      headers: {'Content-Type': 'application/json'},
    );
  }
}
