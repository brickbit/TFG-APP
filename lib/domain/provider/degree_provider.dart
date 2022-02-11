
import 'package:http/http.dart';
import 'package:tfg_app/data/model/degree_model.dart';

abstract class DegreeProvider {
  Future<Response> getDegrees(String path);
  Future<Response> updateDegree(String path, DegreeModel degree);
  Future<Response> createDegree(String path, DegreeModel degree);
  Future<Response> deleteDegree(String path);
}