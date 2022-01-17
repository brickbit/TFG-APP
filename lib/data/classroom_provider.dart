
import 'dart:convert';
import 'package:http/http.dart';
import 'model/classroom_model.dart';

abstract class ClassroomProvider {
  Future<Response> getClassrooms(String path);
  Future<Response> updateClassroom(String path, ClassroomModel classroom);
  Future<Response> createClassroom(String path, ClassroomModel classroom);
  Future<Response> deleteClassroom(String path);
}

class ClassroomProviderImpl implements ClassroomProvider {
  @override
  Future<Response> getClassrooms(String path) {
    return get(Uri.parse(path));
  }

  @override
  Future<Response> updateClassroom(String path, ClassroomModel classroom) {
    var body = classroom.toJson();

    return post(
      Uri.parse(path),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(body),
    );
  }

  @override
  Future<Response> createClassroom(String path, ClassroomModel classroom) {
    var body = classroom.toJson();

    return post(
      Uri.parse(path),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(body),
    );
  }

  @override
  Future<Response> deleteClassroom(String path) {
    return post(
      Uri.parse(path),
      headers: {'Content-Type': 'application/json'},
    );
  }
}
