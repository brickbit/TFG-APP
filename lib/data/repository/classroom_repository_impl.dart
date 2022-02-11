
import 'dart:convert';
import 'package:tfg_app/data/model/classroom_model.dart';
import 'package:tfg_app/domain/repository/classroom_repository.dart';

import '../../domain/provider/classroom_provider.dart';

class ClassroomRepositoryImpl implements ClassroomRepository {
  ClassroomRepositoryImpl({required this.provider});

  final ClassroomProvider provider;

  @override
  Future<List<ClassroomModel>> getClassrooms() async {
    final response = await provider.getClassrooms("https://politech-manager.herokuapp.com/classroom");
    if (response.statusCode == 200) {
      return ClassroomModel.listFromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    } else {
      return Future.error(response.statusCode);
    }
  }

  @override
  Future<List<ClassroomModel>> updateClassroom(ClassroomModel classroom) async {
    final response = await provider.updateClassroom("https://politech-manager.herokuapp.com/classroom/update", classroom);
    if (response.statusCode == 200) {
      return getClassrooms();
    } else {
      return Future.error(response.statusCode);
    }
  }

  @override
  Future<List<ClassroomModel>> createClassroom(ClassroomModel classroom) async {
    final response = await provider.createClassroom("https://politech-manager.herokuapp.com/classroom", classroom);
    if (response.statusCode == 200) {
      return getClassrooms();
    } else {
      return Future.error(response.statusCode);
    }
  }

  @override
  Future<List<ClassroomModel>> deleteClassroom(int id) async {
    final response = await provider.deleteClassroom("https://politech-manager.herokuapp.com/classroom/delete/$id");
    if (response.statusCode == 200) {
      return getClassrooms();
    } else {
      return Future.error(response.statusCode);
    }
  }

}