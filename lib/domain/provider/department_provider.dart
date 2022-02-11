
import 'package:http/http.dart';
import '../../data/model/department_model.dart';

abstract class DepartmentProvider {
  Future<Response> getDepartments(String path);
  Future<Response> updateDepartment(String path, DepartmentModel degree);
  Future<Response> createDepartment(String path, DepartmentModel degree);
  Future<Response> deleteDepartment(String path);
}