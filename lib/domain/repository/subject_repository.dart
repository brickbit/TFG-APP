
import 'package:tfg_app/data/model/subject_model.dart';

abstract class SubjectRepository {
  Future<List<SubjectModel>> getSubjects();
  Future<List<SubjectModel>> updateSubject(SubjectModel subject);
  Future<List<SubjectModel>> createSubject(SubjectModel subject);
  Future<List<SubjectModel>> deleteSubject(int id);
}