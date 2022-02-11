
import 'package:tfg_app/data/model/classroom_model.dart';
import 'package:tfg_app/data/model/data_model.dart';
import 'package:tfg_app/data/model/degree_model.dart';
import 'package:tfg_app/data/model/department_model.dart';
import 'package:tfg_app/data/model/subject_model.dart';

abstract class DataRepository {
  Future<DataModel> getData();
  Future<DataModel> createDegree(DegreeModel degree);
  Future<DataModel> deleteDegree(int id);
  Future<DataModel> updateDegree(DegreeModel degree);
  Future<DataModel> updateClassroom(ClassroomModel classroom);
  Future<DataModel> createClassroom(ClassroomModel classroom);
  Future<DataModel> deleteClassroom(int id);
  Future<DataModel> updateDepartment(DepartmentModel degree);
  Future<DataModel> createDepartment(DepartmentModel degree);
  Future<DataModel> deleteDepartment(int id);
  Future<DataModel> updateSubject(SubjectModel subject);
  Future<DataModel> createSubject(SubjectModel subject);
  Future<DataModel> deleteSubject(int id);
}