
import 'dart:convert';
import 'package:tfg_app/data/model/subject_model.dart';
import 'package:tfg_app/domain/subject_repository.dart';
import '../subject_provider.dart';

class SubjectRepositoryImpl implements SubjectRepository {
  SubjectRepositoryImpl({required this.provider});

  final SubjectProvider provider;

  @override
  Future<List<SubjectModel>> getSubjects() async {
    final response = await provider.getSubjects("https://politech-manager.herokuapp.com/subject");
    if (response.statusCode == 200) {
      return SubjectModel.listFromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    } else {
      return Future.error(response.statusCode);
    }
  }

  @override
  Future<List<SubjectModel>> updateSubject(SubjectModel subject) async {
    final response = await provider.updateSubject("https://politech-manager.herokuapp.com/subject/update", subject);
    if (response.statusCode == 200) {
      return getSubjects();
    } else {
      return Future.error(response.statusCode);
    }
  }

  @override
  Future<List<SubjectModel>> createSubject(SubjectModel subject) async {
    final response = await provider.createSubject("https://politech-manager.herokuapp.com/subject", subject);
    if (response.statusCode == 200) {
      return getSubjects();
    } else {
      return Future.error(response.statusCode);
    }
  }

  @override
  Future<List<SubjectModel>> deleteSubject(int id) async {
    final response = await provider.deleteSubject("https://politech-manager.herokuapp.com/subject/delete/$id");
    if (response.statusCode == 200) {
      return getSubjects();
    } else {
      return Future.error(response.statusCode);
    }
  }

}