
import 'package:tfg_app/data/model/degree_model.dart';

abstract class DegreeRepository {
  Future<List<DegreeModel>> getDegrees();
  Future<List<DegreeModel>> updateDegree(DegreeModel degree);
  Future<List<DegreeModel>> createDegree(DegreeModel degree);
  Future<List<DegreeModel>> deleteDegree(int id);
}