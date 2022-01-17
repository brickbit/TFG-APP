
import 'dart:convert';
import 'package:tfg_app/data/model/degree_model.dart';
import 'package:tfg_app/domain/degree_repository.dart';
import '../degree_provider.dart';

class DegreeRepositoryImpl implements DegreeRepository {
  DegreeRepositoryImpl({required this.provider});

  final DegreeProvider provider;

  @override
  Future<List<DegreeModel>> getDegrees() async {
    final response = await provider.getDegrees("https://politech-manager.herokuapp.com/degree");
    if (response.statusCode == 200) {
      return DegreeModel.listFromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    } else {
      return Future.error(response.statusCode);
    }
  }

  @override
  Future<List<DegreeModel>> updateDegree(DegreeModel degree) async {
    final response = await provider.updateDegree("https://politech-manager.herokuapp.com/degree/update", degree);
    if (response.statusCode == 200) {
      return getDegrees();
    } else {
      return Future.error(response.statusCode);
    }
  }

  @override
  Future<List<DegreeModel>> createDegree(DegreeModel degree) async {
    final response = await provider.createDegree("https://politech-manager.herokuapp.com/degree", degree);
    if (response.statusCode == 200) {
      return getDegrees();
    } else {
      return Future.error(response.statusCode);
    }
  }

  @override
  Future<List<DegreeModel>> deleteDegree(int id) async {
    final response = await provider.deleteDegree("https://politech-manager.herokuapp.com/degree/delete/$id");
    if (response.statusCode == 200) {
      return getDegrees();
    } else {
      return Future.error(response.statusCode);
    }
  }
}