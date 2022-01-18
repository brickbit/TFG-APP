
import 'dart:convert';
import 'package:http/http.dart';
import 'model/subject_model.dart';

abstract class SubjectProvider {
  Future<Response> getSubjects(String path);
  Future<Response> updateSubject(String path, SubjectModel subject);
  Future<Response> createSubject(String path, SubjectModel subject);
  Future<Response> deleteSubject(String path);
}

class SubjectProviderImpl implements SubjectProvider {
  @override
  Future<Response> getSubjects(String path) {
    return get(Uri.parse(path));
  }

  @override
  Future<Response> updateSubject(String path, SubjectModel subject) {
    var body = subject.toJson();

    return post(
      Uri.parse(path),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(body),
    );
  }

  @override
  Future<Response> createSubject(String path, SubjectModel subject) {
    var body = subject.toJson();

    return post(
      Uri.parse(path),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(body),
    );
  }

  @override
  Future<Response> deleteSubject(String path) {
    return post(
      Uri.parse(path),
      headers: {'Content-Type': 'application/json'},
    );
  }
}
