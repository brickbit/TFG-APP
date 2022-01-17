
import 'package:tfg_app/data/model/degree_model.dart';

abstract class DataRepository {
  Future<List<DegreeModel>> getDegrees();
  Future<List<DegreeModel>> updateDegree(DegreeModel degree);
}