
import 'package:http/http.dart';
import '../../data/model/subject_model.dart';

abstract class SubjectProvider {
  Future<Response> getSubjects(String path);
  Future<Response> updateSubject(String path, SubjectModel subject);
  Future<Response> createSubject(String path, SubjectModel subject);
  Future<Response> deleteSubject(String path);
}