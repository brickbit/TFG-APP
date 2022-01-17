
import 'package:tfg_app/data/model/classroom_model.dart';

abstract class ClassroomRepository {
  Future<List<ClassroomModel>> getClassrooms();
  Future<List<ClassroomModel>> updateClassroom(ClassroomModel classroom);
  Future<List<ClassroomModel>> createClassroom(ClassroomModel classroom);
  Future<List<ClassroomModel>> deleteClassroom(int id);
}