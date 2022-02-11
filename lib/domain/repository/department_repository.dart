
import 'package:tfg_app/data/model/department_model.dart';

abstract class DepartmentRepository {
  Future<List<DepartmentModel>> getDepartments();
  Future<List<DepartmentModel>> updateDepartment(DepartmentModel degree);
  Future<List<DepartmentModel>> createDepartment(DepartmentModel degree);
  Future<List<DepartmentModel>> deleteDepartment(int id);
}