
import 'dart:convert';

import 'package:tfg_app/data/model/degree_model.dart';
import 'package:tfg_app/domain/data_repository.dart';

import '../data_provider.dart';

class DataRepositoryImpl implements DataRepository {
  DataRepositoryImpl({required this.provider});

  final DataProvider provider;

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
  Future updateDegree(DegreeModel degree) async {
    final response = await provider.updateDegree("https://politech-manager.herokuapp.com/degree/update", degree);
    if (response.statusCode == 200) {
      return;
    } else {
      return Future.error(response.statusCode);
    }
  }
}