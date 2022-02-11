
import 'dart:convert';
import 'package:tfg_app/data/model/department_model.dart';
import 'package:tfg_app/domain/repository/department_repository.dart';
import '../../domain/provider/department_provider.dart';

class DepartmentRepositoryImpl implements DepartmentRepository {
  DepartmentRepositoryImpl({required this.provider});

  final DepartmentProvider provider;

  @override
  Future<List<DepartmentModel>> getDepartments() async {
    final response = await provider.getDepartments("https://politech-manager.herokuapp.com/department");
    if (response.statusCode == 200) {
      return DepartmentModel.listFromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    } else {
      return Future.error(response.statusCode);
    }
  }

  @override
  Future<List<DepartmentModel>> updateDepartment(DepartmentModel degree) async {
    final response = await provider.updateDepartment("https://politech-manager.herokuapp.com/department/update", degree);
    if (response.statusCode == 200) {
      return getDepartments();
    } else {
      return Future.error(response.statusCode);
    }
  }

  @override
  Future<List<DepartmentModel>> createDepartment(DepartmentModel degree) async {
    final response = await provider.createDepartment("https://politech-manager.herokuapp.com/department", degree);
    if (response.statusCode == 200) {
      return getDepartments();
    } else {
      return Future.error(response.statusCode);
    }
  }

  @override
  Future<List<DepartmentModel>> deleteDepartment(int id) async {
    final response = await provider.deleteDepartment("https://politech-manager.herokuapp.com/department/delete/$id");
    if (response.statusCode == 200) {
      return getDepartments();
    } else {
      return Future.error(response.statusCode);
    }
  }
}